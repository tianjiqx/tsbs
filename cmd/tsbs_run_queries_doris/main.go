// tsbs_run_queries_doris speed tests ClickHouse using requests from stdin or file.
//
// It reads encoded Query objects from stdin or file, and makes concurrent requests to the provided ClickHouse endpoint.
// This program has no knowledge of the internals of the endpoint.
package main

import (
	"fmt"
	"strings"
	"time"

	"github.com/blagojts/viper"
	"github.com/jmoiron/sqlx"
	_ "github.com/go-sql-driver/mysql"
	"github.com/spf13/pflag"
	"github.com/timescale/tsbs/internal/utils"
	"github.com/timescale/tsbs/pkg/query"
)

// Program option vars:
var (
	chConnect string
	hostsList []string
	user      string
	password  string
	port int

	showExplain bool
)

// Global vars:
var (
	runner *query.BenchmarkRunner
)

// Parse args:
func init() {
	var config query.BenchmarkRunnerConfig
	config.AddToFlagSet(pflag.CommandLine)
	var hosts string

	pflag.String("additional-params", "sslmode=disable",
		"String of additional doris connection parameters, e.g., 'sslmode=disable'.")
	pflag.String("hosts", "localhost",
		"Comma separated list of doris hosts (pass multiple values for sharding reads on a multi-node setup)")
	pflag.String("port", "9030", "Password to connect to doris")
	pflag.String("user", "root", "User to connect to doris as")
	pflag.String("password", "", "Password to connect to doris")

	pflag.Parse()

	err := utils.SetupConfigFile()

	if err != nil {
		panic(fmt.Errorf("fatal error config file: %s", err))
	}

	if err := viper.Unmarshal(&config); err != nil {
		panic(fmt.Errorf("unable to decode config: %s", err))
	}

	chConnect = viper.GetString("additional-params")
	hosts = viper.GetString("hosts")
	user = viper.GetString("user")
	password = viper.GetString("password")
	port = viper.GetInt("port")


	// Parse comma separated string of hosts and put in a slice (for multi-node setups)
	for _, host := range strings.Split(hosts, ",") {
		hostsList = append(hostsList, host)
	}

	runner = query.NewBenchmarkRunner(config)
}

func main() {
	runner.Run(&query.ClickHousePool, newProcessor)
}

// Get the connection string for a connection to PostgreSQL.

// If we're running queries against multiple nodes we need to balance the queries
// across replicas. Each worker is assigned a sequence number -- we'll use that
// to evenly distribute hosts to worker connections
func getConnectString(workerNumber int) string {
	// Round robin the host/worker assignment by assigning a host based on workerNumber % totalNumberOfHosts
	host := hostsList[workerNumber%len(hostsList)]
    return fmt.Sprintf("%s:%s@tcp(%s:%d)/%s", user, password, host, port, runner.DatabaseName())
}

type queryExecutorOptions struct {
	showExplain   bool
	debug         bool
	printResponse bool
}

// query.Processor interface implementation
type processor struct {
	db   *sqlx.DB
	opts *queryExecutorOptions
}

// query.Processor interface implementation
func newProcessor() query.Processor {
	return &processor{}
}

// query.Processor interface implementation
func (p *processor) Init(workerNumber int) {
	p.db = sqlx.MustConnect("mysql", getConnectString(workerNumber))
	p.opts = &queryExecutorOptions{
		// ClickHouse could not do EXPLAIN
		showExplain:   false,
		debug:         runner.DebugLevel() > 0,
		printResponse: runner.DoPrintResponses(),
	}
}

// query.Processor interface implementation
func (p *processor) ProcessQuery(q query.Query, isWarm bool) ([]*query.Stat, error) {
	// No need to run again for EXPLAIN
	if isWarm && p.opts.showExplain {
		return nil, nil
	}

	// Ensure ClickHouse query
	chQuery := q.(*query.ClickHouse)

	start := time.Now()

	// SqlQuery is []byte, so cast is needed
	sql := string(chQuery.SqlQuery)

	// Main action - run the query
	rows, err := p.db.Queryx(sql)
	if err != nil {
		return nil, err
	}

	// Print some extra info if needed
	if p.opts.debug {
		fmt.Println(sql)
	}
// 	if p.opts.printResponse {
// 		prettyPrintResponse(rows, chQuery)
// 	}

	// Finalize the query
	rows.Close()
	took := float64(time.Since(start).Nanoseconds()) / 1e6

	stat := query.GetStat()
	stat.Init(q.HumanLabelName(), took)

	return []*query.Stat{stat}, err
}

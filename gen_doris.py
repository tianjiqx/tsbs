types=["single-groupby-1-1-1", "single-groupby-1-1-12", "single-groupby-1-8-1", "single-groupby-5-1-1", "single-groupby-5-1-12", "single-groupby-5-8-1", "cpu-max-all-1", "cpu-max-all-8", "double-groupby-1", "double-groupby-5", "double-groupby-all", "high-cpu-all", "high-cpu-1", "lastpoint", "groupby-orderby-limit"]

for key in types:

    cmd1 = """
    ./tsbs_generate_queries --use-case="devops" --db-name=benchmark  --seed=123 --scale=400 \
--timestamp-start="2016-01-01T00:00:00Z" \
--timestamp-end="2016-01-04T00:00:01Z" \
--queries=10 --query-type="{}" --format="doris" \
--file=/home/tianjiqx/newdisk/doris-{}
    """.format(key,key)

    print(cmd1)

for key in types:

    cmd2 = """
    ./tsbs_run_queries_doris --db-name=benchmark --file=/home/tianjiqx/newdisk/doris-{} \
--workers=1 --max-queries=10 --results-file=/home/tianjiqx/newdisk/doris-{}.result
    """.format(key,key)

    print(cmd2)



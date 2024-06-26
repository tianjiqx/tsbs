
-- tag 不分离，但是依然保留tagid字段，用来维持有序
-- 考虑，tagid 使用hash_code



CREATE TABLE tags
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `id` UInt32,
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY id
ORDER BY id
SETTINGS index_granularity = 8192;



CREATE TABLE cpu
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `usage_user` Nullable(Float64),
    `usage_system` Nullable(Float64),
    `usage_idle` Nullable(Float64),
    `usage_nice` Nullable(Float64),
    `usage_iowait` Nullable(Float64),
    `usage_irq` Nullable(Float64),
    `usage_softirq` Nullable(Float64),
    `usage_steal` Nullable(Float64),
    `usage_guest` Nullable(Float64),
    `usage_guest_nice` Nullable(Float64),
    `additional_tags` String DEFAULT '',

    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE disk
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `total` Nullable(Float64),
    `free` Nullable(Float64),
    `used` Nullable(Float64),
    `used_percent` Nullable(Float64),
    `inodes_total` Nullable(Float64),
    `inodes_free` Nullable(Float64),
    `inodes_used` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE diskio
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `reads` Nullable(Float64),
    `writes` Nullable(Float64),
    `read_bytes` Nullable(Float64),
    `write_bytes` Nullable(Float64),
    `read_time` Nullable(Float64),
    `write_time` Nullable(Float64),
    `io_time` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE kernel
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `boot_time` Nullable(Float64),
    `interrupts` Nullable(Float64),
    `context_switches` Nullable(Float64),
    `processes_forked` Nullable(Float64),
    `disk_pages_in` Nullable(Float64),
    `disk_pages_out` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE mem
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `total` Nullable(Float64),
    `available` Nullable(Float64),
    `used` Nullable(Float64),
    `free` Nullable(Float64),
    `cached` Nullable(Float64),
    `buffered` Nullable(Float64),
    `used_percent` Nullable(Float64),
    `available_percent` Nullable(Float64),
    `buffered_percent` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE net
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `bytes_sent` Nullable(Float64),
    `bytes_recv` Nullable(Float64),
    `packets_sent` Nullable(Float64),
    `packets_recv` Nullable(Float64),
    `err_in` Nullable(Float64),
    `err_out` Nullable(Float64),
    `drop_in` Nullable(Float64),
    `drop_out` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE nginx
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `accepts` Nullable(Float64),
    `active` Nullable(Float64),
    `handled` Nullable(Float64),
    `reading` Nullable(Float64),
    `requests` Nullable(Float64),
    `waiting` Nullable(Float64),
    `writing` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE postgresl
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `numbackends` Nullable(Float64),
    `xact_commit` Nullable(Float64),
    `xact_rollback` Nullable(Float64),
    `blks_read` Nullable(Float64),
    `blks_hit` Nullable(Float64),
    `tup_returned` Nullable(Float64),
    `tup_fetched` Nullable(Float64),
    `tup_inserted` Nullable(Float64),
    `tup_updated` Nullable(Float64),
    `tup_deleted` Nullable(Float64),
    `conflicts` Nullable(Float64),
    `temp_files` Nullable(Float64),
    `temp_bytes` Nullable(Float64),
    `deadlocks` Nullable(Float64),
    `blk_read_time` Nullable(Float64),
    `blk_write_time` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE redis
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now(),
    `time` String,
    `tags_id` UInt32,
    `uptime_in_seconds` Nullable(Float64),
    `total_connections_received` Nullable(Float64),
    `expired_keys` Nullable(Float64),
    `evicted_keys` Nullable(Float64),
    `keyspace_hits` Nullable(Float64),
    `keyspace_misses` Nullable(Float64),
    `instantaneous_ops_per_sec` Nullable(Float64),
    `instantaneous_input_kbps` Nullable(Float64),
    `instantaneous_output_kbps` Nullable(Float64),
    `connected_clients` Nullable(Float64),
    `used_memory` Nullable(Float64),
    `used_memory_rss` Nullable(Float64),
    `used_memory_peak` Nullable(Float64),
    `used_memory_lua` Nullable(Float64),
    `rdb_changes_since_last_save` Nullable(Float64),
    `sync_full` Nullable(Float64),
    `sync_partial_ok` Nullable(Float64),
    `sync_partial_err` Nullable(Float64),
    `pubsub_channels` Nullable(Float64),
    `pubsub_patterns` Nullable(Float64),
    `latest_fork_usec` Nullable(Float64),
    `connected_slaves` Nullable(Float64),
    `master_repl_offset` Nullable(Float64),
    `repl_backlog_active` Nullable(Float64),
    `repl_backlog_size` Nullable(Float64),
    `repl_backlog_histlen` Nullable(Float64),
    `mem_fragmentation_ratio` Nullable(Float64),
    `used_cpu_sys` Nullable(Float64),
    `used_cpu_user` Nullable(Float64),
    `used_cpu_sys_children` Nullable(Float64),
    `used_cpu_user_children` Nullable(Float64),
    `additional_tags` String DEFAULT '',
    `hostname` Nullable(String),
    `region` Nullable(String),
    `datacenter` Nullable(String),
    `rack` Nullable(String),
    `os` Nullable(String),
    `arch` Nullable(String),
    `team` Nullable(String),
    `service` Nullable(String),
    `service_version` Nullable(String),
    `service_environment` Nullable(String)
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;






-- DoubleDelta + LZ4 + LowCardinality(Float64) + not Nullable


SET allow_suspicious_low_cardinality_types = 1;


CREATE TABLE tags
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
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
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `usage_user` LowCardinality(Float64) CODEC(LZ4),
    `usage_system` LowCardinality(Float64) CODEC(LZ4),
    `usage_idle` LowCardinality(Float64) CODEC(LZ4),
    `usage_nice` LowCardinality(Float64) CODEC(LZ4),
    `usage_iowait` LowCardinality(Float64) CODEC(LZ4),
    `usage_irq` LowCardinality(Float64) CODEC(LZ4),
    `usage_softirq` LowCardinality(Float64) CODEC(LZ4),
    `usage_steal` LowCardinality(Float64) CODEC(LZ4),
    `usage_guest` LowCardinality(Float64) CODEC(LZ4),
    `usage_guest_nice` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE disk
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `total` LowCardinality(Float64) CODEC(LZ4),
    `free` LowCardinality(Float64) CODEC(LZ4),
    `used` LowCardinality(Float64) CODEC(LZ4),
    `used_percent` LowCardinality(Float64) CODEC(LZ4),
    `inodes_total` LowCardinality(Float64) CODEC(LZ4),
    `inodes_free` LowCardinality(Float64) CODEC(LZ4),
    `inodes_used` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE diskio
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `reads` LowCardinality(Float64) CODEC(LZ4),
    `writes` LowCardinality(Float64) CODEC(LZ4),
    `read_bytes` LowCardinality(Float64) CODEC(LZ4),
    `write_bytes` LowCardinality(Float64) CODEC(LZ4),
    `read_time` LowCardinality(Float64) CODEC(LZ4),
    `write_time` LowCardinality(Float64) CODEC(LZ4),
    `io_time` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE kernel
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `boot_time` LowCardinality(Float64) CODEC(LZ4),
    `interrupts` LowCardinality(Float64) CODEC(LZ4),
    `context_switches` LowCardinality(Float64) CODEC(LZ4),
    `processes_forked` LowCardinality(Float64) CODEC(LZ4),
    `disk_pages_in` LowCardinality(Float64) CODEC(LZ4),
    `disk_pages_out` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE mem
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `total` LowCardinality(Float64) CODEC(LZ4),
    `available` LowCardinality(Float64) CODEC(LZ4),
    `used` LowCardinality(Float64) CODEC(LZ4),
    `free` LowCardinality(Float64) CODEC(LZ4),
    `cached` LowCardinality(Float64) CODEC(LZ4),
    `buffered` LowCardinality(Float64) CODEC(LZ4),
    `used_percent` LowCardinality(Float64) CODEC(LZ4),
    `available_percent` LowCardinality(Float64) CODEC(LZ4),
    `buffered_percent` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE net
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `bytes_sent` LowCardinality(Float64) CODEC(LZ4),
    `bytes_recv` LowCardinality(Float64) CODEC(LZ4),
    `packets_sent` LowCardinality(Float64) CODEC(LZ4),
    `packets_recv` LowCardinality(Float64) CODEC(LZ4),
    `err_in` LowCardinality(Float64) CODEC(LZ4),
    `err_out` LowCardinality(Float64) CODEC(LZ4),
    `drop_in` LowCardinality(Float64) CODEC(LZ4),
    `drop_out` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE nginx
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `accepts` LowCardinality(Float64) CODEC(LZ4),
    `active` LowCardinality(Float64) CODEC(LZ4),
    `handled` LowCardinality(Float64) CODEC(LZ4),
    `reading` LowCardinality(Float64) CODEC(LZ4),
    `requests` LowCardinality(Float64) CODEC(LZ4),
    `waiting` LowCardinality(Float64) CODEC(LZ4),
    `writing` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE postgresl
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `numbackends` LowCardinality(Float64) CODEC(LZ4),
    `xact_commit` LowCardinality(Float64) CODEC(LZ4),
    `xact_rollback` LowCardinality(Float64) CODEC(LZ4),
    `blks_read` LowCardinality(Float64) CODEC(LZ4),
    `blks_hit` LowCardinality(Float64) CODEC(LZ4),
    `tup_returned` LowCardinality(Float64) CODEC(LZ4),
    `tup_fetched` LowCardinality(Float64) CODEC(LZ4),
    `tup_inserted` LowCardinality(Float64) CODEC(LZ4),
    `tup_updated` LowCardinality(Float64) CODEC(LZ4),
    `tup_deleted` LowCardinality(Float64) CODEC(LZ4),
    `conflicts` LowCardinality(Float64) CODEC(LZ4),
    `temp_files` LowCardinality(Float64) CODEC(LZ4),
    `temp_bytes` LowCardinality(Float64) CODEC(LZ4),
    `deadlocks` LowCardinality(Float64) CODEC(LZ4),
    `blk_read_time` LowCardinality(Float64) CODEC(LZ4),
    `blk_write_time` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE redis
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `uptime_in_seconds` LowCardinality(Float64) CODEC(LZ4),
    `total_connections_received` LowCardinality(Float64) CODEC(LZ4),
    `expired_keys` LowCardinality(Float64) CODEC(LZ4),
    `evicted_keys` LowCardinality(Float64) CODEC(LZ4),
    `keyspace_hits` LowCardinality(Float64) CODEC(LZ4),
    `keyspace_misses` LowCardinality(Float64) CODEC(LZ4),
    `instantaneous_ops_per_sec` LowCardinality(Float64) CODEC(LZ4),
    `instantaneous_input_kbps` LowCardinality(Float64) CODEC(LZ4),
    `instantaneous_output_kbps` LowCardinality(Float64) CODEC(LZ4),
    `connected_clients` LowCardinality(Float64) CODEC(LZ4),
    `used_memory` LowCardinality(Float64) CODEC(LZ4),
    `used_memory_rss` LowCardinality(Float64) CODEC(LZ4),
    `used_memory_peak` LowCardinality(Float64) CODEC(LZ4),
    `used_memory_lua` LowCardinality(Float64) CODEC(LZ4),
    `rdb_changes_since_last_save` LowCardinality(Float64) CODEC(LZ4),
    `sync_full` LowCardinality(Float64) CODEC(LZ4),
    `sync_partial_ok` LowCardinality(Float64) CODEC(LZ4),
    `sync_partial_err` LowCardinality(Float64) CODEC(LZ4),
    `pubsub_channels` LowCardinality(Float64) CODEC(LZ4),
    `pubsub_patterns` LowCardinality(Float64) CODEC(LZ4),
    `latest_fork_usec` LowCardinality(Float64) CODEC(LZ4),
    `connected_slaves` LowCardinality(Float64) CODEC(LZ4),
    `master_repl_offset` LowCardinality(Float64) CODEC(LZ4),
    `repl_backlog_active` LowCardinality(Float64) CODEC(LZ4),
    `repl_backlog_size` LowCardinality(Float64) CODEC(LZ4),
    `repl_backlog_histlen` LowCardinality(Float64) CODEC(LZ4),
    `mem_fragmentation_ratio` LowCardinality(Float64) CODEC(LZ4),
    `used_cpu_sys` LowCardinality(Float64) CODEC(LZ4),
    `used_cpu_user` LowCardinality(Float64) CODEC(LZ4),
    `used_cpu_sys_children` LowCardinality(Float64) CODEC(LZ4),
    `used_cpu_user_children` LowCardinality(Float64) CODEC(LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;





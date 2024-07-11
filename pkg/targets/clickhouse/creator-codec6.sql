
-- DoubleDelta + Gorilla+ LZ4 + not Nullable + no parttion


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
PRIMARY KEY id
ORDER BY id
SETTINGS index_granularity = 8192;



CREATE TABLE cpu
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `usage_user` Float64 CODEC(Gorilla,LZ4),
    `usage_system` Float64 CODEC(Gorilla,LZ4),
    `usage_idle` Float64 CODEC(Gorilla,LZ4),
    `usage_nice` Float64 CODEC(Gorilla,LZ4),
    `usage_iowait` Float64 CODEC(Gorilla,LZ4),
    `usage_irq` Float64 CODEC(Gorilla,LZ4),
    `usage_softirq` Float64 CODEC(Gorilla,LZ4),
    `usage_steal` Float64 CODEC(Gorilla,LZ4),
    `usage_guest` Float64 CODEC(Gorilla,LZ4),
    `usage_guest_nice` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE disk
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `total` Float64 CODEC(Gorilla,LZ4),
    `free` Float64 CODEC(Gorilla,LZ4),
    `used` Float64 CODEC(Gorilla,LZ4),
    `used_percent` Float64 CODEC(Gorilla,LZ4),
    `inodes_total` Float64 CODEC(Gorilla,LZ4),
    `inodes_free` Float64 CODEC(Gorilla,LZ4),
    `inodes_used` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE diskio
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `reads` Float64 CODEC(Gorilla,LZ4),
    `writes` Float64 CODEC(Gorilla,LZ4),
    `read_bytes` Float64 CODEC(Gorilla,LZ4),
    `write_bytes` Float64 CODEC(Gorilla,LZ4),
    `read_time` Float64 CODEC(Gorilla,LZ4),
    `write_time` Float64 CODEC(Gorilla,LZ4),
    `io_time` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE kernel
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `boot_time` Float64 CODEC(Gorilla,LZ4),
    `interrupts` Float64 CODEC(Gorilla,LZ4),
    `context_switches` Float64 CODEC(Gorilla,LZ4),
    `processes_forked` Float64 CODEC(Gorilla,LZ4),
    `disk_pages_in` Float64 CODEC(Gorilla,LZ4),
    `disk_pages_out` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE mem
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `total` Float64 CODEC(Gorilla,LZ4),
    `available` Float64 CODEC(Gorilla,LZ4),
    `used` Float64 CODEC(Gorilla,LZ4),
    `free` Float64 CODEC(Gorilla,LZ4),
    `cached` Float64 CODEC(Gorilla,LZ4),
    `buffered` Float64 CODEC(Gorilla,LZ4),
    `used_percent` Float64 CODEC(Gorilla,LZ4),
    `available_percent` Float64 CODEC(Gorilla,LZ4),
    `buffered_percent` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE net
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `bytes_sent` Float64 CODEC(Gorilla,LZ4),
    `bytes_recv` Float64 CODEC(Gorilla,LZ4),
    `packets_sent` Float64 CODEC(Gorilla,LZ4),
    `packets_recv` Float64 CODEC(Gorilla,LZ4),
    `err_in` Float64 CODEC(Gorilla,LZ4),
    `err_out` Float64 CODEC(Gorilla,LZ4),
    `drop_in` Float64 CODEC(Gorilla,LZ4),
    `drop_out` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE nginx
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `accepts` Float64 CODEC(Gorilla,LZ4),
    `active` Float64 CODEC(Gorilla,LZ4),
    `handled` Float64 CODEC(Gorilla,LZ4),
    `reading` Float64 CODEC(Gorilla,LZ4),
    `requests` Float64 CODEC(Gorilla,LZ4),
    `waiting` Float64 CODEC(Gorilla,LZ4),
    `writing` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE postgresl
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `numbackends` Float64 CODEC(Gorilla,LZ4),
    `xact_commit` Float64 CODEC(Gorilla,LZ4),
    `xact_rollback` Float64 CODEC(Gorilla,LZ4),
    `blks_read` Float64 CODEC(Gorilla,LZ4),
    `blks_hit` Float64 CODEC(Gorilla,LZ4),
    `tup_returned` Float64 CODEC(Gorilla,LZ4),
    `tup_fetched` Float64 CODEC(Gorilla,LZ4),
    `tup_inserted` Float64 CODEC(Gorilla,LZ4),
    `tup_updated` Float64 CODEC(Gorilla,LZ4),
    `tup_deleted` Float64 CODEC(Gorilla,LZ4),
    `conflicts` Float64 CODEC(Gorilla,LZ4),
    `temp_files` Float64 CODEC(Gorilla,LZ4),
    `temp_bytes` Float64 CODEC(Gorilla,LZ4),
    `deadlocks` Float64 CODEC(Gorilla,LZ4),
    `blk_read_time` Float64 CODEC(Gorilla,LZ4),
    `blk_write_time` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE redis
(
    `created_date` Date DEFAULT today(),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `uptime_in_seconds` Float64 CODEC(Gorilla,LZ4),
    `total_connections_received` Float64 CODEC(Gorilla,LZ4),
    `expired_keys` Float64 CODEC(Gorilla,LZ4),
    `evicted_keys` Float64 CODEC(Gorilla,LZ4),
    `keyspace_hits` Float64 CODEC(Gorilla,LZ4),
    `keyspace_misses` Float64 CODEC(Gorilla,LZ4),
    `instantaneous_ops_per_sec` Float64 CODEC(Gorilla,LZ4),
    `instantaneous_input_kbps` Float64 CODEC(Gorilla,LZ4),
    `instantaneous_output_kbps` Float64 CODEC(Gorilla,LZ4),
    `connected_clients` Float64 CODEC(Gorilla,LZ4),
    `used_memory` Float64 CODEC(Gorilla,LZ4),
    `used_memory_rss` Float64 CODEC(Gorilla,LZ4),
    `used_memory_peak` Float64 CODEC(Gorilla,LZ4),
    `used_memory_lua` Float64 CODEC(Gorilla,LZ4),
    `rdb_changes_since_last_save` Float64 CODEC(Gorilla,LZ4),
    `sync_full` Float64 CODEC(Gorilla,LZ4),
    `sync_partial_ok` Float64 CODEC(Gorilla,LZ4),
    `sync_partial_err` Float64 CODEC(Gorilla,LZ4),
    `pubsub_channels` Float64 CODEC(Gorilla,LZ4),
    `pubsub_patterns` Float64 CODEC(Gorilla,LZ4),
    `latest_fork_usec` Float64 CODEC(Gorilla,LZ4),
    `connected_slaves` Float64 CODEC(Gorilla,LZ4),
    `master_repl_offset` Float64 CODEC(Gorilla,LZ4),
    `repl_backlog_active` Float64 CODEC(Gorilla,LZ4),
    `repl_backlog_size` Float64 CODEC(Gorilla,LZ4),
    `repl_backlog_histlen` Float64 CODEC(Gorilla,LZ4),
    `mem_fragmentation_ratio` Float64 CODEC(Gorilla,LZ4),
    `used_cpu_sys` Float64 CODEC(Gorilla,LZ4),
    `used_cpu_user` Float64 CODEC(Gorilla,LZ4),
    `used_cpu_sys_children` Float64 CODEC(Gorilla,LZ4),
    `used_cpu_user_children` Float64 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;





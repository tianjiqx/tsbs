
-- DoubleDelta + Gorilla+ LZ4 + not Nullable + no parttion + Float32


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
    `usage_user` Float32 CODEC(Gorilla,LZ4),
    `usage_system` Float32 CODEC(Gorilla,LZ4),
    `usage_idle` Float32 CODEC(Gorilla,LZ4),
    `usage_nice` Float32 CODEC(Gorilla,LZ4),
    `usage_iowait` Float32 CODEC(Gorilla,LZ4),
    `usage_irq` Float32 CODEC(Gorilla,LZ4),
    `usage_softirq` Float32 CODEC(Gorilla,LZ4),
    `usage_steal` Float32 CODEC(Gorilla,LZ4),
    `usage_guest` Float32 CODEC(Gorilla,LZ4),
    `usage_guest_nice` Float32 CODEC(Gorilla,LZ4),
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
    `total` Float32 CODEC(Gorilla,LZ4),
    `free` Float32 CODEC(Gorilla,LZ4),
    `used` Float32 CODEC(Gorilla,LZ4),
    `used_percent` Float32 CODEC(Gorilla,LZ4),
    `inodes_total` Float32 CODEC(Gorilla,LZ4),
    `inodes_free` Float32 CODEC(Gorilla,LZ4),
    `inodes_used` Float32 CODEC(Gorilla,LZ4),
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
    `reads` Float32 CODEC(Gorilla,LZ4),
    `writes` Float32 CODEC(Gorilla,LZ4),
    `read_bytes` Float32 CODEC(Gorilla,LZ4),
    `write_bytes` Float32 CODEC(Gorilla,LZ4),
    `read_time` Float32 CODEC(Gorilla,LZ4),
    `write_time` Float32 CODEC(Gorilla,LZ4),
    `io_time` Float32 CODEC(Gorilla,LZ4),
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
    `boot_time` Float32 CODEC(Gorilla,LZ4),
    `interrupts` Float32 CODEC(Gorilla,LZ4),
    `context_switches` Float32 CODEC(Gorilla,LZ4),
    `processes_forked` Float32 CODEC(Gorilla,LZ4),
    `disk_pages_in` Float32 CODEC(Gorilla,LZ4),
    `disk_pages_out` Float32 CODEC(Gorilla,LZ4),
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
    `total` Float32 CODEC(Gorilla,LZ4),
    `available` Float32 CODEC(Gorilla,LZ4),
    `used` Float32 CODEC(Gorilla,LZ4),
    `free` Float32 CODEC(Gorilla,LZ4),
    `cached` Float32 CODEC(Gorilla,LZ4),
    `buffered` Float32 CODEC(Gorilla,LZ4),
    `used_percent` Float32 CODEC(Gorilla,LZ4),
    `available_percent` Float32 CODEC(Gorilla,LZ4),
    `buffered_percent` Float32 CODEC(Gorilla,LZ4),
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
    `bytes_sent` Float32 CODEC(Gorilla,LZ4),
    `bytes_recv` Float32 CODEC(Gorilla,LZ4),
    `packets_sent` Float32 CODEC(Gorilla,LZ4),
    `packets_recv` Float32 CODEC(Gorilla,LZ4),
    `err_in` Float32 CODEC(Gorilla,LZ4),
    `err_out` Float32 CODEC(Gorilla,LZ4),
    `drop_in` Float32 CODEC(Gorilla,LZ4),
    `drop_out` Float32 CODEC(Gorilla,LZ4),
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
    `accepts` Float32 CODEC(Gorilla,LZ4),
    `active` Float32 CODEC(Gorilla,LZ4),
    `handled` Float32 CODEC(Gorilla,LZ4),
    `reading` Float32 CODEC(Gorilla,LZ4),
    `requests` Float32 CODEC(Gorilla,LZ4),
    `waiting` Float32 CODEC(Gorilla,LZ4),
    `writing` Float32 CODEC(Gorilla,LZ4),
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
    `numbackends` Float32 CODEC(Gorilla,LZ4),
    `xact_commit` Float32 CODEC(Gorilla,LZ4),
    `xact_rollback` Float32 CODEC(Gorilla,LZ4),
    `blks_read` Float32 CODEC(Gorilla,LZ4),
    `blks_hit` Float32 CODEC(Gorilla,LZ4),
    `tup_returned` Float32 CODEC(Gorilla,LZ4),
    `tup_fetched` Float32 CODEC(Gorilla,LZ4),
    `tup_inserted` Float32 CODEC(Gorilla,LZ4),
    `tup_updated` Float32 CODEC(Gorilla,LZ4),
    `tup_deleted` Float32 CODEC(Gorilla,LZ4),
    `conflicts` Float32 CODEC(Gorilla,LZ4),
    `temp_files` Float32 CODEC(Gorilla,LZ4),
    `temp_bytes` Float32 CODEC(Gorilla,LZ4),
    `deadlocks` Float32 CODEC(Gorilla,LZ4),
    `blk_read_time` Float32 CODEC(Gorilla,LZ4),
    `blk_write_time` Float32 CODEC(Gorilla,LZ4),
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
    `uptime_in_seconds` Float32 CODEC(Gorilla,LZ4),
    `total_connections_received` Float32 CODEC(Gorilla,LZ4),
    `expired_keys` Float32 CODEC(Gorilla,LZ4),
    `evicted_keys` Float32 CODEC(Gorilla,LZ4),
    `keyspace_hits` Float32 CODEC(Gorilla,LZ4),
    `keyspace_misses` Float32 CODEC(Gorilla,LZ4),
    `instantaneous_ops_per_sec` Float32 CODEC(Gorilla,LZ4),
    `instantaneous_input_kbps` Float32 CODEC(Gorilla,LZ4),
    `instantaneous_output_kbps` Float32 CODEC(Gorilla,LZ4),
    `connected_clients` Float32 CODEC(Gorilla,LZ4),
    `used_memory` Float32 CODEC(Gorilla,LZ4),
    `used_memory_rss` Float32 CODEC(Gorilla,LZ4),
    `used_memory_peak` Float32 CODEC(Gorilla,LZ4),
    `used_memory_lua` Float32 CODEC(Gorilla,LZ4),
    `rdb_changes_since_last_save` Float32 CODEC(Gorilla,LZ4),
    `sync_full` Float32 CODEC(Gorilla,LZ4),
    `sync_partial_ok` Float32 CODEC(Gorilla,LZ4),
    `sync_partial_err` Float32 CODEC(Gorilla,LZ4),
    `pubsub_channels` Float32 CODEC(Gorilla,LZ4),
    `pubsub_patterns` Float32 CODEC(Gorilla,LZ4),
    `latest_fork_usec` Float32 CODEC(Gorilla,LZ4),
    `connected_slaves` Float32 CODEC(Gorilla,LZ4),
    `master_repl_offset` Float32 CODEC(Gorilla,LZ4),
    `repl_backlog_active` Float32 CODEC(Gorilla,LZ4),
    `repl_backlog_size` Float32 CODEC(Gorilla,LZ4),
    `repl_backlog_histlen` Float32 CODEC(Gorilla,LZ4),
    `mem_fragmentation_ratio` Float32 CODEC(Gorilla,LZ4),
    `used_cpu_sys` Float32 CODEC(Gorilla,LZ4),
    `used_cpu_user` Float32 CODEC(Gorilla,LZ4),
    `used_cpu_sys_children` Float32 CODEC(Gorilla,LZ4),
    `used_cpu_user_children` Float32 CODEC(Gorilla,LZ4),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;





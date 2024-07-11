
-- DoubleDelta + LZ4HC + not Nullable




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
    `usage_user` Float64 CODEC(LZ4HC),
    `usage_system` Float64 CODEC(LZ4HC),
    `usage_idle` Float64 CODEC(LZ4HC),
    `usage_nice` Float64 CODEC(LZ4HC),
    `usage_iowait` Float64 CODEC(LZ4HC),
    `usage_irq` Float64 CODEC(LZ4HC),
    `usage_softirq` Float64 CODEC(LZ4HC),
    `usage_steal` Float64 CODEC(LZ4HC),
    `usage_guest` Float64 CODEC(LZ4HC),
    `usage_guest_nice` Float64 CODEC(LZ4HC),
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
    `total` Float64 CODEC(LZ4HC),
    `free` Float64 CODEC(LZ4HC),
    `used` Float64 CODEC(LZ4HC),
    `used_percent` Float64 CODEC(LZ4HC),
    `inodes_total` Float64 CODEC(LZ4HC),
    `inodes_free` Float64 CODEC(LZ4HC),
    `inodes_used` Float64 CODEC(LZ4HC),
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
    `reads` Float64 CODEC(LZ4HC),
    `writes` Float64 CODEC(LZ4HC),
    `read_bytes` Float64 CODEC(LZ4HC),
    `write_bytes` Float64 CODEC(LZ4HC),
    `read_time` Float64 CODEC(LZ4HC),
    `write_time` Float64 CODEC(LZ4HC),
    `io_time` Float64 CODEC(LZ4HC),
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
    `boot_time` Float64 CODEC(LZ4HC),
    `interrupts` Float64 CODEC(LZ4HC),
    `context_switches` Float64 CODEC(LZ4HC),
    `processes_forked` Float64 CODEC(LZ4HC),
    `disk_pages_in` Float64 CODEC(LZ4HC),
    `disk_pages_out` Float64 CODEC(LZ4HC),
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
    `total` Float64 CODEC(LZ4HC),
    `available` Float64 CODEC(LZ4HC),
    `used` Float64 CODEC(LZ4HC),
    `free` Float64 CODEC(LZ4HC),
    `cached` Float64 CODEC(LZ4HC),
    `buffered` Float64 CODEC(LZ4HC),
    `used_percent` Float64 CODEC(LZ4HC),
    `available_percent` Float64 CODEC(LZ4HC),
    `buffered_percent` Float64 CODEC(LZ4HC),
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
    `bytes_sent` Float64 CODEC(LZ4HC),
    `bytes_recv` Float64 CODEC(LZ4HC),
    `packets_sent` Float64 CODEC(LZ4HC),
    `packets_recv` Float64 CODEC(LZ4HC),
    `err_in` Float64 CODEC(LZ4HC),
    `err_out` Float64 CODEC(LZ4HC),
    `drop_in` Float64 CODEC(LZ4HC),
    `drop_out` Float64 CODEC(LZ4HC),
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
    `accepts` Float64 CODEC(LZ4HC),
    `active` Float64 CODEC(LZ4HC),
    `handled` Float64 CODEC(LZ4HC),
    `reading` Float64 CODEC(LZ4HC),
    `requests` Float64 CODEC(LZ4HC),
    `waiting` Float64 CODEC(LZ4HC),
    `writing` Float64 CODEC(LZ4HC),
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
    `numbackends` Float64 CODEC(LZ4HC),
    `xact_commit` Float64 CODEC(LZ4HC),
    `xact_rollback` Float64 CODEC(LZ4HC),
    `blks_read` Float64 CODEC(LZ4HC),
    `blks_hit` Float64 CODEC(LZ4HC),
    `tup_returned` Float64 CODEC(LZ4HC),
    `tup_fetched` Float64 CODEC(LZ4HC),
    `tup_inserted` Float64 CODEC(LZ4HC),
    `tup_updated` Float64 CODEC(LZ4HC),
    `tup_deleted` Float64 CODEC(LZ4HC),
    `conflicts` Float64 CODEC(LZ4HC),
    `temp_files` Float64 CODEC(LZ4HC),
    `temp_bytes` Float64 CODEC(LZ4HC),
    `deadlocks` Float64 CODEC(LZ4HC),
    `blk_read_time` Float64 CODEC(LZ4HC),
    `blk_write_time` Float64 CODEC(LZ4HC),
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
    `uptime_in_seconds` Float64 CODEC(LZ4HC),
    `total_connections_received` Float64 CODEC(LZ4HC),
    `expired_keys` Float64 CODEC(LZ4HC),
    `evicted_keys` Float64 CODEC(LZ4HC),
    `keyspace_hits` Float64 CODEC(LZ4HC),
    `keyspace_misses` Float64 CODEC(LZ4HC),
    `instantaneous_ops_per_sec` Float64 CODEC(LZ4HC),
    `instantaneous_input_kbps` Float64 CODEC(LZ4HC),
    `instantaneous_output_kbps` Float64 CODEC(LZ4HC),
    `connected_clients` Float64 CODEC(LZ4HC),
    `used_memory` Float64 CODEC(LZ4HC),
    `used_memory_rss` Float64 CODEC(LZ4HC),
    `used_memory_peak` Float64 CODEC(LZ4HC),
    `used_memory_lua` Float64 CODEC(LZ4HC),
    `rdb_changes_since_last_save` Float64 CODEC(LZ4HC),
    `sync_full` Float64 CODEC(LZ4HC),
    `sync_partial_ok` Float64 CODEC(LZ4HC),
    `sync_partial_err` Float64 CODEC(LZ4HC),
    `pubsub_channels` Float64 CODEC(LZ4HC),
    `pubsub_patterns` Float64 CODEC(LZ4HC),
    `latest_fork_usec` Float64 CODEC(LZ4HC),
    `connected_slaves` Float64 CODEC(LZ4HC),
    `master_repl_offset` Float64 CODEC(LZ4HC),
    `repl_backlog_active` Float64 CODEC(LZ4HC),
    `repl_backlog_size` Float64 CODEC(LZ4HC),
    `repl_backlog_histlen` Float64 CODEC(LZ4HC),
    `mem_fragmentation_ratio` Float64 CODEC(LZ4HC),
    `used_cpu_sys` Float64 CODEC(LZ4HC),
    `used_cpu_user` Float64 CODEC(LZ4HC),
    `used_cpu_sys_children` Float64 CODEC(LZ4HC),
    `used_cpu_user_children` Float64 CODEC(LZ4HC),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;





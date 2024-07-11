
-- DoubleDelta + Gorilla + not Nullable




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
    `usage_user` Float64 CODEC(Gorilla),
    `usage_system` Float64 CODEC(Gorilla),
    `usage_idle` Float64 CODEC(Gorilla),
    `usage_nice` Float64 CODEC(Gorilla),
    `usage_iowait` Float64 CODEC(Gorilla),
    `usage_irq` Float64 CODEC(Gorilla),
    `usage_softirq` Float64 CODEC(Gorilla),
    `usage_steal` Float64 CODEC(Gorilla),
    `usage_guest` Float64 CODEC(Gorilla),
    `usage_guest_nice` Float64 CODEC(Gorilla),
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
    `total` Float64 CODEC(Gorilla),
    `free` Float64 CODEC(Gorilla),
    `used` Float64 CODEC(Gorilla),
    `used_percent` Float64 CODEC(Gorilla),
    `inodes_total` Float64 CODEC(Gorilla),
    `inodes_free` Float64 CODEC(Gorilla),
    `inodes_used` Float64 CODEC(Gorilla),
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
    `reads` Float64 CODEC(Gorilla),
    `writes` Float64 CODEC(Gorilla),
    `read_bytes` Float64 CODEC(Gorilla),
    `write_bytes` Float64 CODEC(Gorilla),
    `read_time` Float64 CODEC(Gorilla),
    `write_time` Float64 CODEC(Gorilla),
    `io_time` Float64 CODEC(Gorilla),
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
    `boot_time` Float64 CODEC(Gorilla),
    `interrupts` Float64 CODEC(Gorilla),
    `context_switches` Float64 CODEC(Gorilla),
    `processes_forked` Float64 CODEC(Gorilla),
    `disk_pages_in` Float64 CODEC(Gorilla),
    `disk_pages_out` Float64 CODEC(Gorilla),
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
    `total` Float64 CODEC(Gorilla),
    `available` Float64 CODEC(Gorilla),
    `used` Float64 CODEC(Gorilla),
    `free` Float64 CODEC(Gorilla),
    `cached` Float64 CODEC(Gorilla),
    `buffered` Float64 CODEC(Gorilla),
    `used_percent` Float64 CODEC(Gorilla),
    `available_percent` Float64 CODEC(Gorilla),
    `buffered_percent` Float64 CODEC(Gorilla),
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
    `bytes_sent` Float64 CODEC(Gorilla),
    `bytes_recv` Float64 CODEC(Gorilla),
    `packets_sent` Float64 CODEC(Gorilla),
    `packets_recv` Float64 CODEC(Gorilla),
    `err_in` Float64 CODEC(Gorilla),
    `err_out` Float64 CODEC(Gorilla),
    `drop_in` Float64 CODEC(Gorilla),
    `drop_out` Float64 CODEC(Gorilla),
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
    `accepts` Float64 CODEC(Gorilla),
    `active` Float64 CODEC(Gorilla),
    `handled` Float64 CODEC(Gorilla),
    `reading` Float64 CODEC(Gorilla),
    `requests` Float64 CODEC(Gorilla),
    `waiting` Float64 CODEC(Gorilla),
    `writing` Float64 CODEC(Gorilla),
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
    `numbackends` Float64 CODEC(Gorilla),
    `xact_commit` Float64 CODEC(Gorilla),
    `xact_rollback` Float64 CODEC(Gorilla),
    `blks_read` Float64 CODEC(Gorilla),
    `blks_hit` Float64 CODEC(Gorilla),
    `tup_returned` Float64 CODEC(Gorilla),
    `tup_fetched` Float64 CODEC(Gorilla),
    `tup_inserted` Float64 CODEC(Gorilla),
    `tup_updated` Float64 CODEC(Gorilla),
    `tup_deleted` Float64 CODEC(Gorilla),
    `conflicts` Float64 CODEC(Gorilla),
    `temp_files` Float64 CODEC(Gorilla),
    `temp_bytes` Float64 CODEC(Gorilla),
    `deadlocks` Float64 CODEC(Gorilla),
    `blk_read_time` Float64 CODEC(Gorilla),
    `blk_write_time` Float64 CODEC(Gorilla),
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
    `uptime_in_seconds` Float64 CODEC(Gorilla),
    `total_connections_received` Float64 CODEC(Gorilla),
    `expired_keys` Float64 CODEC(Gorilla),
    `evicted_keys` Float64 CODEC(Gorilla),
    `keyspace_hits` Float64 CODEC(Gorilla),
    `keyspace_misses` Float64 CODEC(Gorilla),
    `instantaneous_ops_per_sec` Float64 CODEC(Gorilla),
    `instantaneous_input_kbps` Float64 CODEC(Gorilla),
    `instantaneous_output_kbps` Float64 CODEC(Gorilla),
    `connected_clients` Float64 CODEC(Gorilla),
    `used_memory` Float64 CODEC(Gorilla),
    `used_memory_rss` Float64 CODEC(Gorilla),
    `used_memory_peak` Float64 CODEC(Gorilla),
    `used_memory_lua` Float64 CODEC(Gorilla),
    `rdb_changes_since_last_save` Float64 CODEC(Gorilla),
    `sync_full` Float64 CODEC(Gorilla),
    `sync_partial_ok` Float64 CODEC(Gorilla),
    `sync_partial_err` Float64 CODEC(Gorilla),
    `pubsub_channels` Float64 CODEC(Gorilla),
    `pubsub_patterns` Float64 CODEC(Gorilla),
    `latest_fork_usec` Float64 CODEC(Gorilla),
    `connected_slaves` Float64 CODEC(Gorilla),
    `master_repl_offset` Float64 CODEC(Gorilla),
    `repl_backlog_active` Float64 CODEC(Gorilla),
    `repl_backlog_size` Float64 CODEC(Gorilla),
    `repl_backlog_histlen` Float64 CODEC(Gorilla),
    `mem_fragmentation_ratio` Float64 CODEC(Gorilla),
    `used_cpu_sys` Float64 CODEC(Gorilla),
    `used_cpu_user` Float64 CODEC(Gorilla),
    `used_cpu_sys_children` Float64 CODEC(Gorilla),
    `used_cpu_user_children` Float64 CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;





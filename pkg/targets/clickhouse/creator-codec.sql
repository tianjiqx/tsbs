
-- DoubleDelta + Gorilla + Nullable

CREATE TABLE tags
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
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
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `usage_user` Nullable(Float64) CODEC(Gorilla),
    `usage_system` Nullable(Float64) CODEC(Gorilla),
    `usage_idle` Nullable(Float64) CODEC(Gorilla),
    `usage_nice` Nullable(Float64) CODEC(Gorilla),
    `usage_iowait` Nullable(Float64) CODEC(Gorilla),
    `usage_irq` Nullable(Float64) CODEC(Gorilla),
    `usage_softirq` Nullable(Float64) CODEC(Gorilla),
    `usage_steal` Nullable(Float64) CODEC(Gorilla),
    `usage_guest` Nullable(Float64) CODEC(Gorilla),
    `usage_guest_nice` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE disk
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `total` Nullable(Float64) CODEC(Gorilla),
    `free` Nullable(Float64) CODEC(Gorilla),
    `used` Nullable(Float64) CODEC(Gorilla),
    `used_percent` Nullable(Float64) CODEC(Gorilla),
    `inodes_total` Nullable(Float64) CODEC(Gorilla),
    `inodes_free` Nullable(Float64) CODEC(Gorilla),
    `inodes_used` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;



CREATE TABLE diskio
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `reads` Nullable(Float64) CODEC(Gorilla),
    `writes` Nullable(Float64) CODEC(Gorilla),
    `read_bytes` Nullable(Float64) CODEC(Gorilla),
    `write_bytes` Nullable(Float64) CODEC(Gorilla),
    `read_time` Nullable(Float64) CODEC(Gorilla),
    `write_time` Nullable(Float64) CODEC(Gorilla),
    `io_time` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE kernel
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `boot_time` Nullable(Float64) CODEC(Gorilla),
    `interrupts` Nullable(Float64) CODEC(Gorilla),
    `context_switches` Nullable(Float64) CODEC(Gorilla),
    `processes_forked` Nullable(Float64) CODEC(Gorilla),
    `disk_pages_in` Nullable(Float64) CODEC(Gorilla),
    `disk_pages_out` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE mem
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `total` Nullable(Float64) CODEC(Gorilla),
    `available` Nullable(Float64) CODEC(Gorilla),
    `used` Nullable(Float64) CODEC(Gorilla),
    `free` Nullable(Float64) CODEC(Gorilla),
    `cached` Nullable(Float64) CODEC(Gorilla),
    `buffered` Nullable(Float64) CODEC(Gorilla),
    `used_percent` Nullable(Float64) CODEC(Gorilla),
    `available_percent` Nullable(Float64) CODEC(Gorilla),
    `buffered_percent` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE net
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `bytes_sent` Nullable(Float64) CODEC(Gorilla),
    `bytes_recv` Nullable(Float64) CODEC(Gorilla),
    `packets_sent` Nullable(Float64) CODEC(Gorilla),
    `packets_recv` Nullable(Float64) CODEC(Gorilla),
    `err_in` Nullable(Float64) CODEC(Gorilla),
    `err_out` Nullable(Float64) CODEC(Gorilla),
    `drop_in` Nullable(Float64) CODEC(Gorilla),
    `drop_out` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE nginx
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `accepts` Nullable(Float64) CODEC(Gorilla),
    `active` Nullable(Float64) CODEC(Gorilla),
    `handled` Nullable(Float64) CODEC(Gorilla),
    `reading` Nullable(Float64) CODEC(Gorilla),
    `requests` Nullable(Float64) CODEC(Gorilla),
    `waiting` Nullable(Float64) CODEC(Gorilla),
    `writing` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE postgresl
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `numbackends` Nullable(Float64) CODEC(Gorilla),
    `xact_commit` Nullable(Float64) CODEC(Gorilla),
    `xact_rollback` Nullable(Float64) CODEC(Gorilla),
    `blks_read` Nullable(Float64) CODEC(Gorilla),
    `blks_hit` Nullable(Float64) CODEC(Gorilla),
    `tup_returned` Nullable(Float64) CODEC(Gorilla),
    `tup_fetched` Nullable(Float64) CODEC(Gorilla),
    `tup_inserted` Nullable(Float64) CODEC(Gorilla),
    `tup_updated` Nullable(Float64) CODEC(Gorilla),
    `tup_deleted` Nullable(Float64) CODEC(Gorilla),
    `conflicts` Nullable(Float64) CODEC(Gorilla),
    `temp_files` Nullable(Float64) CODEC(Gorilla),
    `temp_bytes` Nullable(Float64) CODEC(Gorilla),
    `deadlocks` Nullable(Float64) CODEC(Gorilla),
    `blk_read_time` Nullable(Float64) CODEC(Gorilla),
    `blk_write_time` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;


CREATE TABLE redis
(
    `created_date` Date DEFAULT today() CODEC(DoubleDelta),
    `created_at` DateTime DEFAULT now() CODEC(DoubleDelta),
    `time` String,
    `tags_id` UInt32,
    `uptime_in_seconds` Nullable(Float64) CODEC(Gorilla),
    `total_connections_received` Nullable(Float64) CODEC(Gorilla),
    `expired_keys` Nullable(Float64) CODEC(Gorilla),
    `evicted_keys` Nullable(Float64) CODEC(Gorilla),
    `keyspace_hits` Nullable(Float64) CODEC(Gorilla),
    `keyspace_misses` Nullable(Float64) CODEC(Gorilla),
    `instantaneous_ops_per_sec` Nullable(Float64) CODEC(Gorilla),
    `instantaneous_input_kbps` Nullable(Float64) CODEC(Gorilla),
    `instantaneous_output_kbps` Nullable(Float64) CODEC(Gorilla),
    `connected_clients` Nullable(Float64) CODEC(Gorilla),
    `used_memory` Nullable(Float64) CODEC(Gorilla),
    `used_memory_rss` Nullable(Float64) CODEC(Gorilla),
    `used_memory_peak` Nullable(Float64) CODEC(Gorilla),
    `used_memory_lua` Nullable(Float64) CODEC(Gorilla),
    `rdb_changes_since_last_save` Nullable(Float64) CODEC(Gorilla),
    `sync_full` Nullable(Float64) CODEC(Gorilla),
    `sync_partial_ok` Nullable(Float64) CODEC(Gorilla),
    `sync_partial_err` Nullable(Float64) CODEC(Gorilla),
    `pubsub_channels` Nullable(Float64) CODEC(Gorilla),
    `pubsub_patterns` Nullable(Float64) CODEC(Gorilla),
    `latest_fork_usec` Nullable(Float64) CODEC(Gorilla),
    `connected_slaves` Nullable(Float64) CODEC(Gorilla),
    `master_repl_offset` Nullable(Float64) CODEC(Gorilla),
    `repl_backlog_active` Nullable(Float64) CODEC(Gorilla),
    `repl_backlog_size` Nullable(Float64) CODEC(Gorilla),
    `repl_backlog_histlen` Nullable(Float64) CODEC(Gorilla),
    `mem_fragmentation_ratio` Nullable(Float64) CODEC(Gorilla),
    `used_cpu_sys` Nullable(Float64) CODEC(Gorilla),
    `used_cpu_user` Nullable(Float64) CODEC(Gorilla),
    `used_cpu_sys_children` Nullable(Float64) CODEC(Gorilla),
    `used_cpu_user_children` Nullable(Float64) CODEC(Gorilla),
    `additional_tags` String DEFAULT ''
)
    ENGINE = MergeTree
PARTITION BY created_date
PRIMARY KEY (tags_id, created_at)
ORDER BY (tags_id, created_at)
SETTINGS index_granularity = 8192;





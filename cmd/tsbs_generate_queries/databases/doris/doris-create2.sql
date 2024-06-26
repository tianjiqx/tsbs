CREATE TABLE cpu
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `usage_user` FLOAT,
    `usage_system` FLOAT,
    `usage_idle` FLOAT,
    `usage_nice` FLOAT,
    `usage_iowait` FLOAT,
    `usage_irq` FLOAT,
    `usage_softirq` FLOAT,
    `usage_steal` FLOAT,
    `usage_guest` FLOAT,
    `usage_guest_nice` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);



CREATE TABLE devops_disk
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `total` FLOAT,
    `free` FLOAT,
    `used` FLOAT,
    `used_percent` FLOAT,
    `inodes_total` FLOAT,
    `inodes_free` FLOAT,
    `inodes_used` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);



CREATE TABLE diskio
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `reads` FLOAT,
    `writes` FLOAT,
    `read_bytes` FLOAT,
    `write_bytes` FLOAT,
    `read_time` FLOAT,
    `write_time` FLOAT,
    `io_time` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);




CREATE TABLE kernel
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `boot_time` FLOAT,
    `interrupts` FLOAT,
    `context_switches` FLOAT,
    `processes_forked` FLOAT,
    `disk_pages_in` FLOAT,
    `disk_pages_out` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE mem
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `total` FLOAT,
    `available` FLOAT,
    `used` FLOAT,
    `free` FLOAT,
    `cached` FLOAT,
    `buffered` FLOAT,
    `used_percent` FLOAT,
    `available_percent` FLOAT,
    `buffered_percent` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);




CREATE TABLE net
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `bytes_sent` FLOAT,
    `bytes_recv` FLOAT,
    `packets_sent` FLOAT,
    `packets_recv` FLOAT,
    `err_in` FLOAT,
    `err_out` FLOAT,
    `drop_in` FLOAT,
    `drop_out` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);

CREATE TABLE nginx
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `accepts` FLOAT,
    `active` FLOAT,
    `handled` FLOAT,
    `reading` FLOAT,
    `requests` FLOAT,
    `waiting` FLOAT,
    `writing` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);

CREATE TABLE postgresl
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `numbackends` FLOAT,
    `xact_commit` FLOAT,
    `xact_rollback` FLOAT,
    `blks_read` FLOAT,
    `blks_hit` FLOAT,
    `tup_returned` FLOAT,
    `tup_fetched` FLOAT,
    `tup_inserted` FLOAT,
    `tup_updated` FLOAT,
    `tup_deleted` FLOAT,
    `conflicts` FLOAT,
    `temp_files` FLOAT,
    `temp_bytes` FLOAT,
    `deadlocks` FLOAT,
    `blk_read_time` FLOAT,
    `blk_write_time` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE redis
(
    `tags_id` INT,
    `created_at` DATETIME,
    `created_date` DATE,
    `time` VARCHAR(255),
    `uptime_in_seconds` FLOAT,
    `total_connections_received` FLOAT,
    `expired_keys` FLOAT,
    `evicted_keys` FLOAT,
    `keyspace_hits` FLOAT,
    `keyspace_misses` FLOAT,
    `instantaneous_ops_per_sec` FLOAT,
    `instantaneous_input_kbps` FLOAT,
    `instantaneous_output_kbps` FLOAT,
    `connected_clients` FLOAT,
    `used_memory` FLOAT,
    `used_memory_rss` FLOAT,
    `used_memory_peak` FLOAT,
    `used_memory_lua` FLOAT,
    `rdb_changes_since_last_save` FLOAT,
    `sync_full` FLOAT,
    `sync_partial_ok` FLOAT,
    `sync_partial_err` FLOAT,
    `pubsub_channels` FLOAT,
    `pubsub_patterns` FLOAT,
    `latest_fork_usec` FLOAT,
    `connected_slaves` FLOAT,
    `master_repl_offset` FLOAT,
    `repl_backlog_active` FLOAT,
    `repl_backlog_size` FLOAT,
    `repl_backlog_histlen` FLOAT,
    `mem_fragmentation_ratio` FLOAT,
    `used_cpu_sys` FLOAT,
    `used_cpu_user` FLOAT,
    `used_cpu_sys_children` FLOAT,
    `used_cpu_user_children` FLOAT,
    `additional_tags` VARCHAR(255) DEFAULT '',
    `tags` VARIANT,
    INDEX idx_tags (`tags`) USING INVERTED PROPERTIES("parser" = "english")
)
ENGINE=OLAP
DUPLICATE KEY(`tags_id`, `created_at`)
DISTRIBUTED BY HASH(`tags_id`) BUCKETS 1
PROPERTIES (
    "replication_num" = "1"
);







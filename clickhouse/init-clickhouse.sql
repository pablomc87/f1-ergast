CREATE TABLE IF NOT EXISTS races (
    race_id String,
    season UInt32,
    round UInt8,
    race_name String,
    date Date,
    url String
) ENGINE = MergeTree()
ORDER BY race_id;

CREATE TABLE IF NOT EXISTS circuits (
    circuit_str_id String,
    circuit_name String,
    locality String,
    country String,
    lat Float64,
    long Float64,
    url String
) ENGINE = MergeTree()
ORDER BY circuit_str_id;

CREATE TABLE IF NOT EXISTS drivers (
    driver_str_id String,
    given_name String,
    family_name String,
    date_of_birth Date,
    nationality String,
    url String
) ENGINE = MergeTree()
ORDER BY driver_str_id;

CREATE TABLE IF NOT EXISTS constructors (
    constructor_str_id String,
    name String,
    nationality String,
    url String
) ENGINE = MergeTree()
ORDER BY constructor_str_id;

CREATE TABLE IF NOT EXISTS results (
    result_id String,
    race_id String,
    circuit_str_id String,
    driver_str_id String,
    constructor_str_id String,
    position UInt8,
    position_text String,
    points UInt16,
    grid UInt16,
    laps UInt16,
    status String,
    time_millis Nullable(Int64),
    time Nullable(String),
    number String,
    PRIMARY KEY (result_id)
) ENGINE = MergeTree()
ORDER BY result_id;

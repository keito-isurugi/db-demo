CREATE TABLE devices (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE sensor_data (
    id SERIAL PRIMARY KEY,
    device_id INT REFERENCES devices(id),
    timestamp TIMESTAMP NOT NULL,
    temperature NUMERIC(5,2),
    humidity NUMERIC(5,2)
) PARTITION BY RANGE (timestamp);

CREATE TABLE sensor_data_202401 PARTITION OF sensor_data
FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE sensor_data_202402 PARTITION OF sensor_data
FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

-- ダミーデータ
INSERT INTO devices (name) VALUES ('Sensor A'), ('Sensor B');

INSERT INTO sensor_data (device_id, timestamp, temperature, humidity) VALUES 
(1, '2024-01-10 10:00:00', 22.5, 60.0),
(2, '2024-01-11 12:30:00', 21.0, 58.5);

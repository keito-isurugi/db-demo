CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE followers (
    user_id INT REFERENCES users(id),
    follower_id INT REFERENCES users(id),
    PRIMARY KEY (user_id, follower_id)
);

-- ダミーデータ
INSERT INTO users (username) VALUES ('alice'), ('bob');

INSERT INTO posts (user_id, content) VALUES 
(1, 'Hello world!'),
(2, 'PostgreSQL is awesome!');

INSERT INTO followers (user_id, follower_id) VALUES 
(1, 2), -- Bob follows Alice
(2, 1); -- Alice follows Bob

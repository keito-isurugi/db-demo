CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL
);

CREATE TABLE blogs (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    blog_id INT REFERENCES blogs(id),
    user_id INT REFERENCES users(id),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

-- ダミーデータ
INSERT INTO users (username) VALUES ('alice'), ('bob');

INSERT INTO blogs (user_id, title, content) VALUES 
(1, 'My first blog', 'This is the content of my first blog.'),
(2, 'Database Optimization', 'Indexes are important!');

INSERT INTO comments (blog_id, user_id, comment) VALUES 
(1, 2, 'Great post!'),
(2, 1, 'I totally agree.');

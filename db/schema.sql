CREATE DATABASE IF NOT EXISTS complaint_db;
USE complaint_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('Employee','Admin') NOT NULL
);


CREATE TABLE complaints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    status VARCHAR(50) DEFAULT 'Pending',
    remarks VARCHAR(500) DEFAULT '',
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO users (username, password, role) VALUES
('navi', '12345', 'Admin');


INSERT INTO users (username, password, role) VALUES
    ('kasun', '123456', 'Employee');

INSERT INTO users (username, password, role) VALUES
    ('sunil', '1234567', 'Employee');


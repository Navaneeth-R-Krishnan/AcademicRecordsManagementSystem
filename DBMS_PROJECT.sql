CREATE DATABASE IF NOT EXISTS DBMS_ACADEMIC_RECORDS;
USE DBMS_ACADEMIC_RECORDS;

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    department VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE registration (
    s_no INT AUTO_INCREMENT PRIMARY KEY,
    otp VARCHAR(6) NOT NULL,
    timestamp DATE,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE forgotpassword (
    s_no INT AUTO_INCREMENT PRIMARY KEY,
    otp VARCHAR(6) NOT NULL,
    timestamp date,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE publication (
    publication_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    citation TEXT,
    description TEXT,
    date_published DATE,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE patent (
    patent_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    user_id INT NOT NULL,
    patent_by VARCHAR(255),
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    project_by VARCHAR(255),
    description TEXT,
    budget DECIMAL(10, 2),
    status VARCHAR(50),
    funding_agency VARCHAR(255),
    date_of_project DATE,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);


INSERT INTO user (name, email, category, department, password)
VALUES
    ('R Navaneeth', 'rnava@yahoo.com', 'User', 'ComputerScience', '&*$*$UyGv'),
    ('Rithwik B', 'rithwike@hotmail.com', 'Admin', 'IT', '%$DcFUP@#');
SELECT * from user;

INSERT INTO registration (otp, timestamp, email)
VALUES
    ('123456', '2021-10-14','rnava@yahoo.com' ),
    ('789012', '2022-11-18','rithwike@hotmail.com' );
select * from registration;


INSERT INTO forgotpassword (otp, timestamp, email)
VALUES
    ('987654', '2023-10-17', 'rnava@yahoo.com' ),
    ('345678', '2023-10-18','rithwike@hotmail.com' );
select * from forgotpassword;

-- Inserting into the "publication" table
INSERT INTO publication (type, year, title, user_id, citation, description, date_published)
VALUES
    ('Journal Article', 2021, 'Critical cryptosystems in modern architecture', 1, 'NavaneethKrishnan', 'DES and AES', '2021-05-10'),
    ('Conference Paper', 2022, 'Innovations in AI', 2, 'Rithwik', 'GEN AI', '2022-08-25');
select * from publication;

-- Inserting into the "patent" table
INSERT INTO patent (title, year, user_id, patent_by, description)
VALUES
    ('NEW crypto standard', 2021, 2, 'Mns crypt Inc.', 'Quantum algo for advance security'),
    ('ECE Patent', 2023, 1, 'Tech Solutions Ltd.', 'New microarchitecture board');
select * from patent;

-- Inserting into the "project" table
INSERT INTO project (title, user_id, project_by, description, budget, status, funding_agency, date_of_project)
VALUES
    ('MERN Fodd App', 1, 'Avant1', 'Full Stack App', 50000.00, 'In Progress', 'National Science Foundation', '2023-10-20'),
    ('Parking allotmaent system', 2, 'Ashneel', 'An electronic- software project', 75000.50, 'Completed', 'Tech Innovations Inc.', '2023-09-15');
select * from project;











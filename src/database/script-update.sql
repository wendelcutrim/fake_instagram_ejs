DROP DATABASE IF EXISTS fake_instagram;

CREATE DATABASE fake_instagram;

USE fake_instagram;

CREATE TABLE fake_instagram.users (
	id int(10) PRIMARY KEY auto_increment,
	name varchar(200),
	email varchar(200),
	password varchar(200),
	avatar varchar(200),
	create_at TIMESTAMP  
);

ALTER TABLE fake_instagram.users ADD username varchar(200) AFTER password;

SELECT * FROM fake_instagram.users;

INSERT INTO users VALUES (null, "teste", "teste@email.com", "123", "testeteste", null);

ALTER TABLE users MODIFY column password varchar(256);

CREATE TABLE publications (
	id int(10) primary key AUTO_INCREMENT,
	image varchar(200),
	content varchar(200),
	user_id int(10),
	create_at timestamp,
	foreign key (user_id) references users(id)
);

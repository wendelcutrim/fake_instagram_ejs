CREATE TABLE fake_instagram.comments(
    id int(10) PRIMARY KEY auto_increment,
    content varchar(200),
    user_id int(10),
    publication_id int(10),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (publication_id) REFERENCES publications(id),
    create_at TIMESTAMP
);
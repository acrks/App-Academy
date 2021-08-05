DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO 
users(fname, lname)
VALUES
    ('Arwen', 'Kim'),
    ('Alex', 'Crooks');

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY(author_id) REFERENCES users(id)
);

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('Arwen''s Question', 'Does the order of DROP TABLE statements matter?', (SELECT id FROM users WHERE fname = 'Arwen' AND lname = 'Kim')),
    ('Alex''s Question', 'Do Big O times really matter?', (SELECT id FROM users WHERE fname = 'Alex' AND lname = 'Crooks'));

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Arwen' AND lname = 'Kim'), (SELECT id FROM questions WHERE title = 'Arwen''s Question')),
    ((SELECT id FROM users WHERE fname = 'Alex' AND lname = 'Crooks'), (SELECT id FROM questions WHERE title = 'Alex''s Question'));

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(parent_reply_id) REFERENCES replies(id)
);

INSERT INTO
    replies(question_id, parent_reply_id, user_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'Arwen''s Question'), null, (SELECT id FROM users WHERE fname = 'Arwen' AND lname = 'Kim'), 'Body_text'),
    ((SELECT id FROM questions WHERE title = 'Alex''s Question'), null, (SELECT id FROM users WHERE fname = 'Alex' AND lname = 'Crooks'), 'Of course');

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Arwen' AND lname = 'Kim'), (SELECT id FROM questions WHERE title = 'Arwen''s Question')),
    ((SELECT id FROM users WHERE fname = 'Alex' AND lname = 'Crooks'), (SELECT id FROM questions WHERE title = 'Alex''s Question'));



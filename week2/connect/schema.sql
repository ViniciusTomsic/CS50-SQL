DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS schools;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS connection_people;
DROP TABLE IF EXISTS connection_school;
DROP TABLE IF EXISTS connection_companies;

CREATE TABLE users (
    "id",
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE schools (
    "id",
    "name" TEXT,
    "type" TEXT CHECK ("type" IN ('Elementary School', 'Middle School', 'High School', 'Lower School', 'Upper School', 'College', 'University')),
    "location" TEXT,
    "year" INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE companies (
    "id",
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    PRIMARY KEY (id)
);


CREATE TABLE connection_people (
    "id",
    "user" INTEGER,
    "user2" INTEGER,
    FOREIGN KEY (user) REFERENCES users(id),
    FOREIGN KEY (user2) REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE TABLE connection_school (
    "id",
    "user_id" INTEGER,
    "school_id" INTEGER,
    "initial_date" DATE NOT NULL,
    "end_date" DATE,
    "type_of_degree" TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools(id),
    PRIMARY KEY (id)
);

CREATE TABLE connection_companies (
    "id",
    "user_id" INTEGER,
    "companie_id" INTEGER,
    "initial_date" DATE NOT NULL,
    "end_date" DATE,
    "title" TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (companie_id) REFERENCES companies(id),
    PRIMARY KEY (id)
);


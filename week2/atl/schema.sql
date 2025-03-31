DROP TABLE IF EXISTS checkins;
DROP TABLE IF EXISTS passengers;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS flight;

CREATE TABLE passengers (
    id INTEGER,
    first_name TEXT,
    last_name TEXT,
    age INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE checkins (
    id INTEGER,
    passenger_id INTEGER,
    checkin_date DATETIME,
    flight_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(id)
);

CREATE TABLE airlines (
    id INTEGER,
    section_A INTEGER CHECK (section_A IN (0, 1)),
    section_B INTEGER CHECK (section_B IN (0, 1)),
    section_C INTEGER CHECK (section_C IN (0, 1)),
    section_D INTEGER CHECK (section_D IN (0, 1)),
    section_E INTEGER CHECK (section_E IN (0, 1)),
    section_F INTEGER CHECK (section_F IN (0, 1)),
    section_T INTEGER CHECK (section_T IN (0, 1)),
    PRIMARY KEY (id)
);

CREATE TABLE flight (
    id INTEGER,
    airline INTEGER,
    airport_depart TEXT NOT NULL,
    airport_heading TEXT NOT NULL,
    departure DATETIME NOT NULL,
    arrival DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (airline) REFERENCES airlines(id)
);

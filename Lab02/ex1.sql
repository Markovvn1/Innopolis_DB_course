CREATE DATABASE MOVIE_DB;



CREATE TABLE company (
	id SERIAL PRIMARY KEY, 
	name TEXT,
	address TEXT
);

CREATE TABLE genre (
	id SERIAL PRIMARY KEY, 
	name TEXT
);

CREATE TABLE movie (
	id SERIAL PRIMARY KEY,
	title TEXT,
	year_of_release DATE,
	length INTEGER,

	genre_id BIGINT,
	CONSTRAINT genre_fk
		FOREIGN KEY (genre_id) REFERENCES
	genre (id),

	company_id BIGINT,
	CONSTRAINT company_fk
		FOREIGN KEY (company_id) REFERENCES
	company (id)
);

CREATE TABLE people (
	id SERIAL PRIMARY KEY,
	name TEXT,
	date_of_birth DATE,
	role TEXT
);

CREATE TABLE quotes (
	id SERIAL PRIMARY KEY, 
	quote TEXT,

	movie_id BIGINT,
	CONSTRAINT movie_fk
		FOREIGN KEY (movie_id) REFERENCES
	people (id),

	people_id BIGINT,
	CONSTRAINT people_fk
		FOREIGN KEY (people_id) REFERENCES
	movie (id)
);

CREATE TABLE employee_of (
	id INTEGER PRIMARY KEY,

	people_id BIGINT,
	CONSTRAINT people_fk
		FOREIGN KEY (people_id) REFERENCES
	people (id),

	movie_id BIGINT,
	CONSTRAINT movie_fk
		FOREIGN KEY (movie_id) REFERENCES
	movie (id)
);






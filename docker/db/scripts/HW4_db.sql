CREATE DATABASE library;
GRANT ALL PRIVILEGES ON DATABASE library TO pan_206;

\connect library

CREATE TABLE "book" (
  "isbn" varchar(17) PRIMARY KEY,
  "pages" integer,
  "creater" varchar(50),
  "publisher" integer,
  "year" date,
  "name" varchar(50)
);

CREATE TABLE "copy" (
  "id" SERIAL PRIMARY KEY,
  "isbn" varchar(17),
  "position" varchar(50),
  "number" integer
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "publisher" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "address" varchar(50)
);

CREATE TABLE "reader" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "address" varchar(50),
  "birthday" date,
  "number" integer
);

CREATE TABLE "borrowing" (
  "id" integer PRIMARY KEY,
  "reader_id" integer,
  "isbn" varchar(17),
  "copy_id" integer,
  "return_date" date
);

CREATE TABLE "category_tree" (
  "category_id" integer,
  "parent_category_id" integer
);

CREATE TABLE "book_category" (
  "isbn" varchar(17),
  "category_id" integer
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher") REFERENCES "publisher" ("id");

ALTER TABLE "borrowing" ADD FOREIGN KEY ("copy_id") REFERENCES "copy" ("id");

ALTER TABLE "category_tree" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "category_tree" ADD FOREIGN KEY ("parent_category_id") REFERENCES "category" ("id");

ALTER TABLE "book_category" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");

ALTER TABLE "book_category" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "borrowing" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "borrowing" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");

ALTER TABLE "copy" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");

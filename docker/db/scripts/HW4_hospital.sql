CREATE DATABASE hospital;
GRANT ALL PRIVILEGES ON DATABASE hospital TO pan_206;

\connect hospital


CREATE TABLE "station" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "room" (
  "id" integer PRIMARY KEY,
  "station_id" integer,
  "beds_id" integer
);

CREATE TABLE "admission" (
  "id" integer PRIMARY KEY,
  "patient_id" integer,
  "room_id" integer,
  "from" timestamp,
  "to" timestamp
);

CREATE TABLE "patient" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "treating_doctor_id" integer
);

CREATE TABLE "doctor" (
  "id" integer PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "caregivers" (
  "id" integer PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "station_personell" (
  "per_id" integer PRIMARY KEY,
  "station" integer,
  "name_number" int
);

ALTER TABLE "station_personell" ADD FOREIGN KEY ("station") REFERENCES "station" ("id");

ALTER TABLE "room" ADD FOREIGN KEY ("station_id") REFERENCES "station" ("id");

ALTER TABLE "admission" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient_id") REFERENCES "patient" ("id");

ALTER TABLE "patient" ADD FOREIGN KEY ("treating_doctor_id") REFERENCES "doctor" ("id");

ALTER TABLE "station_personell" ADD FOREIGN KEY ("per_id") REFERENCES "doctor" ("id");

ALTER TABLE "station_personell" ADD FOREIGN KEY ("per_id") REFERENCES "caregivers" ("id");

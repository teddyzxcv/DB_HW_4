CREATE DATABASE station;
GRANT ALL PRIVILEGES ON DATABASE station TO pan_206;

\connect station

CREATE TABLE "train" (
  "id" int PRIMARY KEY,
  "length" int,
  "start" integer,
  "end" integer
);

CREATE TABLE "city" (
  "name" varchar,
  "region" varchar,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "station" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "city" varchar,
  "region" varchar,
  "tracks" int
);

CREATE TABLE "logistic" (
  "id" int PRIMARY KEY,
  "train_id" int,
  "start" integer,
  "end" integer,
  "arrival" timestamp,
  "departure" timestamp
);

ALTER TABLE "logistic" ADD FOREIGN KEY ("train_id") REFERENCES "train" ("id");

ALTER TABLE "logistic" ADD FOREIGN KEY ("start") REFERENCES "station" ("id");

ALTER TABLE "logistic" ADD FOREIGN KEY ("end") REFERENCES "station" ("id");

ALTER TABLE "train" ADD FOREIGN KEY ("start") REFERENCES "station" ("id");

ALTER TABLE "train" ADD FOREIGN KEY ("end") REFERENCES "station" ("id");

ALTER TABLE "station" ADD FOREIGN KEY ("city", "region") REFERENCES "city" ("name", "region");

CREATE TABLE "collections" (
  "id" serial,
  "user_id" varchar,
  "name" varchar,
  "description" varchar,
  "website" varchar,
  "public" boolean,
  "featured" boolean,
  "created_at" timestamp,
  "updated_at" timestamp,
  PRIMARY KEY(id)
);

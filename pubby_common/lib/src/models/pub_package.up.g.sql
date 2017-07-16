CREATE TABLE "pub_packages" (
  "id" serial,
  "user_id" varchar,
  "name" varchar,
  "version_string" varchar,
  "description" varchar,
  "readme" varchar,
  "tags" varchar,
  "donation_link" varchar,
  "pre_release" boolean,
  "created_at" timestamp,
  "updated_at" timestamp,
  PRIMARY KEY(id)
);

CREATE TABLE "collection_entries" (
  "id" serial,
  "collection_id" varchar,
  "pub_package_id" varchar,
  "created_at" timestamp,
  "updated_at" timestamp,
  PRIMARY KEY(id)
);

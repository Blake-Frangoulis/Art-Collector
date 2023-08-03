set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "public"."users" (
	"userId" serial NOT NULL,
	"username" TEXT NOT NULL,
	"hashedPassword" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."collections" (
	"collectionId" serial NOT NULL,
	"userId" integer NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "collections_pk" PRIMARY KEY ("collectionId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."collectionContents" (
	"collectionContentsId" serial NOT NULL,
	"collectionId" integer NOT NULL,
	"image" TEXT NOT NULL,
	"title" TEXT NOT NULL,
	"artist" TEXT NOT NULL,
	"medium" TEXT NOT NULL,
	"date" TEXT NOT NULL,
	"tags" TEXT NOT NULL,
	CONSTRAINT "collectionContents_pk" PRIMARY KEY ("collectionContentsId")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "collections" ADD CONSTRAINT "collections_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");

ALTER TABLE "collectionContents" ADD CONSTRAINT "collectionContents_fk0" FOREIGN KEY ("collectionId") REFERENCES "collections"("collectionId");

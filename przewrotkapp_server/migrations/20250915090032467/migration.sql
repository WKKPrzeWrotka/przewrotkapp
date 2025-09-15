BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "rentals" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rentals" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "lastModified" timestamp without time zone NOT NULL,
    "from" timestamp without time zone NOT NULL,
    "to" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "rentals_users_unique_idx" ON "rentals" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "rentals"
    ADD CONSTRAINT "rentals_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250915090032467', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250915090032467', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;

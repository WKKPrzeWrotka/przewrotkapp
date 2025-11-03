BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "hours" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "amount" bigint NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "approved" boolean NOT NULL DEFAULT false
);

-- Indexes
CREATE INDEX "hours_users_unique_idx" ON "hours" USING btree ("userId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "hours"
    ADD CONSTRAINT "hours_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20251103141536017', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251103141536017', "timestamp" = now();

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

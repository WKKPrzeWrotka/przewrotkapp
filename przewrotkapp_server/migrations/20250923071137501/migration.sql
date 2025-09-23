BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "comments" (
    "id" bigserial PRIMARY KEY,
    "byId" bigint NOT NULL,
    "gearId" bigint,
    "type" text NOT NULL,
    "text" text NOT NULL,
    "hoursForResolving" bigint,
    "resolved" boolean NOT NULL DEFAULT false,
    "resolvedById" bigint
);

-- Indexes
CREATE INDEX "comment_by_idx" ON "comments" USING btree ("byId");
CREATE INDEX "comment_gear_idx" ON "comments" USING btree ("gearId");
CREATE INDEX "comment_resolved_by_idx" ON "comments" USING btree ("resolvedById");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "comments"
    ADD CONSTRAINT "comments_fk_0"
    FOREIGN KEY("byId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "comments"
    ADD CONSTRAINT "comments_fk_1"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "comments"
    ADD CONSTRAINT "comments_fk_2"
    FOREIGN KEY("resolvedById")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250923071137501', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250923071137501', "timestamp" = now();

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

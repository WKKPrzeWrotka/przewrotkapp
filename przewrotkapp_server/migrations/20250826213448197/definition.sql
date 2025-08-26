BEGIN;

--
-- Class Gear as table gear
--
CREATE TABLE "gear" (
    "id" bigserial PRIMARY KEY,
    "clubId" text NOT NULL,
    "manufacturer" text,
    "model" text,
    "friendlyName" text,
    "photoUrls" json
);

--
-- Class GearDataBelt as table gear_data_belts
--
CREATE TABLE "gear_data_belts" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "length" double precision NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "belts_gear_unique_idx" ON "gear_data_belts" USING btree ("gearId");

--
-- Class GearDataClothing as table gear_data_clothes
--
CREATE TABLE "gear_data_clothes" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "typeDescription" text
);

-- Indexes
CREATE UNIQUE INDEX "clothes_gear_unique_idx" ON "gear_data_clothes" USING btree ("gearId");

--
-- Class GearDataHelmet as table gear_data_helmets
--
CREATE TABLE "gear_data_helmets" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "size" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "helmets_gear_unique_idx" ON "gear_data_helmets" USING btree ("gearId");

--
-- Class GearDataKayak as table gear_data_kayaks
--
CREATE TABLE "gear_data_kayaks" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "minWeight" bigint NOT NULL,
    "maxWeight" bigint NOT NULL,
    "length" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "kayaks_gear_unique_idx" ON "gear_data_kayaks" USING btree ("gearId");

--
-- Class GearDataPaddle as table gear_data_paddles
--
CREATE TABLE "gear_data_paddles" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "type" text NOT NULL,
    "length" double precision NOT NULL,
    "rotation" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "paddles_gear_unique_idx" ON "gear_data_paddles" USING btree ("gearId");

--
-- Class GearDataPfd as table gear_data_pfds
--
CREATE TABLE "gear_data_pfds" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "size" text NOT NULL,
    "type" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "pfds_gear_unique_idx" ON "gear_data_pfds" USING btree ("gearId");

--
-- Class GearDataSpraydeck as table gear_data_spraydecks
--
CREATE TABLE "gear_data_spraydecks" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "deckSize" text NOT NULL,
    "waistSize" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "spraydecks_gear_unique_idx" ON "gear_data_spraydecks" USING btree ("gearId");

--
-- Class GearDataThrowbag as table gear_data_throwbags
--
CREATE TABLE "gear_data_throwbags" (
    "id" bigserial PRIMARY KEY,
    "gearId" bigint NOT NULL,
    "length" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "throwbags_gear_unique_idx" ON "gear_data_throwbags" USING btree ("gearId");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "gear_data_belts" table
--
ALTER TABLE ONLY "gear_data_belts"
    ADD CONSTRAINT "gear_data_belts_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_data_clothes" table
--
ALTER TABLE ONLY "gear_data_clothes"
    ADD CONSTRAINT "gear_data_clothes_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_data_helmets" table
--
ALTER TABLE ONLY "gear_data_helmets"
    ADD CONSTRAINT "gear_data_helmets_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_data_kayaks" table
--
ALTER TABLE ONLY "gear_data_kayaks"
    ADD CONSTRAINT "gear_data_kayaks_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_data_paddles" table
--
ALTER TABLE ONLY "gear_data_paddles"
    ADD CONSTRAINT "gear_data_paddles_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_data_pfds" table
--
ALTER TABLE ONLY "gear_data_pfds"
    ADD CONSTRAINT "gear_data_pfds_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_data_spraydecks" table
--
ALTER TABLE ONLY "gear_data_spraydecks"
    ADD CONSTRAINT "gear_data_spraydecks_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "gear_data_throwbags" table
--
ALTER TABLE ONLY "gear_data_throwbags"
    ADD CONSTRAINT "gear_data_throwbags_fk_0"
    FOREIGN KEY("gearId")
    REFERENCES "gear"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR przewrotkapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('przewrotkapp', '20250826213448197', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250826213448197', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

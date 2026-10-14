BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "damage_photo" (
    "id" bigserial PRIMARY KEY,
    "itemId" bigint NOT NULL,
    "storagePath" text NOT NULL,
    "takenAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "discrepancy" (
    "id" bigserial PRIMARY KEY,
    "shipmentId" bigint NOT NULL,
    "itemDescription" text NOT NULL,
    "kind" text NOT NULL,
    "quantity" bigint NOT NULL,
    "severity" bigint NOT NULL,
    "explanation" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "discrepancy_shipment_idx" ON "discrepancy" USING btree ("shipmentId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "dock_alert" (
    "id" bigserial PRIMARY KEY,
    "shipmentId" bigint NOT NULL,
    "kind" text NOT NULL,
    "title" text NOT NULL,
    "message" text NOT NULL,
    "severity" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "readAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "dock_alert_created_idx" ON "dock_alert" USING btree ("createdAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "shipment" (
    "id" bigserial PRIMARY KEY,
    "reference" text NOT NULL,
    "carrier" text NOT NULL,
    "status" text NOT NULL DEFAULT 'expected'::text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "claimDeadline" timestamp without time zone NOT NULL,
    "createdByUserId" uuid NOT NULL,
    "receivedAt" timestamp without time zone,
    "receivedByName" text,
    "receiptId" text
);

-- Indexes
CREATE INDEX "shipment_status_idx" ON "shipment" USING btree ("status");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "shipment_item" (
    "id" bigserial PRIMARY KEY,
    "shipmentId" bigint NOT NULL,
    "description" text NOT NULL,
    "expectedQty" bigint NOT NULL,
    "receivedQty" bigint,
    "damagedQty" bigint NOT NULL DEFAULT 0,
    "note" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "staff_profile" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "role" text NOT NULL,
    "displayName" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "staff_profile_user_idx" ON "staff_profile" USING btree ("authUserId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "damage_photo"
    ADD CONSTRAINT "damage_photo_fk_0"
    FOREIGN KEY("itemId")
    REFERENCES "shipment_item"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "discrepancy"
    ADD CONSTRAINT "discrepancy_fk_0"
    FOREIGN KEY("shipmentId")
    REFERENCES "shipment"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "shipment_item"
    ADD CONSTRAINT "shipment_item_fk_0"
    FOREIGN KEY("shipmentId")
    REFERENCES "shipment"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR dockcheck
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('dockcheck', '20261014162721310', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261014162721310', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260924105404509', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105404509', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;

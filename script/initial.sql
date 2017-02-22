BEGIN TRANSACTION;
CREATE TABLE "item"(
    "item_id" INTEGER NOT NULL PRIMARY KEY ,
    "name" VARCHAR
);


CREATE TABLE "item_selling_price"(
    "item_id" INTEGER NOT NULL,
    "store_id" VARCHAR NOT NULL,
    "price" DECIMAL NOT NULL,
    "cost" DECIMAL,
    PRIMARY KEY ("item_id", "store_id"),
    FOREIGN KEY ("item_id") REFERENCES "item" ("item_id")
);


CREATE TABLE "sale_transaction"(
    "tran_id" INTEGER NOT NULL PRIMARY KEY ,
    "store_id" VARCHAR NOT NULL,
    "workstation" VARCHAR NOT NULL,
    "day" VARCHAR NOT NULL,
    "seq" INTEGER NOT NULL
);

CREATE TABLE "sale_return_line_item"(
    "tran_id" INTEGER NOT NULL PRIMARY KEY ,
    "item_id" INTEGER NOT NULL,
    "price" DECIMAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "returned_quantity" INTEGER,
    FOREIGN KEY ("tran_id") REFERENCES "sale_transaction" ("tran_id"),
    FOREIGN KEY ("item_id") REFERENCES "item" ("item_id")
);

CREATE TABLE "sym_channel"(
    "channel_id" VARCHAR NOT NULL PRIMARY KEY ,
    "processing_order" INTEGER DEFAULT 1 NOT NULL,
    "max_batch_size" INTEGER DEFAULT 1000 NOT NULL,
    "max_batch_to_send" INTEGER DEFAULT 60 NOT NULL,
    "max_data_to_route" INTEGER DEFAULT 100000 NOT NULL,
    "extract_period_millis" INTEGER DEFAULT 0 NOT NULL,
    "enabled" INTEGER DEFAULT 1 NOT NULL,
    "use_old_data_to_route" INTEGER DEFAULT 1 NOT NULL,
    "use_row_data_to_route" INTEGER DEFAULT 1 NOT NULL,
    "use_pk_data_to_route" INTEGER DEFAULT 1 NOT NULL,
    "reload_flag" INTEGER DEFAULT 0 NOT NULL,
    "file_sync_flag" INTEGER DEFAULT 0 NOT NULL,
    "contains_big_lob" INTEGER DEFAULT 0 NOT NULL,
    "batch_algorithm" VARCHAR DEFAULT 'default' NOT NULL,
    "data_loader_type" VARCHAR DEFAULT 'default' NOT NULL,
    "description" VARCHAR,
    "queue" VARCHAR DEFAULT 'default' NOT NULL,
    "max_network_kbps" DECIMAL DEFAULT 0.000 NOT NULL,
    "create_time" TIMESTAMP,
    "last_update_by" VARCHAR,
    "last_update_time" TIMESTAMP
);
COMMIT;

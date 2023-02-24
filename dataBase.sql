CREATE TABLE "login"(
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "login" ADD PRIMARY KEY("id");
CREATE TABLE "event"(
    "id" SERIAL NOT NULL,
    "e_title" VARCHAR(50) NOT NULL,
    "category" VARCHAR(30) NOT NULL,
    "e_sub_category" VARCHAR(20) NOT NULL,
    "e_description" VARCHAR(300) NOT NULL,
    "e_location" VARCHAR(50) NOT NULL,
    "e_organizer" VARCHAR(20) NOT NULL,
    "e_date" DATE NOT NULL,
    "e_start_time" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "e_end_time" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "free" BOOLEAN NOT NULL,
    "paid" INTEGER NULL,
    "e_capacity" BIGINT NOT NULL,
    "login_id" INTEGER NOT NULL,
    "booking_id" BIGINT NULL
);
ALTER TABLE
    "event" ADD PRIMARY KEY("id");
CREATE TABLE "user_table"(
    "id" INTEGER NOT NULL,
    "login_id" INTEGER NOT NULL
);
ALTER TABLE
    "user_table" ADD PRIMARY KEY("id");
CREATE TABLE "booking"(
    "id" SERIAL NOT NULL,
    "seats_booked" INTEGER NOT NULL,
    "booking_date" DATE NOT NULL,
    "booking_time" BIGINT NOT NULL,
    "cancel" BOOLEAN NOT NULL,
    "id_user_table" INTEGER NOT NULL,
    "id_even_table" INTEGER NOT NULL
);
ALTER TABLE
    "booking" ADD PRIMARY KEY("id");
ALTER TABLE
    "event" ADD CONSTRAINT "event_login_id_foreign" FOREIGN KEY("login_id") REFERENCES "login"("id");
ALTER TABLE
    "event" ADD CONSTRAINT "event_booking_id_foreign" FOREIGN KEY("booking_id") REFERENCES "booking"("id");
ALTER TABLE
    "booking" ADD CONSTRAINT "booking_id_user_table_foreign" FOREIGN KEY("id_user_table") REFERENCES "user_table"("id");
ALTER TABLE
    "user_table" ADD CONSTRAINT "user_table_login_id_foreign" FOREIGN KEY("login_id") REFERENCES "login"("id");
ALTER TABLE
    "booking" ADD CONSTRAINT "booking_id_even_table_foreign" FOREIGN KEY("id_even_table") REFERENCES "event"("id");
-- Table: public.Item

-- DROP TABLE IF EXISTS public."Item";

CREATE TABLE IF NOT EXISTS public."Item"
(
    id bigint NOT NULL,
    "isReserved" boolean NOT NULL,
    "listId" bigint,
    name text COLLATE pg_catalog."default",
    image text COLLATE pg_catalog."default",
    link text[] COLLATE pg_catalog."default",
    CONSTRAINT "Item_pkey" PRIMARY KEY (id),
    CONSTRAINT list_fkey FOREIGN KEY ("listId")
        REFERENCES public."List" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Item"
    OWNER to postgres;
-- Index: fki_list_fkey

-- DROP INDEX IF EXISTS public.fki_list_fkey;

CREATE INDEX IF NOT EXISTS fki_list_fkey
    ON public."Item" USING btree
    ("listId" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.List

-- DROP TABLE IF EXISTS public."List";

CREATE TABLE IF NOT EXISTS public."List"
(
    id bigint NOT NULL,
    "allowReservation" boolean,
    name text COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    CONSTRAINT "List_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."List"
    OWNER to postgres;
CREATE SEQUENCE IF NOT EXISTS public.genre_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.music_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.artist_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.customer_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.transaction_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.survey_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.rating_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.genre
(
    genreID integer NOT NULL DEFAULT nextval('genre_id_seq'::regclass),
    genreName character varying(500) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genre_genreID_pkey PRIMARY KEY (genreID)
);
CREATE TABLE IF NOT EXISTS public.artist
(
    artistID integer NOT NULL DEFAULT nextval('music_id_seq'::regclass),
    artistName character varying(500) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT artist_artistID_pkey PRIMARY KEY (artistID)
);
CREATE TABLE IF NOT EXISTS public.music
(
    musicID integer NOT NULL DEFAULT nextval('music_id_seq'::regclass),
    genreID integer NOT NULL,
	  artistID integer NOT NULL,
    musicName character varying(20000) COLLATE pg_catalog."default" NOT NULL,
	  cost numeric(5,2) NOT NULL,
    create_date date NOT NULL DEFAULT ('now'::text)::date,
    last_update timestamp without time zone DEFAULT now(),
    CONSTRAINT music_pkey PRIMARY KEY (musicID,genreID),
    CONSTRAINT music_genreID_fkey FOREIGN KEY (genreID)
        REFERENCES public.genre (genreID) MATCH SIMPLE,
    CONSTRAINT music_artistID_fkey FOREIGN KEY (artistID)
        REFERENCES public.artist (artistID) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.customer
(
    customerID integer NOT NULL DEFAULT nextval('customer_id_seq'::regclass),
    firstName character varying(45) COLLATE pg_catalog."default" NOT NULL,
    lastName character varying(45) COLLATE pg_catalog."default" NOT NULL,
    email character varying(45) COLLATE pg_catalog."default" NOT NULL,
    phoneNumber character varying(45) COLLATE pg_catalog."default" NOT NULL,
    address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    create_date date NOT NULL DEFAULT ('now'::text)::date,
    last_update timestamp without time zone DEFAULT now(),
    CONSTRAINT customerID_pkey PRIMARY KEY (customerID)
);
CREATE TABLE IF NOT EXISTS public.billing
(
    transactionId integer NOT NULL DEFAULT nextval('transaction_id_seq'::regclass),
    customerID integer NOT NULL,
    transactionAmount numeric(5,2) NOT NULL,
    paymentMethod character varying(45) COLLATE pg_catalog."default" NOT NULL,
    quantity integer NOT NULL,
    transaction_date date NOT NULL DEFAULT ('now'::text)::date,
    last_update timestamp without time zone DEFAULT now(),
    CONSTRAINT transactionId_pkey PRIMARY KEY (transactionId),
    CONSTRAINT artist_customerID_fkey FOREIGN KEY (customerID)
        REFERENCES public.customer (customerID) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.favorites
(
    customerID integer NOT NULL,
    musicID integer NOT NULL,
	genreID integer NOT NULL,
    CONSTRAINT favorites_customerID_pkey PRIMARY KEY (customerID),
    CONSTRAINT favorites_musicID_fkey FOREIGN KEY (musicID,genreID)
    	REFERENCES public.music (musicID,genreID) MATCH SIMPLE ON DELETE CASCADE,
    CONSTRAINT favorites_customerID_fkey FOREIGN KEY (customerID)
        REFERENCES public.customer (customerID) MATCH SIMPLE ON DELETE CASCADE	
);

CREATE TABLE IF NOT EXISTS public.survey
(
    surveyID integer NOT NULL DEFAULT nextval('survey_id_seq'::regclass),
    email character varying(45) COLLATE pg_catalog."default" NOT NULL,
    musicID integer NOT NULL,
    genreID integer NOT NULL,
    userRating numeric(2,1) NOT NULL,
    CONSTRAINT survey_ratingID_pkey PRIMARY KEY (surveyID),
    CONSTRAINT survey_musicID_fkey FOREIGN KEY (musicID,genreID)
        REFERENCES public.music (musicID,genreID) MATCH SIMPLE
);
CREATE TABLE IF NOT EXISTS public.rating
(
    ratingID integer NOT NULL DEFAULT nextval('rating_id_seq'::regclass),
    rating numeric(2,1) NOT NULL,
    musicID integer NOT NULL,
	  genreID integer NOT NULL,
    CONSTRAINT rating_ratingID_pkey PRIMARY KEY (ratingID),
    CONSTRAINT rating_musicID_fkey FOREIGN KEY (musicID,genreID)
        REFERENCES public.music (musicID,genreID) MATCH SIMPLE
);

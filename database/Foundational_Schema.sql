-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.publisher (
  publisher_id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  publisher_name text NOT NULL,
  address text,
  contact_email text NOT NULL,
  CONSTRAINT publisher_pkey PRIMARY KEY (publisher_id)
);
CREATE TABLE public.author (
  author_id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  author_name text NOT NULL,
  bio text,
  user_id integer NOT NULL,
  CONSTRAINT author_pkey PRIMARY KEY (author_id, user_id),
  CONSTRAINT author_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.member(user_id)
);
CREATE TABLE public.library_user (
  user_id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  first_name text NOT NULL,
  last_name text NOT NULL,
  email text NOT NULL UNIQUE,
  CONSTRAINT library_user_pkey PRIMARY KEY (user_id)
);
CREATE TABLE public.member (
  user_id integer NOT NULL,
  phone text NOT NULL,
  standing text NOT NULL,
  CONSTRAINT member_pkey PRIMARY KEY (user_id),
  CONSTRAINT member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.library_user(user_id)
);
CREATE TABLE public.book (
  book_id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  title character varying NOT NULL,
  isbn character varying NOT NULL UNIQUE,
  publication_year integer NOT NULL,
  publisher_id integer NOT NULL,
  CONSTRAINT book_pkey PRIMARY KEY (book_id),
  CONSTRAINT book_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.publisher(publisher_id)
);
CREATE TABLE public.loan (
  loan_id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  user_id integer NOT NULL,
  book_id integer NOT NULL,
  loan_date date NOT NULL,
  loan_expiration_date date NOT NULL,
  return_date date,
  CONSTRAINT loan_pkey PRIMARY KEY (loan_id),
  CONSTRAINT loan_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.member(user_id),
  CONSTRAINT loan_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id)
);
CREATE TABLE public.reservation (
  reservation_id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  user_id integer NOT NULL,
  book_id integer NOT NULL,
  reservation_date date NOT NULL,
  reservation_expiration_date date NOT NULL,
  CONSTRAINT reservation_pkey PRIMARY KEY (reservation_id),
  CONSTRAINT reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.member(user_id),
  CONSTRAINT reservation_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id)
);

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_state (
    state character varying(16) NOT NULL
);


ALTER TABLE public.app_state OWNER TO postgres;

--
-- Name: numeric_row; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.numeric_row (
    patient_id integer,
    concept_path character varying(4096),
    obs_date date,
    value numeric(32,0),
    row_id integer NOT NULL
);


ALTER TABLE public.numeric_row OWNER TO postgres;

--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    age integer,
    race character varying(128),
    sex character varying(128),
    vital_status character varying(128),
    patient_id integer NOT NULL
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: string_row; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.string_row (
    patient_id integer,
    concept_path character varying(4096),
    obs_date date,
    value text,
    row_id integer NOT NULL
);


ALTER TABLE public.string_row OWNER TO postgres;

--
-- Data for Name: app_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_state (state) FROM stdin;
\.


--
-- Data for Name: numeric_row; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.numeric_row (patient_id, concept_path, obs_date, value, row_id) FROM stdin;
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (age, race, sex, vital_status, patient_id) FROM stdin;
\.


--
-- Data for Name: string_row; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.string_row (patient_id, concept_path, obs_date, value, row_id) FROM stdin;
\.


--
-- Name: app_state app_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_state
    ADD CONSTRAINT app_state_pkey PRIMARY KEY (state);


--
-- Name: numeric_row numeric_row_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numeric_row
    ADD CONSTRAINT numeric_row_pkey PRIMARY KEY (row_id);


--
-- Name: patient patient_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_detail_pkey PRIMARY KEY (patient_id);


--
-- Name: string_row string_row_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.string_row
    ADD CONSTRAINT string_row_pkey PRIMARY KEY (row_id);


--
-- Name: numeric_row fk_patient; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numeric_row
    ADD CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- Name: string_row fk_patient; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.string_row
    ADD CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- PostgreSQL database dump complete
--


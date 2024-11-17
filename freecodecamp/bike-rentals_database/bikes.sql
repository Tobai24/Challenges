--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

-- Started on 2024-11-17 08:56:38 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 202 (class 1259 OID 16542)
-- Name: bikes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.bikes (
    bike_id integer NOT NULL,
    type character varying(50) NOT NULL,
    size integer NOT NULL,
    available boolean DEFAULT true NOT NULL
);


ALTER TABLE public.bikes OWNER TO freecodecamp;

--
-- TOC entry 203 (class 1259 OID 16546)
-- Name: bikes_bike_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.bikes_bike_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bikes_bike_id_seq OWNER TO freecodecamp;

--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 203
-- Name: bikes_bike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.bikes_bike_id_seq OWNED BY public.bikes.bike_id;


--
-- TOC entry 204 (class 1259 OID 16548)
-- Name: customers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(15) NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.customers OWNER TO freecodecamp;

--
-- TOC entry 205 (class 1259 OID 16551)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO freecodecamp;

--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 205
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 206 (class 1259 OID 16553)
-- Name: rentals; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rentals (
    rental_id integer NOT NULL,
    customer_id integer NOT NULL,
    bike_id integer NOT NULL,
    date_rented date DEFAULT now() NOT NULL,
    date_returned date
);


ALTER TABLE public.rentals OWNER TO freecodecamp;

--
-- TOC entry 207 (class 1259 OID 16557)
-- Name: rentals_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rentals_rental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rentals_rental_id_seq OWNER TO freecodecamp;

--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 207
-- Name: rentals_rental_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rentals_rental_id_seq OWNED BY public.rentals.rental_id;


--
-- TOC entry 2844 (class 2604 OID 16559)
-- Name: bikes bike_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.bikes ALTER COLUMN bike_id SET DEFAULT nextval('public.bikes_bike_id_seq'::regclass);


--
-- TOC entry 2845 (class 2604 OID 16560)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 2847 (class 2604 OID 16561)
-- Name: rentals rental_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rentals ALTER COLUMN rental_id SET DEFAULT nextval('public.rentals_rental_id_seq'::regclass);


--
-- TOC entry 2984 (class 0 OID 16542)
-- Dependencies: 202
-- Data for Name: bikes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.bikes (bike_id, type, size, available) FROM stdin;
8	BMX	20	t
9	BMX	21	t
2	Mountain	28	t
1	Mountain	27	t
3	Mountain	29	t
4	Road	27	t
5	Road	28	t
6	Road	29	t
7	BMX	19	t
\.


--
-- TOC entry 2986 (class 0 OID 16548)
-- Dependencies: 204
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.customers (customer_id, phone, name) FROM stdin;
1	555-5555	Me
2	000-0000	Test
\.


--
-- TOC entry 2988 (class 0 OID 16553)
-- Dependencies: 206
-- Data for Name: rentals; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.rentals (rental_id, customer_id, bike_id, date_rented, date_returned) FROM stdin;
2	1	2	2021-05-25	2024-11-17
1	1	1	2021-05-25	2024-11-17
3	1	3	2021-05-27	2024-11-17
4	1	4	2021-05-27	2024-11-17
5	1	5	2021-05-27	2024-11-17
6	2	6	2021-05-27	2024-11-17
7	2	7	2021-05-27	2024-11-17
\.


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 203
-- Name: bikes_bike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.bikes_bike_id_seq', 9, true);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 205
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 2, true);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 207
-- Name: rentals_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rentals_rental_id_seq', 7, true);


--
-- TOC entry 2849 (class 2606 OID 16563)
-- Name: bikes bikes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_pkey PRIMARY KEY (bike_id);


--
-- TOC entry 2851 (class 2606 OID 16565)
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- TOC entry 2853 (class 2606 OID 16567)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2855 (class 2606 OID 16569)
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (rental_id);


--
-- TOC entry 2856 (class 2606 OID 16570)
-- Name: rentals rentals_bike_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_bike_id_fkey FOREIGN KEY (bike_id) REFERENCES public.bikes(bike_id);


--
-- TOC entry 2857 (class 2606 OID 16575)
-- Name: rentals rentals_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


-- Completed on 2024-11-17 08:56:38 UTC

--
-- PostgreSQL database dump complete
--


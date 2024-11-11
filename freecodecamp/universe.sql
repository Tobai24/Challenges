--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    number_of_planets integer,
    gravity_level numeric(4,0),
    description text,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.id;


--
-- Name: last; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.last (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    planet_name text,
    star_id integer,
    distance_from_star numeric(10,2)
);


ALTER TABLE public.last OWNER TO freecodecamp;

--
-- Name: last_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.last_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.last_id_seq OWNER TO freecodecamp;

--
-- Name: last_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.last_id_seq OWNED BY public.last.id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    id integer NOT NULL,
    has_water boolean,
    diameter_km numeric(10,2),
    name character varying(40) NOT NULL,
    planet_id integer,
    orbit_period_days numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    star_id integer,
    distance_from_star numeric(10,2),
    planet_type text,
    id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    id integer,
    color text NOT NULL,
    mass numeric(10,2),
    luminosity numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: last id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last ALTER COLUMN id SET DEFAULT nextval('public.last_id_seq'::regclass);


--
-- Name: moon id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 8, 1, 'Our home galaxy with the Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 15, 1, 'Nearest large galaxy to the Milky Way.', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 7500, 5, 1, 'Small spiral galaxy in the Local Group.', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8000, 12, 1, 'Famous for its spiral arms and companion galaxy.', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 8800, 10, 1, 'Bright galaxy with a large central bulge.', false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 500, 9, 1, 'Galaxy with a distinctive ring structure.', false);


--
-- Data for Name: last; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.last VALUES (1, 'LastOne', 'Earth', 1, 149.60);
INSERT INTO public.last VALUES (2, 'LastTwo', 'Mars', 1, 227.90);
INSERT INTO public.last VALUES (3, 'LastThree', 'Jupiter', 2, 778.50);
INSERT INTO public.last VALUES (4, 'LastFour', 'Saturn', 2, 1434.00);
INSERT INTO public.last VALUES (5, 'LastFive', 'Neptune', 2, 4495.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (59, true, 3474.80, 'Earth', NULL, NULL);
INSERT INTO public.moon VALUES (60, true, 3121.60, 'Jupiter', NULL, NULL);
INSERT INTO public.moon VALUES (61, false, 5268.00, 'Jupiter', NULL, NULL);
INSERT INTO public.moon VALUES (62, false, 5150.00, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (63, false, 4821.60, 'Jupiter', NULL, NULL);
INSERT INTO public.moon VALUES (64, false, 3643.20, 'Jupiter', NULL, NULL);
INSERT INTO public.moon VALUES (65, true, 2706.80, 'Neptune', NULL, NULL);
INSERT INTO public.moon VALUES (66, true, 504.20, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (67, false, 396.00, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (68, false, 1528.00, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (69, false, 1123.00, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (70, false, 1469.00, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (71, false, 270.00, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (72, false, 471.60, 'Uranus', NULL, NULL);
INSERT INTO public.moon VALUES (73, false, 1157.80, 'Uranus', NULL, NULL);
INSERT INTO public.moon VALUES (74, false, 1170.00, 'Uranus', NULL, NULL);
INSERT INTO public.moon VALUES (75, false, 1577.80, 'Uranus', NULL, NULL);
INSERT INTO public.moon VALUES (76, false, 1523.00, 'Uranus', NULL, NULL);
INSERT INTO public.moon VALUES (77, false, 213.00, 'Saturn', NULL, NULL);
INSERT INTO public.moon VALUES (78, false, 22.40, 'Mars', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', false, 1, 57.91, 'Terrestrial', 1);
INSERT INTO public.planet VALUES ('Venus', false, 1, 108.20, 'Terrestrial', 2);
INSERT INTO public.planet VALUES ('Earth', true, 1, 149.60, 'Terrestrial', 3);
INSERT INTO public.planet VALUES ('Mars', false, 1, 227.90, 'Terrestrial', 4);
INSERT INTO public.planet VALUES ('Jupiter', false, 2, 778.50, 'Gas Giant', 5);
INSERT INTO public.planet VALUES ('Saturn', false, 2, 1434.00, 'Gas Giant', 6);
INSERT INTO public.planet VALUES ('Uranus', false, 2, 2871.00, 'Ice Giant', 7);
INSERT INTO public.planet VALUES ('Neptune', false, 2, 4495.00, 'Ice Giant', 8);
INSERT INTO public.planet VALUES ('PlanetX1', false, 3, 5000.00, 'Unknown', 9);
INSERT INTO public.planet VALUES ('PlanetX2', false, 3, 6000.00, 'Unknown', 10);
INSERT INTO public.planet VALUES ('PlanetX3', false, 4, 7000.00, 'Unknown', 11);
INSERT INTO public.planet VALUES ('PlanetX4', false, 4, 8000.00, 'Unknown', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow', NULL, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Blue-White', NULL, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 'Red', NULL, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 3, 'Yellow', NULL, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 4, 'Blue', NULL, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', 5, 'Blue', NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: last_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.last_id_seq', 5, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 78, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (id);


--
-- Name: last last_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last
    ADD CONSTRAINT last_id PRIMARY KEY (id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (id);


--
-- Name: planet palnet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT palnet_unique UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (name);


--
-- Name: last planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_g; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_g UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (id) REFERENCES public.galaxy(id);


--
-- Name: moon fk_name; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_name FOREIGN KEY (name) REFERENCES public.planet(name);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


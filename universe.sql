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
    galaxy_id integer NOT NULL,
    name character varying(55),
    description text NOT NULL,
    distance_from_earth integer,
    galaxy_types text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(55),
    is_spherical boolean,
    distance_from_earth numeric(5,1),
    has_life boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_planet_id integer NOT NULL,
    name character varying(55),
    number_of_moons integer NOT NULL,
    planet_types text NOT NULL
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(55),
    age_in_millions_of_years integer,
    planet_types text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(5,1),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_types text,
    color text,
    temparature numeric(5,1),
    star_description text,
    name character varying(55),
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', NULL, 'Spiral Galaxies');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Closest spiral galaxy to the Milky Way', 5, 'Spiral Galaxies');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Third-largest member of the Local Group', 5, 'Spiral Galaxies');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', ' Famous for its interaction with a smaller galaxy (NGC 5195)', 8, 'Spiral Galaxies');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'A large face-on spiral galaxy', 8, 'Spiral Galaxies');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Supergiant elliptical galaxy; hosts the first black hole ever imaged', 87, 'Elliptical Galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 0.0, false, 13);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 0.7, false, 14);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 0.7, false, 14);
INSERT INTO public.moon VALUES (4, 'Io', true, 4.2, false, 15);
INSERT INTO public.moon VALUES (5, 'Europa', true, 4.2, NULL, 15);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 4.2, false, 15);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 4.2, false, 15);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 4.2, false, 15);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 4.2, false, 15);
INSERT INTO public.moon VALUES (10, 'Elara', false, 4.2, false, 15);
INSERT INTO public.moon VALUES (11, 'Pasiphae', false, 4.2, false, 15);
INSERT INTO public.moon VALUES (12, 'Titan', true, 8.6, NULL, 22);
INSERT INTO public.moon VALUES (13, 'Rhea', true, 8.6, false, 22);
INSERT INTO public.moon VALUES (14, 'Iapetus', true, 8.6, false, 22);
INSERT INTO public.moon VALUES (15, 'Dione', true, 8.6, false, 22);
INSERT INTO public.moon VALUES (16, 'Tethys', true, 8.6, false, 22);
INSERT INTO public.moon VALUES (17, 'Enceladus', true, 8.6, NULL, 22);
INSERT INTO public.moon VALUES (18, 'Mimas', true, 8.6, false, 22);
INSERT INTO public.moon VALUES (19, 'Titania', true, 19.2, false, 23);
INSERT INTO public.moon VALUES (20, 'Triton', true, 30.1, NULL, 24);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (1, 'Jupiter', 80, 'Gas Giant');
INSERT INTO public.moon_planet VALUES (2, 'Saturn', 83, 'Gas Giant');
INSERT INTO public.moon_planet VALUES (3, 'Earth', 1, 'Terrestrial');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 4540, 'Terrestrial', true, true, 0.0, 3);
INSERT INTO public.planet VALUES (14, 'Mars', 4600, 'Terrestrial', false, true, 0.7, 4);
INSERT INTO public.planet VALUES (15, 'Jupiter', 4600, 'Gas Giant', false, true, 4.2, 5);
INSERT INTO public.planet VALUES (16, 'Kepler-186f', 4000, 'Super-Earth', NULL, true, 492.5, 6);
INSERT INTO public.planet VALUES (17, 'WASP-12b', 2000, 'Hot Jupiter', false, true, 1412.0, 7);
INSERT INTO public.planet VALUES (18, 'Proxima Centauri b', 4850, 'Terrestrial', NULL, true, 4.2, 8);
INSERT INTO public.planet VALUES (20, 'Mercury', 4500, 'Terrestrial', false, true, 0.6, 3);
INSERT INTO public.planet VALUES (21, 'Venus', 4500, 'Terrestrial', false, true, 0.3, 3);
INSERT INTO public.planet VALUES (22, 'Saturn', 4500, 'Gas Giant', false, true, 8.6, 3);
INSERT INTO public.planet VALUES (23, 'Uranus', 4500, 'Ice Giant', false, true, 19.2, 4);
INSERT INTO public.planet VALUES (24, 'Neptune', 4500, 'Ice Giant', false, true, 30.1, 4);
INSERT INTO public.planet VALUES (25, 'HD 209458 b', 3000, 'Hot Jupiter', false, true, 159.0, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'G-type main-sequence', 'Yellow', 5778.0, 'Our Sun, a yellow dwarf star', 'Sol', 1);
INSERT INTO public.star VALUES (4, 'M-type red dwarf', 'Red', 3200.5, 'Closest star to the Sun, flare star', 'Proxima Centauri', 2);
INSERT INTO public.star VALUES (5, 'B-type blue giant', 'Blue-white', 9999.9, 'Hot massive star (capped at max value)', 'Rigel', 3);
INSERT INTO public.star VALUES (6, 'K-type orange giant', 'Orange', 4300.0, 'Bright red giant star in Taurus', 'Aldebaran', 4);
INSERT INTO public.star VALUES (7, 'White dwarf', 'White', 8000.0, 'Dense remnant of a Sun-like star', 'Sirius B', 5);
INSERT INTO public.star VALUES (8, 'Red supergiant', 'Red', 3500.0, 'Massive star nearing supernova stage', 'Betelgeuse', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_moon_planet_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 25, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_moon_planet_id_key UNIQUE (moon_planet_id);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


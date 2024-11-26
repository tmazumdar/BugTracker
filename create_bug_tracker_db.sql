--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-11-25 20:32:00

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

--
-- TOC entry 4907 (class 1262 OID 16398)
-- Name: BugTracker; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "BugTracker" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "BugTracker" OWNER TO postgres;

\connect "BugTracker"

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

--
-- TOC entry 6 (class 2615 OID 16399)
-- Name: core; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA core;


ALTER SCHEMA core OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16456)
-- Name: File; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."File" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    extension character varying(10),
    format character varying(10),
    content bytea NOT NULL,
    version integer,
    size_in_bytes character varying(50) NOT NULL,
    source_type character varying(50),
    created_by_user_id integer NOT NULL,
    created_at_utc timestamp with time zone NOT NULL
);


ALTER TABLE core."File" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: Project; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."Project" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    status integer,
    priority integer,
    parent_project_id integer,
    created_by_user_id integer NOT NULL,
    updated_by_user_id integer,
    assignee_user_id integer,
    created_at_utc timestamp with time zone NOT NULL,
    updated_at_utc timestamp with time zone,
    start_date_utc timestamp with time zone,
    end_date_utc timestamp with time zone
);


ALTER TABLE core."Project" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16417)
-- Name: Role; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."Role" (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    level character varying(10),
    department character varying(20),
    created_by_user_id integer NOT NULL,
    updated_by_user_id integer,
    created_at_utc timestamp with time zone NOT NULL,
    updated_at_utc timestamp with time zone
);


ALTER TABLE core."Role" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: RolePrivilege; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."RolePrivilege" (
    id integer NOT NULL,
    role_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE core."RolePrivilege" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16430)
-- Name: Ticket; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."Ticket" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    priority integer,
    status integer,
    project_id integer,
    type integer,
    assignee_user_id integer,
    start_date_utc timestamp with time zone,
    end_date_utc timestamp with time zone,
    created_by_user_id integer NOT NULL,
    updated_b_user_id integer,
    created_at_utc timestamp with time zone NOT NULL,
    updated_at_utc timestamp with time zone
);


ALTER TABLE core."Ticket" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16451)
-- Name: TicketAttachment; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."TicketAttachment" (
    id integer NOT NULL,
    file_id integer NOT NULL,
    ticket_id integer NOT NULL,
    created_by_user_id integer NOT NULL,
    created_at_utc timestamp with time zone NOT NULL
);


ALTER TABLE core."TicketAttachment" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16444)
-- Name: TicketComments; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."TicketComments" (
    id integer NOT NULL,
    message text NOT NULL,
    ticket_id integer NOT NULL,
    created_by_user_id integer NOT NULL,
    updated_at_utc timestamp with time zone NOT NULL
);


ALTER TABLE core."TicketComments" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16437)
-- Name: TicketHistory; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."TicketHistory" (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    field character varying(50),
    old_value text,
    new_value text,
    updated_at_utc timestamp with time zone NOT NULL
);


ALTER TABLE core."TicketHistory" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: User; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."User" (
    id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(50),
    password character varying(50),
    active boolean,
    created_by_user_id integer NOT NULL,
    updated_by_user_id integer,
    created_at_utc timestamp with time zone NOT NULL,
    updated_at_utc timestamp with time zone,
    access_role_id integer
);


ALTER TABLE core."User" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: UserAccessRole; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."UserAccessRole" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    role_id integer,
    access_level integer
);


ALTER TABLE core."UserAccessRole" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16425)
-- Name: UserProjectRole; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."UserProjectRole" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE core."UserProjectRole" OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 16456)
-- Dependencies: 226
-- Data for Name: File; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."File" (id, name, extension, format, content, version, size_in_bytes, source_type, created_by_user_id, created_at_utc) FROM stdin;
\.


--
-- TOC entry 4891 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: Project; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."Project" (id, name, description, status, priority, parent_project_id, created_by_user_id, updated_by_user_id, assignee_user_id, created_at_utc, updated_at_utc, start_date_utc, end_date_utc) FROM stdin;
\.


--
-- TOC entry 4894 (class 0 OID 16417)
-- Dependencies: 219
-- Data for Name: Role; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."Role" (id, name, level, department, created_by_user_id, updated_by_user_id, created_at_utc, updated_at_utc) FROM stdin;
\.


--
-- TOC entry 4895 (class 0 OID 16420)
-- Dependencies: 220
-- Data for Name: RolePrivilege; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."RolePrivilege" (id, role_id, name) FROM stdin;
\.


--
-- TOC entry 4897 (class 0 OID 16430)
-- Dependencies: 222
-- Data for Name: Ticket; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."Ticket" (id, name, description, priority, status, project_id, type, assignee_user_id, start_date_utc, end_date_utc, created_by_user_id, updated_b_user_id, created_at_utc, updated_at_utc) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 16451)
-- Dependencies: 225
-- Data for Name: TicketAttachment; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."TicketAttachment" (id, file_id, ticket_id, created_by_user_id, created_at_utc) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 16444)
-- Dependencies: 224
-- Data for Name: TicketComments; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."TicketComments" (id, message, ticket_id, created_by_user_id, updated_at_utc) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 16437)
-- Dependencies: 223
-- Data for Name: TicketHistory; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."TicketHistory" (id, ticket_id, field, old_value, new_value, updated_at_utc) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 16407)
-- Dependencies: 217
-- Data for Name: User; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."User" (id, user_name, first_name, last_name, email, password, active, created_by_user_id, updated_by_user_id, created_at_utc, updated_at_utc, access_role_id) FROM stdin;
\.


--
-- TOC entry 4893 (class 0 OID 16412)
-- Dependencies: 218
-- Data for Name: UserAccessRole; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."UserAccessRole" (id, name, role_id, access_level) FROM stdin;
\.


--
-- TOC entry 4896 (class 0 OID 16425)
-- Dependencies: 221
-- Data for Name: UserProjectRole; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."UserProjectRole" (id, user_id, role_id, project_id) FROM stdin;
\.


--
-- TOC entry 4747 (class 2606 OID 16462)
-- Name: File File_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."File"
    ADD CONSTRAINT "File_pkey" PRIMARY KEY (id);


--
-- TOC entry 4729 (class 2606 OID 16406)
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 16424)
-- Name: RolePrivilege RolePrivilege_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."RolePrivilege"
    ADD CONSTRAINT "RolePrivilege_pkey" PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 16455)
-- Name: TicketAttachment TicketAttachment_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."TicketAttachment"
    ADD CONSTRAINT "TicketAttachment_pkey" PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16450)
-- Name: TicketComments TicketComments_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."TicketComments"
    ADD CONSTRAINT "TicketComments_pkey" PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 16443)
-- Name: TicketHistory TicketHistory_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."TicketHistory"
    ADD CONSTRAINT "TicketHistory_pkey" PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 16436)
-- Name: Ticket Ticket_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."Ticket"
    ADD CONSTRAINT "Ticket_pkey" PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 16416)
-- Name: UserAccessRole UserAccessRole_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."UserAccessRole"
    ADD CONSTRAINT "UserAccessRole_pkey" PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 16429)
-- Name: UserProjectRole UserProjectRole_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."UserProjectRole"
    ADD CONSTRAINT "UserProjectRole_pkey" PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 16411)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


-- Completed on 2024-11-25 20:32:00

--
-- PostgreSQL database dump complete
--


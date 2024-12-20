PGDMP  .    5            
    |         
   BugTracker    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16479 
   BugTracker    DATABASE     �   CREATE DATABASE "BugTracker" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "BugTracker";
                     postgres    false                        2615    16480    core    SCHEMA        CREATE SCHEMA core;
    DROP SCHEMA core;
                     postgres    false            �            1259    16481    File    TABLE     �  CREATE TABLE core."File" (
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
    DROP TABLE core."File";
       core         heap r       postgres    false    6            �            1259    16486    Project    TABLE     �  CREATE TABLE core."Project" (
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
    DROP TABLE core."Project";
       core         heap r       postgres    false    6            �            1259    16491    Role    TABLE     R  CREATE TABLE core."Role" (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    level character varying(10),
    department character varying(20),
    created_by_user_id integer NOT NULL,
    updated_by_user_id integer,
    created_at_utc timestamp with time zone NOT NULL,
    updated_at_utc timestamp with time zone
);
    DROP TABLE core."Role";
       core         heap r       postgres    false    6            �            1259    16494    RolePrivilege    TABLE     �   CREATE TABLE core."RolePrivilege" (
    id integer NOT NULL,
    role_id integer NOT NULL,
    name character varying(30) NOT NULL
);
 !   DROP TABLE core."RolePrivilege";
       core         heap r       postgres    false    6            �            1259    16497    Ticket    TABLE     �  CREATE TABLE core."Ticket" (
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
    DROP TABLE core."Ticket";
       core         heap r       postgres    false    6            �            1259    16502    TicketAttachment    TABLE     �   CREATE TABLE core."TicketAttachment" (
    id integer NOT NULL,
    file_id integer NOT NULL,
    ticket_id integer NOT NULL,
    created_by_user_id integer NOT NULL,
    created_at_utc timestamp with time zone NOT NULL
);
 $   DROP TABLE core."TicketAttachment";
       core         heap r       postgres    false    6            �            1259    16505    TicketComments    TABLE     �   CREATE TABLE core."TicketComments" (
    id integer NOT NULL,
    message text NOT NULL,
    ticket_id integer NOT NULL,
    created_by_user_id integer NOT NULL,
    updated_at_utc timestamp with time zone NOT NULL
);
 "   DROP TABLE core."TicketComments";
       core         heap r       postgres    false    6            �            1259    16510    TicketHistory    TABLE     �   CREATE TABLE core."TicketHistory" (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    field character varying(50),
    old_value text,
    new_value text,
    updated_at_utc timestamp with time zone NOT NULL
);
 !   DROP TABLE core."TicketHistory";
       core         heap r       postgres    false    6            �            1259    16515    User    TABLE     �  CREATE TABLE core."User" (
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
    DROP TABLE core."User";
       core         heap r       postgres    false    6            �            1259    16518    UserAccessRole    TABLE     �   CREATE TABLE core."UserAccessRole" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    role_id integer,
    access_level integer
);
 "   DROP TABLE core."UserAccessRole";
       core         heap r       postgres    false    6            �            1259    16521    UserProjectRole    TABLE     �   CREATE TABLE core."UserProjectRole" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    project_id integer NOT NULL
);
 #   DROP TABLE core."UserProjectRole";
       core         heap r       postgres    false    6           
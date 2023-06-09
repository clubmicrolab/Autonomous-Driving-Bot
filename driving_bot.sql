PGDMP     	                     {           driving_bot    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16583    driving_bot    DATABASE     �   CREATE DATABASE driving_bot WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Romanian_Romania.utf8';
    DROP DATABASE driving_bot;
                postgres    false            �            1259    16612    past_routes    TABLE     z   CREATE TABLE public.past_routes (
    route_id integer NOT NULL,
    date_of_ride timestamp without time zone NOT NULL
);
    DROP TABLE public.past_routes;
       public         heap    postgres    false            �            1259    16611    past_routes_route_id_seq    SEQUENCE     �   CREATE SEQUENCE public.past_routes_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.past_routes_route_id_seq;
       public          postgres    false    220                       0    0    past_routes_route_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.past_routes_route_id_seq OWNED BY public.past_routes.route_id;
          public          postgres    false    219            �            1259    16594    routes    TABLE     s   CREATE TABLE public.routes (
    route_id integer NOT NULL,
    start point NOT NULL,
    finish point NOT NULL
);
    DROP TABLE public.routes;
       public         heap    postgres    false            �            1259    16593    route_route_id_seq    SEQUENCE     �   CREATE SEQUENCE public.route_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.route_route_id_seq;
       public          postgres    false    215                       0    0    route_route_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.route_route_id_seq OWNED BY public.routes.route_id;
          public          postgres    false    214            �            1259    16604 
   sub_routes    TABLE     �   CREATE TABLE public.sub_routes (
    sub_route_id integer NOT NULL,
    route_id integer NOT NULL,
    direction numeric NOT NULL,
    angle numeric NOT NULL,
    distance numeric NOT NULL,
    start point NOT NULL,
    finish point NOT NULL
);
    DROP TABLE public.sub_routes;
       public         heap    postgres    false            �            1259    16603    sub_route_route_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_route_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.sub_route_route_id_seq;
       public          postgres    false    218                       0    0    sub_route_route_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.sub_route_route_id_seq OWNED BY public.sub_routes.route_id;
          public          postgres    false    217            �            1259    16602    sub_route_sub_route_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_route_sub_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.sub_route_sub_route_id_seq;
       public          postgres    false    218                       0    0    sub_route_sub_route_id_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public.sub_route_sub_route_id_seq OWNED BY public.sub_routes.sub_route_id;
          public          postgres    false    216            s           2604    16615    past_routes route_id    DEFAULT     |   ALTER TABLE ONLY public.past_routes ALTER COLUMN route_id SET DEFAULT nextval('public.past_routes_route_id_seq'::regclass);
 C   ALTER TABLE public.past_routes ALTER COLUMN route_id DROP DEFAULT;
       public          postgres    false    220    219    220            p           2604    16597    routes route_id    DEFAULT     q   ALTER TABLE ONLY public.routes ALTER COLUMN route_id SET DEFAULT nextval('public.route_route_id_seq'::regclass);
 >   ALTER TABLE public.routes ALTER COLUMN route_id DROP DEFAULT;
       public          postgres    false    215    214    215            q           2604    16607    sub_routes sub_route_id    DEFAULT     �   ALTER TABLE ONLY public.sub_routes ALTER COLUMN sub_route_id SET DEFAULT nextval('public.sub_route_sub_route_id_seq'::regclass);
 F   ALTER TABLE public.sub_routes ALTER COLUMN sub_route_id DROP DEFAULT;
       public          postgres    false    216    218    218            r           2604    16608    sub_routes route_id    DEFAULT     y   ALTER TABLE ONLY public.sub_routes ALTER COLUMN route_id SET DEFAULT nextval('public.sub_route_route_id_seq'::regclass);
 B   ALTER TABLE public.sub_routes ALTER COLUMN route_id DROP DEFAULT;
       public          postgres    false    218    217    218                      0    16612    past_routes 
   TABLE DATA           =   COPY public.past_routes (route_id, date_of_ride) FROM stdin;
    public          postgres    false    220   �                 0    16594    routes 
   TABLE DATA           9   COPY public.routes (route_id, start, finish) FROM stdin;
    public          postgres    false    215   �                 0    16604 
   sub_routes 
   TABLE DATA           g   COPY public.sub_routes (sub_route_id, route_id, direction, angle, distance, start, finish) FROM stdin;
    public          postgres    false    218   ?                  0    0    past_routes_route_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.past_routes_route_id_seq', 1, false);
          public          postgres    false    219                       0    0    route_route_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.route_route_id_seq', 3, true);
          public          postgres    false    214                       0    0    sub_route_route_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sub_route_route_id_seq', 1, true);
          public          postgres    false    217                       0    0    sub_route_sub_route_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.sub_route_sub_route_id_seq', 5, true);
          public          postgres    false    216               #   x�3�4202�50�54V04�26�20������ C^�         ;   x�3��01�303620�1�г03723ӄ��AEL-4�������DVmL��=... {�`         Q   x�m��	�0DѳTI�����_G|1�`���ס�1\�ġ�zKQEJD�V�]іQx́�ϟC�l�K
��>T��'!�R�     
PGDMP                         x            bd_proyecto    12.3    12.3 �    ]           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN9';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    37443    bd_proyecto    DATABASE     �   CREATE DATABASE bd_proyecto WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Peru.1252' LC_CTYPE = 'Spanish_Peru.1252';
    DROP DATABASE bd_proyecto;
                postgres    false            �            1259    37519    Reservacion_album    TABLE     �   CREATE TABLE public."Reservacion_album" (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);
 '   DROP TABLE public."Reservacion_album";
       public         heap    postgres    false            �            1259    37517    Reservacion_album_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_album_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Reservacion_album_id_seq";
       public          postgres    false    213            a           0    0    Reservacion_album_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Reservacion_album_id_seq" OWNED BY public."Reservacion_album".id;
          public          postgres    false    212            �            1259    37652    Reservacion_albumimage    TABLE     �   CREATE TABLE public."Reservacion_albumimage" (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    album_id integer
);
 ,   DROP TABLE public."Reservacion_albumimage";
       public         heap    postgres    false            �            1259    37650    Reservacion_albumimage_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_albumimage_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."Reservacion_albumimage_id_seq";
       public          postgres    false    235            b           0    0    Reservacion_albumimage_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."Reservacion_albumimage_id_seq" OWNED BY public."Reservacion_albumimage".id;
          public          postgres    false    234            �            1259    37527    Reservacion_condicion    TABLE     �   CREATE TABLE public."Reservacion_condicion" (
    "idCondicion" integer NOT NULL,
    "tituloCondicion" character varying(250),
    "descripcionCondicion" text,
    "estadoCondicion" boolean NOT NULL,
    "tipoCondicion" character varying(1)
);
 +   DROP TABLE public."Reservacion_condicion";
       public         heap    postgres    false            �            1259    37525 %   Reservacion_condicion_idCondicion_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_condicion_idCondicion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."Reservacion_condicion_idCondicion_seq";
       public          postgres    false    215            c           0    0 %   Reservacion_condicion_idCondicion_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."Reservacion_condicion_idCondicion_seq" OWNED BY public."Reservacion_condicion"."idCondicion";
          public          postgres    false    214            �            1259    37640    Reservacion_detallepaquete    TABLE     �  CREATE TABLE public."Reservacion_detallepaquete" (
    "idDetallePaquete" integer NOT NULL,
    "tituloDetallePaquete" character varying(250),
    "nroDiaDetallePaquete" smallint,
    "descripcionDetallePaquete" text,
    "imagenDetallePaquete" character varying(100),
    "estadoDetallePaquete" boolean NOT NULL,
    "paquete_detallePaquete_id" integer,
    CONSTRAINT "Reservacion_detallepaquete_nroDiaDetallePaquete_check" CHECK (("nroDiaDetallePaquete" >= 0))
);
 0   DROP TABLE public."Reservacion_detallepaquete";
       public         heap    postgres    false            �            1259    37638 /   Reservacion_detallepaquete_idDetallePaquete_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_detallepaquete_idDetallePaquete_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public."Reservacion_detallepaquete_idDetallePaquete_seq";
       public          postgres    false    233            d           0    0 /   Reservacion_detallepaquete_idDetallePaquete_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_detallepaquete_idDetallePaquete_seq" OWNED BY public."Reservacion_detallepaquete"."idDetallePaquete";
          public          postgres    false    232            �            1259    37538    Reservacion_hotel    TABLE       CREATE TABLE public."Reservacion_hotel" (
    "idHotel" integer NOT NULL,
    "nombreHotel" timestamp with time zone NOT NULL,
    "ciudadHotel" timestamp with time zone NOT NULL,
    "telefonoHotel" timestamp with time zone NOT NULL,
    "estadoVuelo" boolean NOT NULL
);
 '   DROP TABLE public."Reservacion_hotel";
       public         heap    postgres    false            �            1259    37536    Reservacion_hotel_idHotel_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_hotel_idHotel_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."Reservacion_hotel_idHotel_seq";
       public          postgres    false    217            e           0    0    Reservacion_hotel_idHotel_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Reservacion_hotel_idHotel_seq" OWNED BY public."Reservacion_hotel"."idHotel";
          public          postgres    false    216            �            1259    45077    Reservacion_mes    TABLE     �   CREATE TABLE public."Reservacion_mes" (
    "idMes" integer NOT NULL,
    "tituloMes" character varying(200) NOT NULL,
    "estadoMes" boolean NOT NULL
);
 %   DROP TABLE public."Reservacion_mes";
       public         heap    postgres    false            �            1259    45075    Reservacion_mes_idMes_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_mes_idMes_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Reservacion_mes_idMes_seq";
       public          postgres    false    244            f           0    0    Reservacion_mes_idMes_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Reservacion_mes_idMes_seq" OWNED BY public."Reservacion_mes"."idMes";
          public          postgres    false    243            �            1259    37622    Reservacion_paquete    TABLE     ,  CREATE TABLE public."Reservacion_paquete" (
    "idPaquete" integer NOT NULL,
    "tituloPaquete" character varying(250),
    "nDiasPaquete" character varying(2) NOT NULL,
    "nNochesPaquete" character varying(2) NOT NULL,
    "nHorasPaquete" character varying(2) NOT NULL,
    "tipoMonedaPaquete" character varying(1) NOT NULL,
    "precioPaquete" numeric(8,2),
    "unidadPorPrecioPaquete" character varying(1),
    "edadMinimaPaquete" integer,
    "visitasPaquete" integer,
    "mesPaquete" character varying(15),
    "disponibilidadPaquete" integer,
    "imagenPrincipal" character varying(100),
    "imagenAvatar" character varying(100),
    "estadoPaquete" boolean,
    "fechaCreacionPaquete" timestamp with time zone,
    "ofertaPaquete" boolean,
    CONSTRAINT "Reservacion_paquete_disponibilidadPaquete_c4463da1_check" CHECK (("disponibilidadPaquete" >= 0)),
    CONSTRAINT "Reservacion_paquete_edadMinimaPaquete_check" CHECK (("edadMinimaPaquete" >= 0)),
    CONSTRAINT "Reservacion_paquete_visitasPaquete_4b98a078_check" CHECK (("visitasPaquete" >= 0))
);
 )   DROP TABLE public."Reservacion_paquete";
       public         heap    postgres    false            �            1259    45055 %   Reservacion_paquete_condicion_paquete    TABLE     �   CREATE TABLE public."Reservacion_paquete_condicion_paquete" (
    id integer NOT NULL,
    paquete_id integer NOT NULL,
    condicion_id integer NOT NULL
);
 ;   DROP TABLE public."Reservacion_paquete_condicion_paquete";
       public         heap    postgres    false            �            1259    45053 ,   Reservacion_paquete_condicion_paquete_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_paquete_condicion_paquete_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public."Reservacion_paquete_condicion_paquete_id_seq";
       public          postgres    false    242            g           0    0 ,   Reservacion_paquete_condicion_paquete_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_paquete_condicion_paquete_id_seq" OWNED BY public."Reservacion_paquete_condicion_paquete".id;
          public          postgres    false    241            �            1259    37620 !   Reservacion_paquete_idPaquete_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_paquete_idPaquete_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."Reservacion_paquete_idPaquete_seq";
       public          postgres    false    231            h           0    0 !   Reservacion_paquete_idPaquete_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Reservacion_paquete_idPaquete_seq" OWNED BY public."Reservacion_paquete"."idPaquete";
          public          postgres    false    230            �            1259    45085    Reservacion_paquete_mes_paquete    TABLE     �   CREATE TABLE public."Reservacion_paquete_mes_paquete" (
    id integer NOT NULL,
    paquete_id integer NOT NULL,
    mes_id integer NOT NULL
);
 5   DROP TABLE public."Reservacion_paquete_mes_paquete";
       public         heap    postgres    false            �            1259    45083 &   Reservacion_paquete_mes_paquete_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_paquete_mes_paquete_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public."Reservacion_paquete_mes_paquete_id_seq";
       public          postgres    false    246            i           0    0 &   Reservacion_paquete_mes_paquete_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."Reservacion_paquete_mes_paquete_id_seq" OWNED BY public."Reservacion_paquete_mes_paquete".id;
          public          postgres    false    245            �            1259    44947    Reservacion_rating    TABLE     $  CREATE TABLE public."Reservacion_rating" (
    id integer NOT NULL,
    "scoreRating" smallint,
    "estadoRating" boolean NOT NULL,
    "usuario_Rating_id" integer,
    paquete_rating_id integer,
    CONSTRAINT "Reservacion_rating_scoreRating_3850d763_check" CHECK (("scoreRating" >= 0))
);
 (   DROP TABLE public."Reservacion_rating";
       public         heap    postgres    false            �            1259    44945    Reservacion_rating_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_rating_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Reservacion_rating_id_seq";
       public          postgres    false    240            j           0    0    Reservacion_rating_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Reservacion_rating_id_seq" OWNED BY public."Reservacion_rating".id;
          public          postgres    false    239            �            1259    37546    Reservacion_reservacion    TABLE       CREATE TABLE public."Reservacion_reservacion" (
    "idReservacion" integer NOT NULL,
    "fechaViajeReservacion" timestamp with time zone,
    "precioReservacion" integer NOT NULL,
    "estadoReservacion" boolean NOT NULL,
    "adultosReservacion" character varying(2) NOT NULL,
    "ni�osReservacion" character varying(2) NOT NULL,
    paquete_reservacion_id integer,
    "cuposReservacion" smallint,
    "usuario_Reservacion_id" integer,
    CONSTRAINT "Reservacion_reservacion_cuposReservacion_check" CHECK (("cuposReservacion" >= 0))
);
 -   DROP TABLE public."Reservacion_reservacion";
       public         heap    postgres    false            �            1259    37544 )   Reservacion_reservacion_idReservacion_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_reservacion_idReservacion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public."Reservacion_reservacion_idReservacion_seq";
       public          postgres    false    219            k           0    0 )   Reservacion_reservacion_idReservacion_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."Reservacion_reservacion_idReservacion_seq" OWNED BY public."Reservacion_reservacion"."idReservacion";
          public          postgres    false    218            �            1259    37573    Reservacion_usuario    TABLE     ~  CREATE TABLE public."Reservacion_usuario" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    "imagenUsuario" character varying(100),
    "DNIUsuario" character varying(20) NOT NULL,
    "telefonoUsuario" character varying(20) NOT NULL
);
 )   DROP TABLE public."Reservacion_usuario";
       public         heap    postgres    false            �            1259    37587    Reservacion_usuario_groups    TABLE     �   CREATE TABLE public."Reservacion_usuario_groups" (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    group_id integer NOT NULL
);
 0   DROP TABLE public."Reservacion_usuario_groups";
       public         heap    postgres    false            �            1259    37585 !   Reservacion_usuario_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_usuario_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."Reservacion_usuario_groups_id_seq";
       public          postgres    false    225            l           0    0 !   Reservacion_usuario_groups_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."Reservacion_usuario_groups_id_seq" OWNED BY public."Reservacion_usuario_groups".id;
          public          postgres    false    224            �            1259    37571    Reservacion_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_usuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Reservacion_usuario_id_seq";
       public          postgres    false    223            m           0    0    Reservacion_usuario_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Reservacion_usuario_id_seq" OWNED BY public."Reservacion_usuario".id;
          public          postgres    false    222            �            1259    37595 $   Reservacion_usuario_user_permissions    TABLE     �   CREATE TABLE public."Reservacion_usuario_user_permissions" (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    permission_id integer NOT NULL
);
 :   DROP TABLE public."Reservacion_usuario_user_permissions";
       public         heap    postgres    false            �            1259    37593 +   Reservacion_usuario_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_usuario_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public."Reservacion_usuario_user_permissions_id_seq";
       public          postgres    false    227            n           0    0 +   Reservacion_usuario_user_permissions_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public."Reservacion_usuario_user_permissions_id_seq" OWNED BY public."Reservacion_usuario_user_permissions".id;
          public          postgres    false    226            �            1259    45106    Reservacion_visitausuario    TABLE     ]   CREATE TABLE public."Reservacion_visitausuario" (
    usuario_visitas_id integer NOT NULL
);
 /   DROP TABLE public."Reservacion_visitausuario";
       public         heap    postgres    false            �            1259    45113 /   Reservacion_visitausuario_paquete_visitaUsuario    TABLE     �   CREATE TABLE public."Reservacion_visitausuario_paquete_visitaUsuario" (
    id integer NOT NULL,
    visitausuario_id integer NOT NULL,
    paquete_id integer NOT NULL
);
 E   DROP TABLE public."Reservacion_visitausuario_paquete_visitaUsuario";
       public         heap    postgres    false            �            1259    45111 6   Reservacion_visitausuario_paquete_visitaUsuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_visitausuario_paquete_visitaUsuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public."Reservacion_visitausuario_paquete_visitaUsuario_id_seq";
       public          postgres    false    249            o           0    0 6   Reservacion_visitausuario_paquete_visitaUsuario_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_visitausuario_paquete_visitaUsuario_id_seq" OWNED BY public."Reservacion_visitausuario_paquete_visitaUsuario".id;
          public          postgres    false    248            �            1259    37562    Reservacion_vuelo    TABLE     �   CREATE TABLE public."Reservacion_vuelo" (
    "idVuelo" integer NOT NULL,
    "origenVuelo" text NOT NULL,
    "destinoVuelo" text NOT NULL,
    "fechaVuelo" timestamp with time zone NOT NULL,
    "estadoVuelo" boolean NOT NULL
);
 '   DROP TABLE public."Reservacion_vuelo";
       public         heap    postgres    false            �            1259    37560    Reservacion_vuelo_idVuelo_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_vuelo_idVuelo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."Reservacion_vuelo_idVuelo_seq";
       public          postgres    false    221            p           0    0    Reservacion_vuelo_idVuelo_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Reservacion_vuelo_idVuelo_seq" OWNED BY public."Reservacion_vuelo"."idVuelo";
          public          postgres    false    220            �            1259    37603    Reservacion_vueloturista    TABLE     �   CREATE TABLE public."Reservacion_vueloturista" (
    "idVueloTurista" integer NOT NULL,
    "descripcion_vueloTurista" text NOT NULL,
    "estadoVueloTurista" boolean NOT NULL,
    "vuelo_vueloTurista_id" integer
);
 .   DROP TABLE public."Reservacion_vueloturista";
       public         heap    postgres    false            �            1259    37601 +   Reservacion_vueloturista_idVueloTurista_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_vueloturista_idVueloTurista_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public."Reservacion_vueloturista_idVueloTurista_seq";
       public          postgres    false    229            q           0    0 +   Reservacion_vueloturista_idVueloTurista_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_vueloturista_idVueloTurista_seq" OWNED BY public."Reservacion_vueloturista"."idVueloTurista";
          public          postgres    false    228            �            1259    37475 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    37473    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            r           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    37485    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    37483    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            s           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    37467    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    37465    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            t           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    37751    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    37749    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    237            u           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    236            �            1259    37457    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    37455    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            v           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    37446    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    37444    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            w           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    37773    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       2604    37522    Reservacion_album id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_album" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_album_id_seq"'::regclass);
 E   ALTER TABLE public."Reservacion_album" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            (           2604    37655    Reservacion_albumimage id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_albumimage" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_albumimage_id_seq"'::regclass);
 J   ALTER TABLE public."Reservacion_albumimage" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235                       2604    37530 !   Reservacion_condicion idCondicion    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_condicion" ALTER COLUMN "idCondicion" SET DEFAULT nextval('public."Reservacion_condicion_idCondicion_seq"'::regclass);
 T   ALTER TABLE public."Reservacion_condicion" ALTER COLUMN "idCondicion" DROP DEFAULT;
       public          postgres    false    214    215    215            &           2604    37643 +   Reservacion_detallepaquete idDetallePaquete    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_detallepaquete" ALTER COLUMN "idDetallePaquete" SET DEFAULT nextval('public."Reservacion_detallepaquete_idDetallePaquete_seq"'::regclass);
 ^   ALTER TABLE public."Reservacion_detallepaquete" ALTER COLUMN "idDetallePaquete" DROP DEFAULT;
       public          postgres    false    233    232    233                       2604    37541    Reservacion_hotel idHotel    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_hotel" ALTER COLUMN "idHotel" SET DEFAULT nextval('public."Reservacion_hotel_idHotel_seq"'::regclass);
 L   ALTER TABLE public."Reservacion_hotel" ALTER COLUMN "idHotel" DROP DEFAULT;
       public          postgres    false    216    217    217            .           2604    45080    Reservacion_mes idMes    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_mes" ALTER COLUMN "idMes" SET DEFAULT nextval('public."Reservacion_mes_idMes_seq"'::regclass);
 H   ALTER TABLE public."Reservacion_mes" ALTER COLUMN "idMes" DROP DEFAULT;
       public          postgres    false    244    243    244            "           2604    37625    Reservacion_paquete idPaquete    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_paquete" ALTER COLUMN "idPaquete" SET DEFAULT nextval('public."Reservacion_paquete_idPaquete_seq"'::regclass);
 P   ALTER TABLE public."Reservacion_paquete" ALTER COLUMN "idPaquete" DROP DEFAULT;
       public          postgres    false    230    231    231            -           2604    45058 (   Reservacion_paquete_condicion_paquete id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_paquete_condicion_paquete_id_seq"'::regclass);
 Y   ALTER TABLE public."Reservacion_paquete_condicion_paquete" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            /           2604    45088 "   Reservacion_paquete_mes_paquete id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_paquete_mes_paquete_id_seq"'::regclass);
 S   ALTER TABLE public."Reservacion_paquete_mes_paquete" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            +           2604    44950    Reservacion_rating id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_rating" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_rating_id_seq"'::regclass);
 F   ALTER TABLE public."Reservacion_rating" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240                       2604    37549 %   Reservacion_reservacion idReservacion    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_reservacion" ALTER COLUMN "idReservacion" SET DEFAULT nextval('public."Reservacion_reservacion_idReservacion_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_reservacion" ALTER COLUMN "idReservacion" DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    37576    Reservacion_usuario id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_id_seq"'::regclass);
 G   ALTER TABLE public."Reservacion_usuario" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223                       2604    37590    Reservacion_usuario_groups id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_groups_id_seq"'::regclass);
 N   ALTER TABLE public."Reservacion_usuario_groups" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225                        2604    37598 '   Reservacion_usuario_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_user_permissions_id_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_usuario_user_permissions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            0           2604    45116 2   Reservacion_visitausuario_paquete_visitaUsuario id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_visitausuario_paquete_visitaUsuario_id_seq"'::regclass);
 c   ALTER TABLE public."Reservacion_visitausuario_paquete_visitaUsuario" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249                       2604    37565    Reservacion_vuelo idVuelo    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_vuelo" ALTER COLUMN "idVuelo" SET DEFAULT nextval('public."Reservacion_vuelo_idVuelo_seq"'::regclass);
 L   ALTER TABLE public."Reservacion_vuelo" ALTER COLUMN "idVuelo" DROP DEFAULT;
       public          postgres    false    221    220    221            !           2604    37606 '   Reservacion_vueloturista idVueloTurista    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_vueloturista" ALTER COLUMN "idVueloTurista" SET DEFAULT nextval('public."Reservacion_vueloturista_idVueloTurista_seq"'::regclass);
 Z   ALTER TABLE public."Reservacion_vueloturista" ALTER COLUMN "idVueloTurista" DROP DEFAULT;
       public          postgres    false    228    229    229                       2604    37478    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209                       2604    37488    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211                       2604    37470    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            )           2604    37754    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237                       2604    37460    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205                       2604    37449    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            6          0    37519    Reservacion_album 
   TABLE DATA           X   COPY public."Reservacion_album" (id, title, "timestamp", updated, owner_id) FROM stdin;
    public          postgres    false    213            L          0    37652    Reservacion_albumimage 
   TABLE DATA           G   COPY public."Reservacion_albumimage" (id, image, album_id) FROM stdin;
    public          postgres    false    235            8          0    37527    Reservacion_condicion 
   TABLE DATA           �   COPY public."Reservacion_condicion" ("idCondicion", "tituloCondicion", "descripcionCondicion", "estadoCondicion", "tipoCondicion") FROM stdin;
    public          postgres    false    215            J          0    37640    Reservacion_detallepaquete 
   TABLE DATA           �   COPY public."Reservacion_detallepaquete" ("idDetallePaquete", "tituloDetallePaquete", "nroDiaDetallePaquete", "descripcionDetallePaquete", "imagenDetallePaquete", "estadoDetallePaquete", "paquete_detallePaquete_id") FROM stdin;
    public          postgres    false    233            :          0    37538    Reservacion_hotel 
   TABLE DATA           v   COPY public."Reservacion_hotel" ("idHotel", "nombreHotel", "ciudadHotel", "telefonoHotel", "estadoVuelo") FROM stdin;
    public          postgres    false    217            U          0    45077    Reservacion_mes 
   TABLE DATA           N   COPY public."Reservacion_mes" ("idMes", "tituloMes", "estadoMes") FROM stdin;
    public          postgres    false    244            H          0    37622    Reservacion_paquete 
   TABLE DATA           k  COPY public."Reservacion_paquete" ("idPaquete", "tituloPaquete", "nDiasPaquete", "nNochesPaquete", "nHorasPaquete", "tipoMonedaPaquete", "precioPaquete", "unidadPorPrecioPaquete", "edadMinimaPaquete", "visitasPaquete", "mesPaquete", "disponibilidadPaquete", "imagenPrincipal", "imagenAvatar", "estadoPaquete", "fechaCreacionPaquete", "ofertaPaquete") FROM stdin;
    public          postgres    false    231            S          0    45055 %   Reservacion_paquete_condicion_paquete 
   TABLE DATA           _   COPY public."Reservacion_paquete_condicion_paquete" (id, paquete_id, condicion_id) FROM stdin;
    public          postgres    false    242            W          0    45085    Reservacion_paquete_mes_paquete 
   TABLE DATA           S   COPY public."Reservacion_paquete_mes_paquete" (id, paquete_id, mes_id) FROM stdin;
    public          postgres    false    246            Q          0    44947    Reservacion_rating 
   TABLE DATA           y   COPY public."Reservacion_rating" (id, "scoreRating", "estadoRating", "usuario_Rating_id", paquete_rating_id) FROM stdin;
    public          postgres    false    240            <          0    37546    Reservacion_reservacion 
   TABLE DATA           �   COPY public."Reservacion_reservacion" ("idReservacion", "fechaViajeReservacion", "precioReservacion", "estadoReservacion", "adultosReservacion", "ni�osReservacion", paquete_reservacion_id, "cuposReservacion", "usuario_Reservacion_id") FROM stdin;
    public          postgres    false    219            @          0    37573    Reservacion_usuario 
   TABLE DATA           �   COPY public."Reservacion_usuario" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, "imagenUsuario", "DNIUsuario", "telefonoUsuario") FROM stdin;
    public          postgres    false    223            B          0    37587    Reservacion_usuario_groups 
   TABLE DATA           P   COPY public."Reservacion_usuario_groups" (id, usuario_id, group_id) FROM stdin;
    public          postgres    false    225            D          0    37595 $   Reservacion_usuario_user_permissions 
   TABLE DATA           _   COPY public."Reservacion_usuario_user_permissions" (id, usuario_id, permission_id) FROM stdin;
    public          postgres    false    227            X          0    45106    Reservacion_visitausuario 
   TABLE DATA           I   COPY public."Reservacion_visitausuario" (usuario_visitas_id) FROM stdin;
    public          postgres    false    247            Z          0    45113 /   Reservacion_visitausuario_paquete_visitaUsuario 
   TABLE DATA           m   COPY public."Reservacion_visitausuario_paquete_visitaUsuario" (id, visitausuario_id, paquete_id) FROM stdin;
    public          postgres    false    249            >          0    37562    Reservacion_vuelo 
   TABLE DATA           t   COPY public."Reservacion_vuelo" ("idVuelo", "origenVuelo", "destinoVuelo", "fechaVuelo", "estadoVuelo") FROM stdin;
    public          postgres    false    221            F          0    37603    Reservacion_vueloturista 
   TABLE DATA           �   COPY public."Reservacion_vueloturista" ("idVueloTurista", "descripcion_vueloTurista", "estadoVueloTurista", "vuelo_vueloTurista_id") FROM stdin;
    public          postgres    false    229            2          0    37475 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209            4          0    37485    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211            0          0    37467    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207            N          0    37751    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    237            .          0    37457    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205            ,          0    37446    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203            O          0    37773    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    238            x           0    0    Reservacion_album_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Reservacion_album_id_seq"', 1, false);
          public          postgres    false    212            y           0    0    Reservacion_albumimage_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_albumimage_id_seq"', 1, false);
          public          postgres    false    234            z           0    0 %   Reservacion_condicion_idCondicion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."Reservacion_condicion_idCondicion_seq"', 6, true);
          public          postgres    false    214            {           0    0 /   Reservacion_detallepaquete_idDetallePaquete_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public."Reservacion_detallepaquete_idDetallePaquete_seq"', 19, true);
          public          postgres    false    232            |           0    0    Reservacion_hotel_idHotel_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_hotel_idHotel_seq"', 1, false);
          public          postgres    false    216            }           0    0    Reservacion_mes_idMes_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Reservacion_mes_idMes_seq"', 1, false);
          public          postgres    false    243            ~           0    0 ,   Reservacion_paquete_condicion_paquete_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public."Reservacion_paquete_condicion_paquete_id_seq"', 505, true);
          public          postgres    false    241                       0    0 !   Reservacion_paquete_idPaquete_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Reservacion_paquete_idPaquete_seq"', 61, true);
          public          postgres    false    230            �           0    0 &   Reservacion_paquete_mes_paquete_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."Reservacion_paquete_mes_paquete_id_seq"', 463, true);
          public          postgres    false    245            �           0    0    Reservacion_rating_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Reservacion_rating_id_seq"', 28, true);
          public          postgres    false    239            �           0    0 )   Reservacion_reservacion_idReservacion_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."Reservacion_reservacion_idReservacion_seq"', 8, true);
          public          postgres    false    218            �           0    0 !   Reservacion_usuario_groups_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Reservacion_usuario_groups_id_seq"', 1, false);
          public          postgres    false    224            �           0    0    Reservacion_usuario_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Reservacion_usuario_id_seq"', 60, true);
          public          postgres    false    222            �           0    0 +   Reservacion_usuario_user_permissions_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Reservacion_usuario_user_permissions_id_seq"', 1, false);
          public          postgres    false    226            �           0    0 6   Reservacion_visitausuario_paquete_visitaUsuario_id_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public."Reservacion_visitausuario_paquete_visitaUsuario_id_seq"', 21, true);
          public          postgres    false    248            �           0    0    Reservacion_vuelo_idVuelo_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_vuelo_idVuelo_seq"', 1, false);
          public          postgres    false    220            �           0    0 +   Reservacion_vueloturista_idVueloTurista_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Reservacion_vueloturista_idVueloTurista_seq"', 1, false);
          public          postgres    false    228            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);
          public          postgres    false    206            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    236            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);
          public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 53, true);
          public          postgres    false    202            I           2606    37524 (   Reservacion_album Reservacion_album_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Reservacion_album"
    ADD CONSTRAINT "Reservacion_album_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Reservacion_album" DROP CONSTRAINT "Reservacion_album_pkey";
       public            postgres    false    213            r           2606    37657 2   Reservacion_albumimage Reservacion_albumimage_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Reservacion_albumimage"
    ADD CONSTRAINT "Reservacion_albumimage_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public."Reservacion_albumimage" DROP CONSTRAINT "Reservacion_albumimage_pkey";
       public            postgres    false    235            K           2606    37535 0   Reservacion_condicion Reservacion_condicion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."Reservacion_condicion"
    ADD CONSTRAINT "Reservacion_condicion_pkey" PRIMARY KEY ("idCondicion");
 ^   ALTER TABLE ONLY public."Reservacion_condicion" DROP CONSTRAINT "Reservacion_condicion_pkey";
       public            postgres    false    215            o           2606    37649 :   Reservacion_detallepaquete Reservacion_detallepaquete_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_detallepaquete"
    ADD CONSTRAINT "Reservacion_detallepaquete_pkey" PRIMARY KEY ("idDetallePaquete");
 h   ALTER TABLE ONLY public."Reservacion_detallepaquete" DROP CONSTRAINT "Reservacion_detallepaquete_pkey";
       public            postgres    false    233            M           2606    37543 (   Reservacion_hotel Reservacion_hotel_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Reservacion_hotel"
    ADD CONSTRAINT "Reservacion_hotel_pkey" PRIMARY KEY ("idHotel");
 V   ALTER TABLE ONLY public."Reservacion_hotel" DROP CONSTRAINT "Reservacion_hotel_pkey";
       public            postgres    false    217            �           2606    45082 $   Reservacion_mes Reservacion_mes_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."Reservacion_mes"
    ADD CONSTRAINT "Reservacion_mes_pkey" PRIMARY KEY ("idMes");
 R   ALTER TABLE ONLY public."Reservacion_mes" DROP CONSTRAINT "Reservacion_mes_pkey";
       public            postgres    false    244            �           2606    45062 d   Reservacion_paquete_condicion_paquete Reservacion_paquete_cond_paquete_id_condicion_id_42653190_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_cond_paquete_id_condicion_id_42653190_uniq" UNIQUE (paquete_id, condicion_id);
 �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete_cond_paquete_id_condicion_id_42653190_uniq";
       public            postgres    false    242    242            �           2606    45060 P   Reservacion_paquete_condicion_paquete Reservacion_paquete_condicion_paquete_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_condicion_paquete_pkey" PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete_condicion_paquete_pkey";
       public            postgres    false    242            �           2606    45092 _   Reservacion_paquete_mes_paquete Reservacion_paquete_mes_paquete_paquete_id_mes_id_8d55f067_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete"
    ADD CONSTRAINT "Reservacion_paquete_mes_paquete_paquete_id_mes_id_8d55f067_uniq" UNIQUE (paquete_id, mes_id);
 �   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete" DROP CONSTRAINT "Reservacion_paquete_mes_paquete_paquete_id_mes_id_8d55f067_uniq";
       public            postgres    false    246    246            �           2606    45090 D   Reservacion_paquete_mes_paquete Reservacion_paquete_mes_paquete_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete"
    ADD CONSTRAINT "Reservacion_paquete_mes_paquete_pkey" PRIMARY KEY (id);
 r   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete" DROP CONSTRAINT "Reservacion_paquete_mes_paquete_pkey";
       public            postgres    false    246            i           2606    37629 ,   Reservacion_paquete Reservacion_paquete_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."Reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_pkey" PRIMARY KEY ("idPaquete");
 Z   ALTER TABLE ONLY public."Reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete_pkey";
       public            postgres    false    231            l           2606    44989 C   Reservacion_paquete Reservacion_paquete_tituloPaquete_537a94a1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_tituloPaquete_537a94a1_uniq" UNIQUE ("tituloPaquete");
 q   ALTER TABLE ONLY public."Reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete_tituloPaquete_537a94a1_uniq";
       public            postgres    false    231            }           2606    44952 *   Reservacion_rating Reservacion_rating_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Reservacion_rating"
    ADD CONSTRAINT "Reservacion_rating_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."Reservacion_rating" DROP CONSTRAINT "Reservacion_rating_pkey";
       public            postgres    false    240            P           2606    37551 4   Reservacion_reservacion Reservacion_reservacion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_reservacion"
    ADD CONSTRAINT "Reservacion_reservacion_pkey" PRIMARY KEY ("idReservacion");
 b   ALTER TABLE ONLY public."Reservacion_reservacion" DROP CONSTRAINT "Reservacion_reservacion_pkey";
       public            postgres    false    219            [           2606    37592 :   Reservacion_usuario_groups Reservacion_usuario_groups_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_pkey";
       public            postgres    false    225            ^           2606    37671 W   Reservacion_usuario_groups Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq" UNIQUE (usuario_id, group_id);
 �   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq";
       public            postgres    false    225    225            U           2606    37582 ,   Reservacion_usuario Reservacion_usuario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Reservacion_usuario"
    ADD CONSTRAINT "Reservacion_usuario_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Reservacion_usuario" DROP CONSTRAINT "Reservacion_usuario_pkey";
       public            postgres    false    223            a           2606    37600 N   Reservacion_usuario_user_permissions Reservacion_usuario_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario_user_permissions_pkey" PRIMARY KEY (id);
 |   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario_user_permissions_pkey";
       public            postgres    false    227            d           2606    37685 d   Reservacion_usuario_user_permissions Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq" UNIQUE (usuario_id, permission_id);
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq";
       public            postgres    false    227    227            X           2606    37584 4   Reservacion_usuario Reservacion_usuario_username_key 
   CONSTRAINT     w   ALTER TABLE ONLY public."Reservacion_usuario"
    ADD CONSTRAINT "Reservacion_usuario_username_key" UNIQUE (username);
 b   ALTER TABLE ONLY public."Reservacion_usuario" DROP CONSTRAINT "Reservacion_usuario_username_key";
       public            postgres    false    223            �           2606    45125 o   Reservacion_visitausuario_paquete_visitaUsuario Reservacion_visitausuari_visitausuario_id_paquete_18cc244d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario"
    ADD CONSTRAINT "Reservacion_visitausuari_visitausuario_id_paquete_18cc244d_uniq" UNIQUE (visitausuario_id, paquete_id);
 �   ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario" DROP CONSTRAINT "Reservacion_visitausuari_visitausuario_id_paquete_18cc244d_uniq";
       public            postgres    false    249    249            �           2606    45118 d   Reservacion_visitausuario_paquete_visitaUsuario Reservacion_visitausuario_paquete_visitaUsuario_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario"
    ADD CONSTRAINT "Reservacion_visitausuario_paquete_visitaUsuario_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario" DROP CONSTRAINT "Reservacion_visitausuario_paquete_visitaUsuario_pkey";
       public            postgres    false    249            �           2606    45110 8   Reservacion_visitausuario Reservacion_visitausuario_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_visitausuario"
    ADD CONSTRAINT "Reservacion_visitausuario_pkey" PRIMARY KEY (usuario_visitas_id);
 f   ALTER TABLE ONLY public."Reservacion_visitausuario" DROP CONSTRAINT "Reservacion_visitausuario_pkey";
       public            postgres    false    247            S           2606    37570 (   Reservacion_vuelo Reservacion_vuelo_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Reservacion_vuelo"
    ADD CONSTRAINT "Reservacion_vuelo_pkey" PRIMARY KEY ("idVuelo");
 V   ALTER TABLE ONLY public."Reservacion_vuelo" DROP CONSTRAINT "Reservacion_vuelo_pkey";
       public            postgres    false    221            f           2606    37611 6   Reservacion_vueloturista Reservacion_vueloturista_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_vueloturista"
    ADD CONSTRAINT "Reservacion_vueloturista_pkey" PRIMARY KEY ("idVueloTurista");
 d   ALTER TABLE ONLY public."Reservacion_vueloturista" DROP CONSTRAINT "Reservacion_vueloturista_pkey";
       public            postgres    false    229            >           2606    37515    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            C           2606    37501 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            F           2606    37490 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            @           2606    37480    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            9           2606    37492 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            ;           2606    37472 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            u           2606    37760 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    237            4           2606    37464 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            6           2606    37462 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            2           2606    37454 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            y           2606    37780 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    238            G           1259    37748 #   Reservacion_album_owner_id_1fd92707    INDEX     i   CREATE INDEX "Reservacion_album_owner_id_1fd92707" ON public."Reservacion_album" USING btree (owner_id);
 9   DROP INDEX public."Reservacion_album_owner_id_1fd92707";
       public            postgres    false    213            p           1259    37747 (   Reservacion_albumimage_album_id_9c94a753    INDEX     s   CREATE INDEX "Reservacion_albumimage_album_id_9c94a753" ON public."Reservacion_albumimage" USING btree (album_id);
 >   DROP INDEX public."Reservacion_albumimage_album_id_9c94a753";
       public            postgres    false    235            m           1259    37741 =   Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6    INDEX     �   CREATE INDEX "Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6" ON public."Reservacion_detallepaquete" USING btree ("paquete_detallePaquete_id");
 S   DROP INDEX public."Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6";
       public            postgres    false    233            �           1259    45074 ;   Reservacion_paquete_condicion_paquete_condicion_id_be083b33    INDEX     �   CREATE INDEX "Reservacion_paquete_condicion_paquete_condicion_id_be083b33" ON public."Reservacion_paquete_condicion_paquete" USING btree (condicion_id);
 Q   DROP INDEX public."Reservacion_paquete_condicion_paquete_condicion_id_be083b33";
       public            postgres    false    242            �           1259    45073 9   Reservacion_paquete_condicion_paquete_paquete_id_145e8890    INDEX     �   CREATE INDEX "Reservacion_paquete_condicion_paquete_paquete_id_145e8890" ON public."Reservacion_paquete_condicion_paquete" USING btree (paquete_id);
 O   DROP INDEX public."Reservacion_paquete_condicion_paquete_paquete_id_145e8890";
       public            postgres    false    242            �           1259    45104 /   Reservacion_paquete_mes_paquete_mes_id_fa34386a    INDEX     �   CREATE INDEX "Reservacion_paquete_mes_paquete_mes_id_fa34386a" ON public."Reservacion_paquete_mes_paquete" USING btree (mes_id);
 E   DROP INDEX public."Reservacion_paquete_mes_paquete_mes_id_fa34386a";
       public            postgres    false    246            �           1259    45103 3   Reservacion_paquete_mes_paquete_paquete_id_fba9a683    INDEX     �   CREATE INDEX "Reservacion_paquete_mes_paquete_paquete_id_fba9a683" ON public."Reservacion_paquete_mes_paquete" USING btree (paquete_id);
 I   DROP INDEX public."Reservacion_paquete_mes_paquete_paquete_id_fba9a683";
       public            postgres    false    246            j           1259    44990 /   Reservacion_paquete_tituloPaquete_537a94a1_like    INDEX     �   CREATE INDEX "Reservacion_paquete_tituloPaquete_537a94a1_like" ON public."Reservacion_paquete" USING btree ("tituloPaquete" varchar_pattern_ops);
 E   DROP INDEX public."Reservacion_paquete_tituloPaquete_537a94a1_like";
       public            postgres    false    231            {           1259    45045 -   Reservacion_rating_paquete_rating_id_8365fb8f    INDEX     }   CREATE INDEX "Reservacion_rating_paquete_rating_id_8365fb8f" ON public."Reservacion_rating" USING btree (paquete_rating_id);
 C   DROP INDEX public."Reservacion_rating_paquete_rating_id_8365fb8f";
       public            postgres    false    240            ~           1259    45039 -   Reservacion_rating_usuario_Rating_id_0b30407b    INDEX        CREATE INDEX "Reservacion_rating_usuario_Rating_id_0b30407b" ON public."Reservacion_rating" USING btree ("usuario_Rating_id");
 C   DROP INDEX public."Reservacion_rating_usuario_Rating_id_0b30407b";
       public            postgres    false    240            N           1259    44937 7   Reservacion_reservacion_paquete_reservacion_id_a44aaa5a    INDEX     �   CREATE INDEX "Reservacion_reservacion_paquete_reservacion_id_a44aaa5a" ON public."Reservacion_reservacion" USING btree (paquete_reservacion_id);
 M   DROP INDEX public."Reservacion_reservacion_paquete_reservacion_id_a44aaa5a";
       public            postgres    false    219            Q           1259    44975 7   Reservacion_reservacion_usuario_Reservacion_id_1a5b3d9c    INDEX     �   CREATE INDEX "Reservacion_reservacion_usuario_Reservacion_id_1a5b3d9c" ON public."Reservacion_reservacion" USING btree ("usuario_Reservacion_id");
 M   DROP INDEX public."Reservacion_reservacion_usuario_Reservacion_id_1a5b3d9c";
       public            postgres    false    219            Y           1259    37683 ,   Reservacion_usuario_groups_group_id_b2a38555    INDEX     {   CREATE INDEX "Reservacion_usuario_groups_group_id_b2a38555" ON public."Reservacion_usuario_groups" USING btree (group_id);
 B   DROP INDEX public."Reservacion_usuario_groups_group_id_b2a38555";
       public            postgres    false    225            \           1259    37682 .   Reservacion_usuario_groups_usuario_id_7f9c3e4c    INDEX        CREATE INDEX "Reservacion_usuario_groups_usuario_id_7f9c3e4c" ON public."Reservacion_usuario_groups" USING btree (usuario_id);
 D   DROP INDEX public."Reservacion_usuario_groups_usuario_id_7f9c3e4c";
       public            postgres    false    225            _           1259    37697 ;   Reservacion_usuario_user_permissions_permission_id_c4af727c    INDEX     �   CREATE INDEX "Reservacion_usuario_user_permissions_permission_id_c4af727c" ON public."Reservacion_usuario_user_permissions" USING btree (permission_id);
 Q   DROP INDEX public."Reservacion_usuario_user_permissions_permission_id_c4af727c";
       public            postgres    false    227            b           1259    37696 8   Reservacion_usuario_user_permissions_usuario_id_b44609ab    INDEX     �   CREATE INDEX "Reservacion_usuario_user_permissions_usuario_id_b44609ab" ON public."Reservacion_usuario_user_permissions" USING btree (usuario_id);
 N   DROP INDEX public."Reservacion_usuario_user_permissions_usuario_id_b44609ab";
       public            postgres    false    227            V           1259    37669 *   Reservacion_usuario_username_ca69cc99_like    INDEX     �   CREATE INDEX "Reservacion_usuario_username_ca69cc99_like" ON public."Reservacion_usuario" USING btree (username varchar_pattern_ops);
 @   DROP INDEX public."Reservacion_usuario_username_ca69cc99_like";
       public            postgres    false    223            �           1259    45137 .   Reservacion_visitausuario__paquete_id_15f1dec7    INDEX     �   CREATE INDEX "Reservacion_visitausuario__paquete_id_15f1dec7" ON public."Reservacion_visitausuario_paquete_visitaUsuario" USING btree (paquete_id);
 D   DROP INDEX public."Reservacion_visitausuario__paquete_id_15f1dec7";
       public            postgres    false    249            �           1259    45136 4   Reservacion_visitausuario__visitausuario_id_b71a71ee    INDEX     �   CREATE INDEX "Reservacion_visitausuario__visitausuario_id_b71a71ee" ON public."Reservacion_visitausuario_paquete_visitaUsuario" USING btree (visitausuario_id);
 J   DROP INDEX public."Reservacion_visitausuario__visitausuario_id_b71a71ee";
       public            postgres    false    249            g           1259    37703 7   Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6    INDEX     �   CREATE INDEX "Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6" ON public."Reservacion_vueloturista" USING btree ("vuelo_vueloTurista_id");
 M   DROP INDEX public."Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6";
       public            postgres    false    229            <           1259    37516    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            A           1259    37512 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            D           1259    37513 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            7           1259    37498 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            s           1259    37771 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    237            v           1259    37772 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    237            w           1259    37782 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    238            z           1259    37781 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    238            �           2606    37658 O   Reservacion_album Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_album"
    ADD CONSTRAINT "Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id" FOREIGN KEY (owner_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public."Reservacion_album" DROP CONSTRAINT "Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id";
       public          postgres    false    213    223    2901            �           2606    37742 J   Reservacion_albumimage Reservacion_albumima_album_id_9c94a753_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_albumimage"
    ADD CONSTRAINT "Reservacion_albumima_album_id_9c94a753_fk_Reservaci" FOREIGN KEY (album_id) REFERENCES public."Reservacion_album"(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public."Reservacion_albumimage" DROP CONSTRAINT "Reservacion_albumima_album_id_9c94a753_fk_Reservaci";
       public          postgres    false    2889    213    235            �           2606    44899 Z   Reservacion_detallepaquete Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_detallepaquete"
    ADD CONSTRAINT "Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci" FOREIGN KEY ("paquete_detallePaquete_id") REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_detallepaquete" DROP CONSTRAINT "Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci";
       public          postgres    false    233    2921    231            �           2606    45068 ]   Reservacion_paquete_condicion_paquete Reservacion_paquete__condicion_id_be083b33_fk_Reservaci    FK CONSTRAINT        ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete__condicion_id_be083b33_fk_Reservaci" FOREIGN KEY (condicion_id) REFERENCES public."Reservacion_condicion"("idCondicion") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete__condicion_id_be083b33_fk_Reservaci";
       public          postgres    false    215    242    2891            �           2606    45098 Q   Reservacion_paquete_mes_paquete Reservacion_paquete__mes_id_fa34386a_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete"
    ADD CONSTRAINT "Reservacion_paquete__mes_id_fa34386a_fk_Reservaci" FOREIGN KEY (mes_id) REFERENCES public."Reservacion_mes"("idMes") DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete" DROP CONSTRAINT "Reservacion_paquete__mes_id_fa34386a_fk_Reservaci";
       public          postgres    false    2950    244    246            �           2606    45063 [   Reservacion_paquete_condicion_paquete Reservacion_paquete__paquete_id_145e8890_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete__paquete_id_145e8890_fk_Reservaci" FOREIGN KEY (paquete_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete__paquete_id_145e8890_fk_Reservaci";
       public          postgres    false    242    2921    231            �           2606    45093 U   Reservacion_paquete_mes_paquete Reservacion_paquete__paquete_id_fba9a683_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete"
    ADD CONSTRAINT "Reservacion_paquete__paquete_id_fba9a683_fk_Reservaci" FOREIGN KEY (paquete_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_paquete_mes_paquete" DROP CONSTRAINT "Reservacion_paquete__paquete_id_fba9a683_fk_Reservaci";
       public          postgres    false    2921    231    246            �           2606    45040 M   Reservacion_rating Reservacion_rating_paquete_rating_id_8365fb8f_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_rating"
    ADD CONSTRAINT "Reservacion_rating_paquete_rating_id_8365fb8f_fk_Reservaci" FOREIGN KEY (paquete_rating_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public."Reservacion_rating" DROP CONSTRAINT "Reservacion_rating_paquete_rating_id_8365fb8f_fk_Reservaci";
       public          postgres    false    240    2921    231            �           2606    45033 M   Reservacion_rating Reservacion_rating_usuario_Rating_id_0b30407b_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_rating"
    ADD CONSTRAINT "Reservacion_rating_usuario_Rating_id_0b30407b_fk_Reservaci" FOREIGN KEY ("usuario_Rating_id") REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public."Reservacion_rating" DROP CONSTRAINT "Reservacion_rating_usuario_Rating_id_0b30407b_fk_Reservaci";
       public          postgres    false    223    2901    240            �           2606    44938 W   Reservacion_reservacion Reservacion_reservac_paquete_reservacion__a44aaa5a_fk_Reservaci    FK CONSTRAINT        ALTER TABLE ONLY public."Reservacion_reservacion"
    ADD CONSTRAINT "Reservacion_reservac_paquete_reservacion__a44aaa5a_fk_Reservaci" FOREIGN KEY (paquete_reservacion_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_reservacion" DROP CONSTRAINT "Reservacion_reservac_paquete_reservacion__a44aaa5a_fk_Reservaci";
       public          postgres    false    219    231    2921            �           2606    44970 W   Reservacion_reservacion Reservacion_reservac_usuario_Reservacion__1a5b3d9c_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_reservacion"
    ADD CONSTRAINT "Reservacion_reservac_usuario_Reservacion__1a5b3d9c_fk_Reservaci" FOREIGN KEY ("usuario_Reservacion_id") REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_reservacion" DROP CONSTRAINT "Reservacion_reservac_usuario_Reservacion__1a5b3d9c_fk_Reservaci";
       public          postgres    false    223    219    2901            �           2606    37691 ]   Reservacion_usuario_user_permissions Reservacion_usuario__permission_id_c4af727c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario__permission_id_c4af727c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario__permission_id_c4af727c_fk_auth_perm";
       public          postgres    false    207    2875    227            �           2606    37672 P   Reservacion_usuario_groups Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci" FOREIGN KEY (usuario_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci";
       public          postgres    false    223    2901    225            �           2606    37686 Z   Reservacion_usuario_user_permissions Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci" FOREIGN KEY (usuario_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci";
       public          postgres    false    2901    223    227            �           2606    37677 X   Reservacion_usuario_groups Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id";
       public          postgres    false    209    225    2880            �           2606    45131 e   Reservacion_visitausuario_paquete_visitaUsuario Reservacion_visitaus_paquete_id_15f1dec7_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario"
    ADD CONSTRAINT "Reservacion_visitaus_paquete_id_15f1dec7_fk_Reservaci" FOREIGN KEY (paquete_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario" DROP CONSTRAINT "Reservacion_visitaus_paquete_id_15f1dec7_fk_Reservaci";
       public          postgres    false    2921    249    231            �           2606    45119 W   Reservacion_visitausuario Reservacion_visitaus_usuario_visitas_id_1cee4ac3_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_visitausuario"
    ADD CONSTRAINT "Reservacion_visitaus_usuario_visitas_id_1cee4ac3_fk_Reservaci" FOREIGN KEY (usuario_visitas_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_visitausuario" DROP CONSTRAINT "Reservacion_visitaus_usuario_visitas_id_1cee4ac3_fk_Reservaci";
       public          postgres    false    223    247    2901            �           2606    45126 k   Reservacion_visitausuario_paquete_visitaUsuario Reservacion_visitaus_visitausuario_id_b71a71ee_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario"
    ADD CONSTRAINT "Reservacion_visitaus_visitausuario_id_b71a71ee_fk_Reservaci" FOREIGN KEY (visitausuario_id) REFERENCES public."Reservacion_visitausuario"(usuario_visitas_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_visitausuario_paquete_visitaUsuario" DROP CONSTRAINT "Reservacion_visitaus_visitausuario_id_b71a71ee_fk_Reservaci";
       public          postgres    false    2958    249    247            �           2606    37698 X   Reservacion_vueloturista Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_vueloturista"
    ADD CONSTRAINT "Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci" FOREIGN KEY ("vuelo_vueloTurista_id") REFERENCES public."Reservacion_vuelo"("idVuelo") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_vueloturista" DROP CONSTRAINT "Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci";
       public          postgres    false    2899    229    221            �           2606    37507 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    2875    207            �           2606    37502 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    209    2880            �           2606    37493 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2870    205    207            �           2606    37761 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    237    2870    205            �           2606    37766 L   django_admin_log django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id" FOREIGN KEY (user_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id";
       public          postgres    false    2901    223    237            6      x������ � �      L      x������ � �      8   �   x�%��n�0Eg�+8&E` }�A�nM�f���l�DR�����doq.��ޱ{����g/	B�\����1��p�e�` 8e�d#�[F�#�<Z�d_Z�8RS�_��!�Y`���$�v�_~b�l���dՉYkG�j��e��*�E����^��q�xw�t��� 	ĆVf�ߍѵ�4��x������`T�1�E����Yk�s��/t�,��/G���s�u�?:�u�      J  
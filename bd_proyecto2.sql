PGDMP         *            
    x            bd_proyecto    12.3    12.3 �    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    37443    bd_proyecto    DATABASE     �   CREATE DATABASE bd_proyecto WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Peru.1252' LC_CTYPE = 'Spanish_Peru.1252';
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
       public          postgres    false    213            7           0    0    Reservacion_album_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Reservacion_album_id_seq" OWNED BY public."Reservacion_album".id;
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
       public          postgres    false    237            8           0    0    Reservacion_albumimage_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."Reservacion_albumimage_id_seq" OWNED BY public."Reservacion_albumimage".id;
          public          postgres    false    236            �            1259    37527    Reservacion_condicion    TABLE     �   CREATE TABLE public."Reservacion_condicion" (
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
       public          postgres    false    215            9           0    0 %   Reservacion_condicion_idCondicion_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."Reservacion_condicion_idCondicion_seq" OWNED BY public."Reservacion_condicion"."idCondicion";
          public          postgres    false    214            �            1259    45008 '   Reservacion_condicion_paquete_condicion    TABLE     �   CREATE TABLE public."Reservacion_condicion_paquete_condicion" (
    id integer NOT NULL,
    condicion_id integer NOT NULL,
    paquete_id integer NOT NULL
);
 =   DROP TABLE public."Reservacion_condicion_paquete_condicion";
       public         heap    postgres    false            �            1259    45006 .   Reservacion_condicion_paquete_condicion_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_condicion_paquete_condicion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public."Reservacion_condicion_paquete_condicion_id_seq";
       public          postgres    false    244            :           0    0 .   Reservacion_condicion_paquete_condicion_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_condicion_paquete_condicion_id_seq" OWNED BY public."Reservacion_condicion_paquete_condicion".id;
          public          postgres    false    243            �            1259    37640    Reservacion_detallepaquete    TABLE     �  CREATE TABLE public."Reservacion_detallepaquete" (
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
       public          postgres    false    235            ;           0    0 /   Reservacion_detallepaquete_idDetallePaquete_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_detallepaquete_idDetallePaquete_seq" OWNED BY public."Reservacion_detallepaquete"."idDetallePaquete";
          public          postgres    false    234            �            1259    37538    Reservacion_hotel    TABLE       CREATE TABLE public."Reservacion_hotel" (
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
       public          postgres    false    217            <           0    0    Reservacion_hotel_idHotel_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Reservacion_hotel_idHotel_seq" OWNED BY public."Reservacion_hotel"."idHotel";
          public          postgres    false    216            �            1259    37622    Reservacion_paquete    TABLE     ,  CREATE TABLE public."Reservacion_paquete" (
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
       public         heap    postgres    false            �            1259    37620 !   Reservacion_paquete_idPaquete_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_paquete_idPaquete_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."Reservacion_paquete_idPaquete_seq";
       public          postgres    false    233            =           0    0 !   Reservacion_paquete_idPaquete_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Reservacion_paquete_idPaquete_seq" OWNED BY public."Reservacion_paquete"."idPaquete";
          public          postgres    false    232            �            1259    44947    Reservacion_rating    TABLE     $  CREATE TABLE public."Reservacion_rating" (
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
       public          postgres    false    242            >           0    0    Reservacion_rating_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Reservacion_rating_id_seq" OWNED BY public."Reservacion_rating".id;
          public          postgres    false    241            �            1259    37546    Reservacion_reservacion    TABLE       CREATE TABLE public."Reservacion_reservacion" (
    "idReservacion" integer NOT NULL,
    "fechaViajeReservacion" timestamp with time zone,
    "precioReservacion" integer NOT NULL,
    "estadoReservacion" boolean NOT NULL,
    "adultosReservacion" character varying(2) NOT NULL,
    "niñosReservacion" character varying(2) NOT NULL,
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
       public          postgres    false    219            ?           0    0 )   Reservacion_reservacion_idReservacion_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."Reservacion_reservacion_idReservacion_seq" OWNED BY public."Reservacion_reservacion"."idReservacion";
          public          postgres    false    218            �            1259    37554    Reservacion_tipousuario    TABLE     �   CREATE TABLE public."Reservacion_tipousuario" (
    "idTipoUsuario" integer NOT NULL,
    "nombreTipoUsuario" character varying(100) NOT NULL,
    "fechaCreacionTipoUsuario" timestamp with time zone NOT NULL,
    "estadoTipoUsuario" boolean NOT NULL
);
 -   DROP TABLE public."Reservacion_tipousuario";
       public         heap    postgres    false            �            1259    37552 )   Reservacion_tipousuario_idTipoUsuario_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_tipousuario_idTipoUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public."Reservacion_tipousuario_idTipoUsuario_seq";
       public          postgres    false    221            @           0    0 )   Reservacion_tipousuario_idTipoUsuario_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."Reservacion_tipousuario_idTipoUsuario_seq" OWNED BY public."Reservacion_tipousuario"."idTipoUsuario";
          public          postgres    false    220            �            1259    37573    Reservacion_usuario    TABLE     }  CREATE TABLE public."Reservacion_usuario" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
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
       public          postgres    false    227            A           0    0 !   Reservacion_usuario_groups_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."Reservacion_usuario_groups_id_seq" OWNED BY public."Reservacion_usuario_groups".id;
          public          postgres    false    226            �            1259    37571    Reservacion_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_usuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Reservacion_usuario_id_seq";
       public          postgres    false    225            B           0    0    Reservacion_usuario_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Reservacion_usuario_id_seq" OWNED BY public."Reservacion_usuario".id;
          public          postgres    false    224            �            1259    37595 $   Reservacion_usuario_user_permissions    TABLE     �   CREATE TABLE public."Reservacion_usuario_user_permissions" (
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
       public          postgres    false    229            C           0    0 +   Reservacion_usuario_user_permissions_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public."Reservacion_usuario_user_permissions_id_seq" OWNED BY public."Reservacion_usuario_user_permissions".id;
          public          postgres    false    228            �            1259    37562    Reservacion_vuelo    TABLE     �   CREATE TABLE public."Reservacion_vuelo" (
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
       public          postgres    false    223            D           0    0    Reservacion_vuelo_idVuelo_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Reservacion_vuelo_idVuelo_seq" OWNED BY public."Reservacion_vuelo"."idVuelo";
          public          postgres    false    222            �            1259    37603    Reservacion_vueloturista    TABLE     �   CREATE TABLE public."Reservacion_vueloturista" (
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
       public          postgres    false    231            E           0    0 +   Reservacion_vueloturista_idVueloTurista_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_vueloturista_idVueloTurista_seq" OWNED BY public."Reservacion_vueloturista"."idVueloTurista";
          public          postgres    false    230            �            1259    37475 
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
       public          postgres    false    209            F           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
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
       public          postgres    false    211            G           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
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
       public          postgres    false    207            H           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
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
       public          postgres    false    239            I           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    238            �            1259    37457    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
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
       public          postgres    false    205            J           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
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
       public          postgres    false    203            K           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    37773    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       2604    37522    Reservacion_album id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_album" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_album_id_seq"'::regclass);
 E   ALTER TABLE public."Reservacion_album" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213                       2604    37655    Reservacion_albumimage id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_albumimage" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_albumimage_id_seq"'::regclass);
 J   ALTER TABLE public."Reservacion_albumimage" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            	           2604    37530 !   Reservacion_condicion idCondicion    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_condicion" ALTER COLUMN "idCondicion" SET DEFAULT nextval('public."Reservacion_condicion_idCondicion_seq"'::regclass);
 T   ALTER TABLE public."Reservacion_condicion" ALTER COLUMN "idCondicion" DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    45011 *   Reservacion_condicion_paquete_condicion id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_condicion_paquete_condicion_id_seq"'::regclass);
 [   ALTER TABLE public."Reservacion_condicion_paquete_condicion" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244                       2604    37643 +   Reservacion_detallepaquete idDetallePaquete    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_detallepaquete" ALTER COLUMN "idDetallePaquete" SET DEFAULT nextval('public."Reservacion_detallepaquete_idDetallePaquete_seq"'::regclass);
 ^   ALTER TABLE public."Reservacion_detallepaquete" ALTER COLUMN "idDetallePaquete" DROP DEFAULT;
       public          postgres    false    234    235    235            
           2604    37541    Reservacion_hotel idHotel    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_hotel" ALTER COLUMN "idHotel" SET DEFAULT nextval('public."Reservacion_hotel_idHotel_seq"'::regclass);
 L   ALTER TABLE public."Reservacion_hotel" ALTER COLUMN "idHotel" DROP DEFAULT;
       public          postgres    false    216    217    217                       2604    37625    Reservacion_paquete idPaquete    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_paquete" ALTER COLUMN "idPaquete" SET DEFAULT nextval('public."Reservacion_paquete_idPaquete_seq"'::regclass);
 P   ALTER TABLE public."Reservacion_paquete" ALTER COLUMN "idPaquete" DROP DEFAULT;
       public          postgres    false    232    233    233                       2604    44950    Reservacion_rating id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_rating" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_rating_id_seq"'::regclass);
 F   ALTER TABLE public."Reservacion_rating" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242                       2604    37549 %   Reservacion_reservacion idReservacion    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_reservacion" ALTER COLUMN "idReservacion" SET DEFAULT nextval('public."Reservacion_reservacion_idReservacion_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_reservacion" ALTER COLUMN "idReservacion" DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    37557 %   Reservacion_tipousuario idTipoUsuario    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_tipousuario" ALTER COLUMN "idTipoUsuario" SET DEFAULT nextval('public."Reservacion_tipousuario_idTipoUsuario_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_tipousuario" ALTER COLUMN "idTipoUsuario" DROP DEFAULT;
       public          postgres    false    221    220    221                       2604    37576    Reservacion_usuario id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_id_seq"'::regclass);
 G   ALTER TABLE public."Reservacion_usuario" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225                       2604    37590    Reservacion_usuario_groups id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_groups_id_seq"'::regclass);
 N   ALTER TABLE public."Reservacion_usuario_groups" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227                       2604    37598 '   Reservacion_usuario_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_user_permissions_id_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_usuario_user_permissions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229                       2604    37565    Reservacion_vuelo idVuelo    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_vuelo" ALTER COLUMN "idVuelo" SET DEFAULT nextval('public."Reservacion_vuelo_idVuelo_seq"'::regclass);
 L   ALTER TABLE public."Reservacion_vuelo" ALTER COLUMN "idVuelo" DROP DEFAULT;
       public          postgres    false    223    222    223                       2604    37606 '   Reservacion_vueloturista idVueloTurista    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_vueloturista" ALTER COLUMN "idVueloTurista" SET DEFAULT nextval('public."Reservacion_vueloturista_idVueloTurista_seq"'::regclass);
 Z   ALTER TABLE public."Reservacion_vueloturista" ALTER COLUMN "idVueloTurista" DROP DEFAULT;
       public          postgres    false    230    231    231                       2604    37478    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209                       2604    37488    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211                       2604    37470    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207                       2604    37754    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239                       2604    37460    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205                       2604    37449    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203                      0    37519    Reservacion_album 
   TABLE DATA           X   COPY public."Reservacion_album" (id, title, "timestamp", updated, owner_id) FROM stdin;
    public          postgres    false    213   0      )          0    37652    Reservacion_albumimage 
   TABLE DATA           G   COPY public."Reservacion_albumimage" (id, image, album_id) FROM stdin;
    public          postgres    false    237   .0                0    37527    Reservacion_condicion 
   TABLE DATA           �   COPY public."Reservacion_condicion" ("idCondicion", "tituloCondicion", "descripcionCondicion", "estadoCondicion", "tipoCondicion") FROM stdin;
    public          postgres    false    215   K0      0          0    45008 '   Reservacion_condicion_paquete_condicion 
   TABLE DATA           a   COPY public."Reservacion_condicion_paquete_condicion" (id, condicion_id, paquete_id) FROM stdin;
    public          postgres    false    244   T1      '          0    37640    Reservacion_detallepaquete 
   TABLE DATA           �   COPY public."Reservacion_detallepaquete" ("idDetallePaquete", "tituloDetallePaquete", "nroDiaDetallePaquete", "descripcionDetallePaquete", "imagenDetallePaquete", "estadoDetallePaquete", "paquete_detallePaquete_id") FROM stdin;
    public          postgres    false    235   q1                0    37538    Reservacion_hotel 
   TABLE DATA           v   COPY public."Reservacion_hotel" ("idHotel", "nombreHotel", "ciudadHotel", "telefonoHotel", "estadoVuelo") FROM stdin;
    public          postgres    false    217   �9      %          0    37622    Reservacion_paquete 
   TABLE DATA           k  COPY public."Reservacion_paquete" ("idPaquete", "tituloPaquete", "nDiasPaquete", "nNochesPaquete", "nHorasPaquete", "tipoMonedaPaquete", "precioPaquete", "unidadPorPrecioPaquete", "edadMinimaPaquete", "visitasPaquete", "mesPaquete", "disponibilidadPaquete", "imagenPrincipal", "imagenAvatar", "estadoPaquete", "fechaCreacionPaquete", "ofertaPaquete") FROM stdin;
    public          postgres    false    233   �9      .          0    44947    Reservacion_rating 
   TABLE DATA           y   COPY public."Reservacion_rating" (id, "scoreRating", "estadoRating", "usuario_Rating_id", paquete_rating_id) FROM stdin;
    public          postgres    false    242   �<                0    37546    Reservacion_reservacion 
   TABLE DATA           �   COPY public."Reservacion_reservacion" ("idReservacion", "fechaViajeReservacion", "precioReservacion", "estadoReservacion", "adultosReservacion", "niñosReservacion", paquete_reservacion_id, "cuposReservacion", "usuario_Reservacion_id") FROM stdin;
    public          postgres    false    219   :=                0    37554    Reservacion_tipousuario 
   TABLE DATA           �   COPY public."Reservacion_tipousuario" ("idTipoUsuario", "nombreTipoUsuario", "fechaCreacionTipoUsuario", "estadoTipoUsuario") FROM stdin;
    public          postgres    false    221   �=                0    37573    Reservacion_usuario 
   TABLE DATA           �   COPY public."Reservacion_usuario" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, "imagenUsuario", "DNIUsuario", "telefonoUsuario") FROM stdin;
    public          postgres    false    225   >                0    37587    Reservacion_usuario_groups 
   TABLE DATA           P   COPY public."Reservacion_usuario_groups" (id, usuario_id, group_id) FROM stdin;
    public          postgres    false    227   �N      !          0    37595 $   Reservacion_usuario_user_permissions 
   TABLE DATA           _   COPY public."Reservacion_usuario_user_permissions" (id, usuario_id, permission_id) FROM stdin;
    public          postgres    false    229   �N                0    37562    Reservacion_vuelo 
   TABLE DATA           t   COPY public."Reservacion_vuelo" ("idVuelo", "origenVuelo", "destinoVuelo", "fechaVuelo", "estadoVuelo") FROM stdin;
    public          postgres    false    223   O      #          0    37603    Reservacion_vueloturista 
   TABLE DATA           �   COPY public."Reservacion_vueloturista" ("idVueloTurista", "descripcion_vueloTurista", "estadoVueloTurista", "vuelo_vueloTurista_id") FROM stdin;
    public          postgres    false    231   4O                0    37475 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   QO                0    37485    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   nO                0    37467    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   �O      +          0    37751    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    239   dR      	          0    37457    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   �R                0    37446    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   PS      ,          0    37773    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    240   1W      L           0    0    Reservacion_album_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Reservacion_album_id_seq"', 1, false);
          public          postgres    false    212            M           0    0    Reservacion_albumimage_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_albumimage_id_seq"', 1, false);
          public          postgres    false    236            N           0    0 %   Reservacion_condicion_idCondicion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."Reservacion_condicion_idCondicion_seq"', 6, true);
          public          postgres    false    214            O           0    0 .   Reservacion_condicion_paquete_condicion_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public."Reservacion_condicion_paquete_condicion_id_seq"', 1, false);
          public          postgres    false    243            P           0    0 /   Reservacion_detallepaquete_idDetallePaquete_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public."Reservacion_detallepaquete_idDetallePaquete_seq"', 19, true);
          public          postgres    false    234            Q           0    0    Reservacion_hotel_idHotel_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_hotel_idHotel_seq"', 1, false);
          public          postgres    false    216            R           0    0 !   Reservacion_paquete_idPaquete_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Reservacion_paquete_idPaquete_seq"', 16, true);
          public          postgres    false    232            S           0    0    Reservacion_rating_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Reservacion_rating_id_seq"', 26, true);
          public          postgres    false    241            T           0    0 )   Reservacion_reservacion_idReservacion_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."Reservacion_reservacion_idReservacion_seq"', 8, true);
          public          postgres    false    218            U           0    0 )   Reservacion_tipousuario_idTipoUsuario_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."Reservacion_tipousuario_idTipoUsuario_seq"', 1, false);
          public          postgres    false    220            V           0    0 !   Reservacion_usuario_groups_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Reservacion_usuario_groups_id_seq"', 1, false);
          public          postgres    false    226            W           0    0    Reservacion_usuario_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Reservacion_usuario_id_seq"', 42, true);
          public          postgres    false    224            X           0    0 +   Reservacion_usuario_user_permissions_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Reservacion_usuario_user_permissions_id_seq"', 1, false);
          public          postgres    false    228            Y           0    0    Reservacion_vuelo_idVuelo_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_vuelo_idVuelo_seq"', 1, false);
          public          postgres    false    222            Z           0    0 +   Reservacion_vueloturista_idVueloTurista_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Reservacion_vueloturista_idVueloTurista_seq"', 1, false);
          public          postgres    false    230            [           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208            \           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            ]           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);
          public          postgres    false    206            ^           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    238            _           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);
          public          postgres    false    204            `           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);
          public          postgres    false    202            7           2606    37524 (   Reservacion_album Reservacion_album_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Reservacion_album"
    ADD CONSTRAINT "Reservacion_album_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Reservacion_album" DROP CONSTRAINT "Reservacion_album_pkey";
       public            postgres    false    213            b           2606    37657 2   Reservacion_albumimage Reservacion_albumimage_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Reservacion_albumimage"
    ADD CONSTRAINT "Reservacion_albumimage_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public."Reservacion_albumimage" DROP CONSTRAINT "Reservacion_albumimage_pkey";
       public            postgres    false    237            p           2606    45015 f   Reservacion_condicion_paquete_condicion Reservacion_condicion_pa_condicion_id_paquete_id_c2a4915c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion"
    ADD CONSTRAINT "Reservacion_condicion_pa_condicion_id_paquete_id_c2a4915c_uniq" UNIQUE (condicion_id, paquete_id);
 �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion" DROP CONSTRAINT "Reservacion_condicion_pa_condicion_id_paquete_id_c2a4915c_uniq";
       public            postgres    false    244    244            t           2606    45013 T   Reservacion_condicion_paquete_condicion Reservacion_condicion_paquete_condicion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion"
    ADD CONSTRAINT "Reservacion_condicion_paquete_condicion_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion" DROP CONSTRAINT "Reservacion_condicion_paquete_condicion_pkey";
       public            postgres    false    244            9           2606    37535 0   Reservacion_condicion Reservacion_condicion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."Reservacion_condicion"
    ADD CONSTRAINT "Reservacion_condicion_pkey" PRIMARY KEY ("idCondicion");
 ^   ALTER TABLE ONLY public."Reservacion_condicion" DROP CONSTRAINT "Reservacion_condicion_pkey";
       public            postgres    false    215            _           2606    37649 :   Reservacion_detallepaquete Reservacion_detallepaquete_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_detallepaquete"
    ADD CONSTRAINT "Reservacion_detallepaquete_pkey" PRIMARY KEY ("idDetallePaquete");
 h   ALTER TABLE ONLY public."Reservacion_detallepaquete" DROP CONSTRAINT "Reservacion_detallepaquete_pkey";
       public            postgres    false    235            ;           2606    37543 (   Reservacion_hotel Reservacion_hotel_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Reservacion_hotel"
    ADD CONSTRAINT "Reservacion_hotel_pkey" PRIMARY KEY ("idHotel");
 V   ALTER TABLE ONLY public."Reservacion_hotel" DROP CONSTRAINT "Reservacion_hotel_pkey";
       public            postgres    false    217            Y           2606    37629 ,   Reservacion_paquete Reservacion_paquete_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."Reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_pkey" PRIMARY KEY ("idPaquete");
 Z   ALTER TABLE ONLY public."Reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete_pkey";
       public            postgres    false    233            \           2606    44989 C   Reservacion_paquete Reservacion_paquete_tituloPaquete_537a94a1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_tituloPaquete_537a94a1_uniq" UNIQUE ("tituloPaquete");
 q   ALTER TABLE ONLY public."Reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete_tituloPaquete_537a94a1_uniq";
       public            postgres    false    233            m           2606    44952 *   Reservacion_rating Reservacion_rating_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Reservacion_rating"
    ADD CONSTRAINT "Reservacion_rating_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."Reservacion_rating" DROP CONSTRAINT "Reservacion_rating_pkey";
       public            postgres    false    242            >           2606    37551 4   Reservacion_reservacion Reservacion_reservacion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_reservacion"
    ADD CONSTRAINT "Reservacion_reservacion_pkey" PRIMARY KEY ("idReservacion");
 b   ALTER TABLE ONLY public."Reservacion_reservacion" DROP CONSTRAINT "Reservacion_reservacion_pkey";
       public            postgres    false    219            A           2606    37559 4   Reservacion_tipousuario Reservacion_tipousuario_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_tipousuario"
    ADD CONSTRAINT "Reservacion_tipousuario_pkey" PRIMARY KEY ("idTipoUsuario");
 b   ALTER TABLE ONLY public."Reservacion_tipousuario" DROP CONSTRAINT "Reservacion_tipousuario_pkey";
       public            postgres    false    221            K           2606    37592 :   Reservacion_usuario_groups Reservacion_usuario_groups_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_pkey";
       public            postgres    false    227            N           2606    37671 W   Reservacion_usuario_groups Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq" UNIQUE (usuario_id, group_id);
 �   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq";
       public            postgres    false    227    227            E           2606    37582 ,   Reservacion_usuario Reservacion_usuario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Reservacion_usuario"
    ADD CONSTRAINT "Reservacion_usuario_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Reservacion_usuario" DROP CONSTRAINT "Reservacion_usuario_pkey";
       public            postgres    false    225            Q           2606    37600 N   Reservacion_usuario_user_permissions Reservacion_usuario_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario_user_permissions_pkey" PRIMARY KEY (id);
 |   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario_user_permissions_pkey";
       public            postgres    false    229            T           2606    37685 d   Reservacion_usuario_user_permissions Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq" UNIQUE (usuario_id, permission_id);
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq";
       public            postgres    false    229    229            H           2606    37584 4   Reservacion_usuario Reservacion_usuario_username_key 
   CONSTRAINT     w   ALTER TABLE ONLY public."Reservacion_usuario"
    ADD CONSTRAINT "Reservacion_usuario_username_key" UNIQUE (username);
 b   ALTER TABLE ONLY public."Reservacion_usuario" DROP CONSTRAINT "Reservacion_usuario_username_key";
       public            postgres    false    225            C           2606    37570 (   Reservacion_vuelo Reservacion_vuelo_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Reservacion_vuelo"
    ADD CONSTRAINT "Reservacion_vuelo_pkey" PRIMARY KEY ("idVuelo");
 V   ALTER TABLE ONLY public."Reservacion_vuelo" DROP CONSTRAINT "Reservacion_vuelo_pkey";
       public            postgres    false    223            V           2606    37611 6   Reservacion_vueloturista Reservacion_vueloturista_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_vueloturista"
    ADD CONSTRAINT "Reservacion_vueloturista_pkey" PRIMARY KEY ("idVueloTurista");
 d   ALTER TABLE ONLY public."Reservacion_vueloturista" DROP CONSTRAINT "Reservacion_vueloturista_pkey";
       public            postgres    false    231            ,           2606    37515    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            1           2606    37501 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            4           2606    37490 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            .           2606    37480    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            '           2606    37492 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            )           2606    37472 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            e           2606    37760 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    239            "           2606    37464 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            $           2606    37462 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205                        2606    37454 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            i           2606    37780 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    240            5           1259    37748 #   Reservacion_album_owner_id_1fd92707    INDEX     i   CREATE INDEX "Reservacion_album_owner_id_1fd92707" ON public."Reservacion_album" USING btree (owner_id);
 9   DROP INDEX public."Reservacion_album_owner_id_1fd92707";
       public            postgres    false    213            `           1259    37747 (   Reservacion_albumimage_album_id_9c94a753    INDEX     s   CREATE INDEX "Reservacion_albumimage_album_id_9c94a753" ON public."Reservacion_albumimage" USING btree (album_id);
 >   DROP INDEX public."Reservacion_albumimage_album_id_9c94a753";
       public            postgres    false    237            q           1259    45026 =   Reservacion_condicion_paquete_condicion_condicion_id_d63c16c7    INDEX     �   CREATE INDEX "Reservacion_condicion_paquete_condicion_condicion_id_d63c16c7" ON public."Reservacion_condicion_paquete_condicion" USING btree (condicion_id);
 S   DROP INDEX public."Reservacion_condicion_paquete_condicion_condicion_id_d63c16c7";
       public            postgres    false    244            r           1259    45027 ;   Reservacion_condicion_paquete_condicion_paquete_id_002b3393    INDEX     �   CREATE INDEX "Reservacion_condicion_paquete_condicion_paquete_id_002b3393" ON public."Reservacion_condicion_paquete_condicion" USING btree (paquete_id);
 Q   DROP INDEX public."Reservacion_condicion_paquete_condicion_paquete_id_002b3393";
       public            postgres    false    244            ]           1259    37741 =   Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6    INDEX     �   CREATE INDEX "Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6" ON public."Reservacion_detallepaquete" USING btree ("paquete_detallePaquete_id");
 S   DROP INDEX public."Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6";
       public            postgres    false    235            Z           1259    44990 /   Reservacion_paquete_tituloPaquete_537a94a1_like    INDEX     �   CREATE INDEX "Reservacion_paquete_tituloPaquete_537a94a1_like" ON public."Reservacion_paquete" USING btree ("tituloPaquete" varchar_pattern_ops);
 E   DROP INDEX public."Reservacion_paquete_tituloPaquete_537a94a1_like";
       public            postgres    false    233            k           1259    45045 -   Reservacion_rating_paquete_rating_id_8365fb8f    INDEX     }   CREATE INDEX "Reservacion_rating_paquete_rating_id_8365fb8f" ON public."Reservacion_rating" USING btree (paquete_rating_id);
 C   DROP INDEX public."Reservacion_rating_paquete_rating_id_8365fb8f";
       public            postgres    false    242            n           1259    45039 -   Reservacion_rating_usuario_Rating_id_0b30407b    INDEX        CREATE INDEX "Reservacion_rating_usuario_Rating_id_0b30407b" ON public."Reservacion_rating" USING btree ("usuario_Rating_id");
 C   DROP INDEX public."Reservacion_rating_usuario_Rating_id_0b30407b";
       public            postgres    false    242            <           1259    44937 7   Reservacion_reservacion_paquete_reservacion_id_a44aaa5a    INDEX     �   CREATE INDEX "Reservacion_reservacion_paquete_reservacion_id_a44aaa5a" ON public."Reservacion_reservacion" USING btree (paquete_reservacion_id);
 M   DROP INDEX public."Reservacion_reservacion_paquete_reservacion_id_a44aaa5a";
       public            postgres    false    219            ?           1259    44975 7   Reservacion_reservacion_usuario_Reservacion_id_1a5b3d9c    INDEX     �   CREATE INDEX "Reservacion_reservacion_usuario_Reservacion_id_1a5b3d9c" ON public."Reservacion_reservacion" USING btree ("usuario_Reservacion_id");
 M   DROP INDEX public."Reservacion_reservacion_usuario_Reservacion_id_1a5b3d9c";
       public            postgres    false    219            I           1259    37683 ,   Reservacion_usuario_groups_group_id_b2a38555    INDEX     {   CREATE INDEX "Reservacion_usuario_groups_group_id_b2a38555" ON public."Reservacion_usuario_groups" USING btree (group_id);
 B   DROP INDEX public."Reservacion_usuario_groups_group_id_b2a38555";
       public            postgres    false    227            L           1259    37682 .   Reservacion_usuario_groups_usuario_id_7f9c3e4c    INDEX        CREATE INDEX "Reservacion_usuario_groups_usuario_id_7f9c3e4c" ON public."Reservacion_usuario_groups" USING btree (usuario_id);
 D   DROP INDEX public."Reservacion_usuario_groups_usuario_id_7f9c3e4c";
       public            postgres    false    227            O           1259    37697 ;   Reservacion_usuario_user_permissions_permission_id_c4af727c    INDEX     �   CREATE INDEX "Reservacion_usuario_user_permissions_permission_id_c4af727c" ON public."Reservacion_usuario_user_permissions" USING btree (permission_id);
 Q   DROP INDEX public."Reservacion_usuario_user_permissions_permission_id_c4af727c";
       public            postgres    false    229            R           1259    37696 8   Reservacion_usuario_user_permissions_usuario_id_b44609ab    INDEX     �   CREATE INDEX "Reservacion_usuario_user_permissions_usuario_id_b44609ab" ON public."Reservacion_usuario_user_permissions" USING btree (usuario_id);
 N   DROP INDEX public."Reservacion_usuario_user_permissions_usuario_id_b44609ab";
       public            postgres    false    229            F           1259    37669 *   Reservacion_usuario_username_ca69cc99_like    INDEX     �   CREATE INDEX "Reservacion_usuario_username_ca69cc99_like" ON public."Reservacion_usuario" USING btree (username varchar_pattern_ops);
 @   DROP INDEX public."Reservacion_usuario_username_ca69cc99_like";
       public            postgres    false    225            W           1259    37703 7   Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6    INDEX     �   CREATE INDEX "Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6" ON public."Reservacion_vueloturista" USING btree ("vuelo_vueloTurista_id");
 M   DROP INDEX public."Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6";
       public            postgres    false    231            *           1259    37516    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            /           1259    37512 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            2           1259    37513 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            %           1259    37498 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            c           1259    37771 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    239            f           1259    37772 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    239            g           1259    37782 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    240            j           1259    37781 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    240            x           2606    37658 O   Reservacion_album Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_album"
    ADD CONSTRAINT "Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id" FOREIGN KEY (owner_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public."Reservacion_album" DROP CONSTRAINT "Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id";
       public          postgres    false    213    2885    225            �           2606    37742 J   Reservacion_albumimage Reservacion_albumima_album_id_9c94a753_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_albumimage"
    ADD CONSTRAINT "Reservacion_albumima_album_id_9c94a753_fk_Reservaci" FOREIGN KEY (album_id) REFERENCES public."Reservacion_album"(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public."Reservacion_albumimage" DROP CONSTRAINT "Reservacion_albumima_album_id_9c94a753_fk_Reservaci";
       public          postgres    false    2871    237    213            �           2606    45016 _   Reservacion_condicion_paquete_condicion Reservacion_condicio_condicion_id_d63c16c7_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion"
    ADD CONSTRAINT "Reservacion_condicio_condicion_id_d63c16c7_fk_Reservaci" FOREIGN KEY (condicion_id) REFERENCES public."Reservacion_condicion"("idCondicion") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion" DROP CONSTRAINT "Reservacion_condicio_condicion_id_d63c16c7_fk_Reservaci";
       public          postgres    false    244    2873    215            �           2606    45021 ]   Reservacion_condicion_paquete_condicion Reservacion_condicio_paquete_id_002b3393_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion"
    ADD CONSTRAINT "Reservacion_condicio_paquete_id_002b3393_fk_Reservaci" FOREIGN KEY (paquete_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_condicion_paquete_condicion" DROP CONSTRAINT "Reservacion_condicio_paquete_id_002b3393_fk_Reservaci";
       public          postgres    false    2905    233    244            �           2606    44899 Z   Reservacion_detallepaquete Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_detallepaquete"
    ADD CONSTRAINT "Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci" FOREIGN KEY ("paquete_detallePaquete_id") REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_detallepaquete" DROP CONSTRAINT "Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci";
       public          postgres    false    233    235    2905            �           2606    45040 M   Reservacion_rating Reservacion_rating_paquete_rating_id_8365fb8f_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_rating"
    ADD CONSTRAINT "Reservacion_rating_paquete_rating_id_8365fb8f_fk_Reservaci" FOREIGN KEY (paquete_rating_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public."Reservacion_rating" DROP CONSTRAINT "Reservacion_rating_paquete_rating_id_8365fb8f_fk_Reservaci";
       public          postgres    false    233    2905    242            �           2606    45033 M   Reservacion_rating Reservacion_rating_usuario_Rating_id_0b30407b_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_rating"
    ADD CONSTRAINT "Reservacion_rating_usuario_Rating_id_0b30407b_fk_Reservaci" FOREIGN KEY ("usuario_Rating_id") REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public."Reservacion_rating" DROP CONSTRAINT "Reservacion_rating_usuario_Rating_id_0b30407b_fk_Reservaci";
       public          postgres    false    2885    225    242            y           2606    44938 W   Reservacion_reservacion Reservacion_reservac_paquete_reservacion__a44aaa5a_fk_Reservaci    FK CONSTRAINT        ALTER TABLE ONLY public."Reservacion_reservacion"
    ADD CONSTRAINT "Reservacion_reservac_paquete_reservacion__a44aaa5a_fk_Reservaci" FOREIGN KEY (paquete_reservacion_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_reservacion" DROP CONSTRAINT "Reservacion_reservac_paquete_reservacion__a44aaa5a_fk_Reservaci";
       public          postgres    false    219    233    2905            z           2606    44970 W   Reservacion_reservacion Reservacion_reservac_usuario_Reservacion__1a5b3d9c_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_reservacion"
    ADD CONSTRAINT "Reservacion_reservac_usuario_Reservacion__1a5b3d9c_fk_Reservaci" FOREIGN KEY ("usuario_Reservacion_id") REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_reservacion" DROP CONSTRAINT "Reservacion_reservac_usuario_Reservacion__1a5b3d9c_fk_Reservaci";
       public          postgres    false    2885    225    219            ~           2606    37691 ]   Reservacion_usuario_user_permissions Reservacion_usuario__permission_id_c4af727c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario__permission_id_c4af727c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario__permission_id_c4af727c_fk_auth_perm";
       public          postgres    false    229    207    2857            {           2606    37672 P   Reservacion_usuario_groups Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci" FOREIGN KEY (usuario_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci";
       public          postgres    false    227    2885    225            }           2606    37686 Z   Reservacion_usuario_user_permissions Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci" FOREIGN KEY (usuario_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci";
       public          postgres    false    225    229    2885            |           2606    37677 X   Reservacion_usuario_groups Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id";
       public          postgres    false    227    2862    209                       2606    37698 X   Reservacion_vueloturista Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_vueloturista"
    ADD CONSTRAINT "Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci" FOREIGN KEY ("vuelo_vueloTurista_id") REFERENCES public."Reservacion_vuelo"("idVuelo") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_vueloturista" DROP CONSTRAINT "Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci";
       public          postgres    false    223    2883    231            w           2606    37507 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    2857    207            v           2606    37502 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    209    2862            u           2606    37493 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    207    205    2852            �           2606    37761 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    239    2852    205            �           2606    37766 L   django_admin_log django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id" FOREIGN KEY (user_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id";
       public          postgres    false    2885    225    239                  x������ � �      )      x������ � �         �   x�%�=n�0Fg��"0���A�nM�f���l�DR��;e�|�J�&���w�>$&�I�K��1e�@��y��g��_��:�SV�^�l�:cK�c�eZ��_j������/�f��g�I`���$�v�_+b�dU��dE�I˕<
���%��J�I��
�ׅ�'�p%ޝ�!��b���+ߍ�5�T��x���"��`PJ����mǤ%�k#)�]�C���K��Wsn�����w�      0      x������ � �      '     x��W�r�=S_�K��-�eɖ��,�kmI#)�Jʗ�HA�f�c��)_��˥�Vn��O�%yݘ��un9H��F��ׯ���$�J?ި�>PTƙ�xUj��n�"eITզ���^]��F��f0����,�`���Jϓ+���ގ����h�iF&
mq��m{���N�û�ɚ]���A>So.�m�¯�T��PQ�+���0Ҙ�G	ds�Z���mX��RW�������IΔT�ޅ�4�����桽/<��+��V4�{�k��������Z#$ �r0�Fn���R� 8��*9Uh����LEa����S�HP?!���DjbC�=jȩ��"�����D���w�I��	�k�Zp�FGr������%W��o�.�9:H�Q#s�;d�X|������IT�#�&P��2�� ��_��k~ ���W��bI���?�P�c}�O�����/J-�L����������s���zݙS�iN6�HQ�W�Y�J��2�x:&�ԧ���ߑ� YʮH�%Ib|���N��%x�T>8���ǡ:����rĩ�ֆ���5���5X�\��|,�ЖJ�W�Z5�֏�:��|(�� ��K+Sf�u,$�R7:��O&0���|͛5eM���QFLM.O�c��=Z��c�Q(�:K�G�]м$�]�H�ͭ�p�j��!טy"�⏜?ٖs7�����<B9�D�LhJv��/�� ��:爹9��3���g�o����q��$i8)�G l0s�G%�Y>�W~�#;DEt�;��>�% +"r"�s<���F�YyS�ؠ����n��17���L�)D��+Q{�L�f�raI�hja(��x�!6ULpj���-��&]�.K��f�K2:��U��.؜d�R�S�U���M\l�����c��Сfa�����9V���h��%�π %*R{�����F0���9"q��T�FY� Ky�g����f'��0����o��o6������w;�צv�35�{���W� <b�S����m|��|wp���z��/��������������ٟ`(��R���;�3j���t�� ���-�H�5p�}��2t�B�C5Ve{O�
u���H��\���|��'�����+�7��~7�.��$��Fd��'&����*��o%�%���,�y�D����4�gS�ˡ�.�<��h���g��*_l*��h��H���ېV�2둌��)���&�b��J�8�ѵ}�M!�"��r�嗋��z]���/4zn>�7 г��e��N�<�9gT�~�9�,����6��Q��յL��YH�00[�R��m��ma���k]�����y`F�e�Ck����ԡ� b+��%�ft�>�&u�PO�܏_m�� ���4w���C^r��{�Iخ��j��aI�6B#ѼĕV�x��T>�wPM��[A��E��-�6!(%���0Q�C�x�������������?��_�򉉵wfjl?�Atj �w����U�ڠ�e����a�|�r�JA�����lb�k�ͫt��|r;z�ܗ,u�� 
̛�/d6��������jw�;wyd�v�yDFL�����9�)��w�����,82A�=A�����όw�!۟21:/ys);E894�HR���E�q�3�!���B��.t9�y�Q���@�p �����La�4;��#��_�π3U�s^ܖ���8V��܇$g�ΰ�3n�/9��o��1HS�'���\��+�YVy��9��q����*}+�3om�ʻ"a�T'�?+#vF  �(D�N��a��	Yudr�n0��k��x)��2��o�fg� !��j-�ټ�O�0��c{?�U�� _��+n@��Y<J�	?� �èAQ<���Q0�y�K+����/UKnu�2�����%^�"}�;ڡ�"=����m-Qo�}i��bm��-7W+=�0nՏ>|����1併t�f�g��K_�ҨY |$$�/]�P܋�ߨ��'NY��ZZ�ߧ�����`��            x������ � �      %   B  x��UKr�0\�S�"�l˟�bq�،?�f�'0��S��.G������ȲM�T�M��ү�ݏP��.��1�y�]@ ���]��h�Q6Ͷp!~�t�n'����:��Ow���u���l��?�/7�u�_U��u;@1ňD��%?�5��P0ڧ�]��"����d�7�%�NSh'�K�@K�-�A����g�hR��:�����?A|� �� >Ƈw/�}�$_�Q+��&hăoqy�v|O�9��GC8�k��C(�6�wB�qAm�N7�̞�'��-[��C�Wf(���|��5hV�vB���ׇ����Q_H��'���4��m��P�C�'��Qճ~��+Wu~>
��ߔT��s	�/Y��g�g ���=H���%˚��TI���\̅���f�IW�t�K�z��՚�Zi��x���	�P�J{M+�g�éZ3�ǘ�D�5س��=��	ݱ��v����J�\��Z��^gB�[X�����PM��g��7WC���{时��HWu{Vў�2���8��}��I�4�XFLz�2��{u�ʓk�(��Y�ba��tM'{D�b7CE<1�6r�u��[7�dg'�.و��|����qm�n�b�¬�(�4��.����1��۱΀|���7�q+�FS�w�G~S��R/GP�E̮���j#��GA�$�Γ ׭Z�V��Ҩ�#;v#1�0��	�~��a�ʾU#�(�ć���h�(�]�a6����>�
�9�d���%h�"٦vS_5nf<8�0ky�#z!���}?<&.��p)���z-�tq��q�{x�V!7�[G��n�����	�      .   7   x�3��4�,���4�22@b"�����HlNS�Ќ���cSeh����� ��         �   x�m��!E�5T��0������I����,�/ ��|�>@���47僴tPy�p�╯=�D̮m�Q���\3GŖw��y0����z�;�\�Y �7���@'�9����Uw�g44��z��2{���SF>:_��z��	���R�$i�*��g��@<[��jtC�            x������ � �            x��Y[����}�_�o���9�L:��A@/9�"*���ן���}��[��tG��j̪QcT���b�\��$���@���K�n�d�f)U-Ej8t�$�{���P:�6��-r1�e�eb�ٟf1�B����'O>Y�)���?X�92�2Kw��Q^�����^�'΂t���8����&�$��;������~gp�Ƌ��������=�¤%�K1�%eb�9)nc��o��-����bV̩�
�0F^F�l��2(��Y��� �:�Vr�)Q"a�
0��V�]e+8Ǡh�w1�0�xA�L��9xtZ���}oq:���G�l��n�Kkx��ɥ{�wF�;�*�^:���g���I�=F���"�Oѝ�|��>~��&",�~����@{���z��B���:�IA�齳nd� )΃v"�3g<�?D�%~$[j��=!E^�4U�kB�Q���ޣ�1b�2�|���{�'��/���[���/S���e>=��0�Bײ3V�&I�Ө-�&����ź��W�k{�]���(���0�$�����פ�(�? ��^p ��i˒y�獞R��t6Ӗq�:᳉�ﬅt���o�����9/�{� (��5XD[��|�3������O���b��YF��+��VF��#���b��Vy���->捥`�����l0�m;�� ޘ���~�_F�QK{��X s	tΙ���{�'+4��a���
�����Ar���o���P6���������U�쭬T��������b���TE�w6��� ��U:���C:� �Eg�d~8;�Dws݈��q2�U����b�n}V@��~΂����Jwm�.ZK�	&�6�M����z.ӓ��k��$Q���(�E�����VO�0�#���'��`����C���EF��D���GQ���o�à�kh�v��3�6��i����I��*\;��v�:�G�����v�H�Ĩ�#D�/9zpFb�4�v#�{���.ޗ����9�3C�����l��2��ߘ����)�EN�g=�zF��N����;t���b:5ڦ��!�Ȏ.�M�sT�e���1푧����s�ɂ�)L��6?�������n����cbD��O%F� 	Dk����[��o�PUS����^o����eT�ӌGsi-N.h�
v��h�bn��3�qmSSe�����<GWt��h�c[L�-�,8i�o��[�|��9,�H���� �װ�3��c�f��7ts�!��q	��`�������n>�,�<�S�hy�<C�'��[c\w=}^�Ȑ�"K�Sz�o��	b1�F p��U���~���l�Otsޕ�F.��CP���Q�1[�Z��e� iY��!L�����K*DƲ��u�Ȍ�x�:�X�?};_){���ȾO���	��#�#������J��ṙ�r|�Ǝq�����&'_�HΆg~�5�Bk�1�����	u����\�H·=z�]`���HCP�o��\��Kᄦ�QĒ_9��Ɨ���N~FfN(/ñ�P�amw��0̝h���r���M���=Li�2��d6_m����2NjB5����7Z�1v�̔�~}rlr"R�{�s/���3�È�y�4��t8��7=�'�Dk�����p����r��ǐjɳЀ[6�Zݐ�]��ˮ<S�zϓ�F �܎!�܈�3S�R��sXD$�C�EN��j�d����&׼��h=�hq�z%/����Vq��WN�����[��l���E�	#[r��)C��u���#?���X92�mb���e�TI$��$D��(�Ћ<�gEu�"m�7N�#�i��7K�����WR�z~p�♔���.�g�x�v٩�>��v٭��iʪ쀺���(��_�R\ ��G
� ���(�r"����N��2�⁴k��`B�c��;&)l�l��F�*BO��t���='~!0PAs���{U"��̘���mS����Yc�q��>�J�q���%�!��R��$��������r��q��y��q/v��6�yX��p�ӏ�67Rwg}���yw��3�1z��BӅ���X��r}�%���Ǉ��ʺ�/Al��<p���3"�xQ���@	X(���"��i���Q{��5�X��7�����M[�t� v�mTF�1����P��C���^�t����:�@i�����"��x�%�L�T�/�c���y����~c{�;�}"�A1»g�Yݹ�� ������<h��Z���M�ISn�ȁ[we�ѭ����?	�d1�n�A�E*�QI� (5�b�Z��з7�'5L�K�ޟ�-{�I����d[����F\�徵]8��ӕێ�Aͫ�Y�����]��ɏߣ?Y�Ib�`�E�J%�0^�R�q2�V�P[c�q��Є��:>���]z���	ˤOd4�'��w5t���b4u";j��h�Quy90e���
G	X���1�Ѐ8ʞ �.ꅪq}�n.w������~��N���`rr��i��?;.��Ek��b�13�;ٚA�+`m��MU��mS����0��m��Ֆ���7=x ©��~J�,O$\�/��C��G�.��j�m}%�ZS�[Lmk(d�}�:�����?^Da/{���14����eGV��w���]j�6g��nw+�#�{o�?1��$ �@�$�9�E0�5�Ӊ�,ry�s������9Ky��ey�瓹�Y$�K�n>]�N,�g,3���T!��Ag�W�Q�U�q�{�2`Sx����,ǒjH�����������;��7�F氝��p�d!���ip���4����T�:�].�g^���5���!��ae5F��5fQ��$*�B���������V�_K^�-"�y#A�k��߶W!1<���E�@�x���]����4��侚�Ӏ�ӏk�wJO��bL�.�m��tU �{ �`�1o©JeP�_��P�O�6'����0��E�� ����;X��g|�%J�8��^���˃�L�K>B��N��}��A�6������빳��sf�r����`�@�㠀�<�7���1�_�
�`P� �*U#�B"4�yaZ˽�E�2�JC�,�H�����}RR�4���m�N��>\��������V��N��z��������n+�����$ĲB��X�X�i���Io��5�k���<���*.�_��&�D����s������&Χ��`�Ŗ��Z����.Acj��H�+`ЦP=ЕD,V{\#/\w&ibj��뎕Fٙ�:rc����w��0L�.�Y�A��at��Lvp(�l��v;С@�4�ޮ��1r� ��k��ʉ�V�~�$��k�նC���v�i#
�W��̭��ӛ�[�eܢ�}����pؓOx���#	��3�W8��l���iW4���}��Z@���^��,a1'TB���$(�V��o���:�(5��Nr��e���.�f�O�ky[��<jE�aB���ϲ �S�Z�b��5�M� T�ϱw��@*��Q�{\��0�´ ��u3��F��>^F���-���|\���.z����w�ܡ1:�f4г�0^�ˇ��s�k�Y�B������@��^�Fu3�+������'�`.xN�i;��� /�bw7�q*�ѡQ���bRi�����7�FŇ��U��Z�fMI��=;�5>@����[�O]�+0 L�n�"��$�U?!��<�;��T}�`���*_�#RA���׸.Dp#s���}�z�s	ږ��������hO��#��*6.�.�<�Q}����j �Հ�ʦ=�-�������1��Ĳ�'�*��F`� [U�^���5r���Tګ���\7�7���s��#O�:m1S��\;�s�%��s���1l�צ�΀9�dK��uGw�q�{��|$5%��o�s���V V	[�^=����B'���7?蹴(�7uH�S������qg����z���Gk�����FW�  �   ���z�0YXJm�]�a�;��hw��ݘQ=}�z|Ǐ�N]�$Zu/�x�k���fF��.��2o8�EىJ�i������3f�M��	�nf�z{�O�W����螩�8vp�VWA]��2�j�n��wm&��/�lm�e~N�w�]�T��&�`�{< `�Ċ5��	E����Y����,�            x������ � �      !      x������ � �            x������ � �      #      x������ � �            x������ � �            x������ � �         �  x�m�[��0E��UxEd�y|����;�G��}�I��"�08�}M;����w]5L�*���e����qK[r{��=(*�l ��V��G �}���W��6�=���/K?��5.ؓ�S �	�,�������"�Qp�ly���a������"N:�:�ԬB X�v�nӸƳ�֯G0G�ҫb�Q�0Z)��n���?�hA��b��z	�l[ƕu)�zf�*C=���1Vq���s�mk��GD��Oz "�{�����Ʈ�E���s�`�t7S������~R�z�w:��R���O��hN�����\@~�F%����BP
���9	sX���/1sQ��
�f�I�*G?��h\�)X��Tm���~2���r~հd���Fkՠ�Q6��l8���8�+������44`a�*.@KdT^2�bȈ�d\p���S5.��,�BBZdH� �Ȑ�!����>�j��~Y�q��l{�v<��ǔ[ܷӒ-��rK]�l�C�8������?��w���0�:�m�r��E�R6�D�5���"[{m��&N��\6����
����8�)���r'%A�ob8A]X�0�OB���rnP���AٲM�l���6��&�������?�=�g�P�'�˂�Cq���q���a�(�6>+�x7.M���gTFhH �����D�I#!�~Xk����/      +      x������ � �      	   �   x�e�K�0D��ai)�k�fc���IH$nO
�cu7�7�5����qa /���"���&Ι����)�s	^jT��� �����[s�L鎗:t�2�Ny���g{�A��Ay�����䂉X�н��f��o�]f�$΂`7�1^i�P�����o�����=	:G_�[�O8T���#�8� �	��         �  x����n�:��ӧ�������8�G�PJS$�@�����N!��ҕ�����f���Ԝ���Ҍ;)%���Nm��P�|x��G�4TJi���*�nVb�S�ل�!~���y�B)-D��������iW�y����!\��Ԏc۟�é���|䧶(#�Y�.���:�Gs���EI �#��uO�i;�e��p�RLvF�{DW�S��cˁ]�G�ahT6B�1\�_�v����b�3���?#�m�u׾�S?��~{�0�C85�X��D�UJ��f�Y���&�L��e u��:���#�@�f \/��&\���ם���F������������46�l�۩}�F�0����eF�؋��m9�>V�!�[M�!v���jԇ)v�{W��o���(����`n76�L=	��T�Z�e�0o?.�4A�b��U!���	���Џ �/Ae-J�*!�����c��Զ�%D��z�J�J���h�2���� ^�q{�1��(�:�n|�[�+!.��;��B]B\AP+F�+ɝa�w9SB�=0��%��{�KEF8�d�- ��� ��pS��MV`*e�t2�ĕXAt�F����T�V(�'')�����PO��x�0��W��\�JKyӷ����{s��C�x�䴰- ,OJ��JiA�#��8Nl�|j[m]j*�����c��P>ȩt̆q�=���	0��L��`9C�>&������VD��f�D�rh���¥�umx¯�}�������*�I��*U?���f�ꒃr��;N^��dP)3�d�+����qJP:p ���Rf\��WH V�&秔W㗯���ۊ;�K�C*�*�F�@xD�!ܞ\{c=P��&��B��`��K��J�Qo ��*��1�!��h
x���7�[ɐRe�E�{S�y�E�x�[�q������F�߄�����?��6�      ,   �  x�u��n�0E��W��a)��.R�J�� CE��j,R��4Q����@�E�ng.0��;��7��������[{�xT���u"�Xth�j��5uG(y�I1)��.��<#�)����Q]�k��Q�ˉ�:Ѥ�+���N��9���+wx<��C`J �޻-�v��K����������ACt�t��/U����U�J�U{O��3J��N2�˭p��ɜp�K22�1o�:�'<��xVG�A8�� �0Z"�̃E8��`
#�,���ݫ�Oo���ڴ/��kʱ�NX�,�Ȝ�dh�z3N¨��i']��9Jv)�k1'�����F���9��V����;�Q^É�V98��/�V��-7q-л-]��+��]���B�P��V��o�N��:����� ���8d��`����)'ˎ�tw�j��+�y��g~V^��˛B����o2F3> ��`	���pq����t:����L     
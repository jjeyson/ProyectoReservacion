PGDMP     1                
    x            bd_proyecto    12.3    12.3 �    =           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN9';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    37443    bd_proyecto    DATABASE     �   CREATE DATABASE bd_proyecto WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Peru.1252' LC_CTYPE = 'Spanish_Peru.1252';
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
       public          postgres    false    213            A           0    0    Reservacion_album_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Reservacion_album_id_seq" OWNED BY public."Reservacion_album".id;
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
       public          postgres    false    241            B           0    0    Reservacion_albumimage_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."Reservacion_albumimage_id_seq" OWNED BY public."Reservacion_albumimage".id;
          public          postgres    false    240            �            1259    37527    Reservacion_condicion    TABLE     �   CREATE TABLE public."Reservacion_condicion" (
    "idCondicion" integer NOT NULL,
    "tituloCondicion" character varying(250),
    "descripcionCondicion" text,
    "estadoCondicion" boolean NOT NULL
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
       public          postgres    false    215            C           0    0 %   Reservacion_condicion_idCondicion_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."Reservacion_condicion_idCondicion_seq" OWNED BY public."Reservacion_condicion"."idCondicion";
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
       public          postgres    false    239            D           0    0 /   Reservacion_detallepaquete_idDetallePaquete_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_detallepaquete_idDetallePaquete_seq" OWNED BY public."Reservacion_detallepaquete"."idDetallePaquete";
          public          postgres    false    238            �            1259    37538    Reservacion_hotel    TABLE       CREATE TABLE public."Reservacion_hotel" (
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
       public          postgres    false    217            E           0    0    Reservacion_hotel_idHotel_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Reservacion_hotel_idHotel_seq" OWNED BY public."Reservacion_hotel"."idHotel";
          public          postgres    false    216            �            1259    37622    Reservacion_paquete    TABLE     n  CREATE TABLE public."Reservacion_paquete" (
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
    "disponibilidadPaquete" smallint,
    "imagenPrincipal" character varying(100),
    "imagenAvatar" character varying(100),
    "estadoPaquete" boolean,
    CONSTRAINT "Reservacion_paquete_disponibilidadPaquete_check" CHECK (("disponibilidadPaquete" >= 0)),
    CONSTRAINT "Reservacion_paquete_edadMinimaPaquete_check" CHECK (("edadMinimaPaquete" >= 0))
);
 )   DROP TABLE public."Reservacion_paquete";
       public         heap    postgres    false            �            1259    37632 %   Reservacion_paquete_condicion_paquete    TABLE     �   CREATE TABLE public."Reservacion_paquete_condicion_paquete" (
    id integer NOT NULL,
    paquete_id integer NOT NULL,
    condicion_id integer NOT NULL
);
 ;   DROP TABLE public."Reservacion_paquete_condicion_paquete";
       public         heap    postgres    false            �            1259    37630 ,   Reservacion_paquete_condicion_paquete_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_paquete_condicion_paquete_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public."Reservacion_paquete_condicion_paquete_id_seq";
       public          postgres    false    237            F           0    0 ,   Reservacion_paquete_condicion_paquete_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_paquete_condicion_paquete_id_seq" OWNED BY public."Reservacion_paquete_condicion_paquete".id;
          public          postgres    false    236            �            1259    37620 !   Reservacion_paquete_idPaquete_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_paquete_idPaquete_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."Reservacion_paquete_idPaquete_seq";
       public          postgres    false    235            G           0    0 !   Reservacion_paquete_idPaquete_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Reservacion_paquete_idPaquete_seq" OWNED BY public."Reservacion_paquete"."idPaquete";
          public          postgres    false    234            �            1259    44893 '   Reservacion_paquete_reservacion_paquete    TABLE     �   CREATE TABLE public."Reservacion_paquete_reservacion_paquete" (
    id integer NOT NULL,
    paquete_id integer NOT NULL,
    reservacion_id integer NOT NULL
);
 =   DROP TABLE public."Reservacion_paquete_reservacion_paquete";
       public         heap    postgres    false            �            1259    44891 .   Reservacion_paquete_reservacion_paquete_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_paquete_reservacion_paquete_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public."Reservacion_paquete_reservacion_paquete_id_seq";
       public          postgres    false    246            H           0    0 .   Reservacion_paquete_reservacion_paquete_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_paquete_reservacion_paquete_id_seq" OWNED BY public."Reservacion_paquete_reservacion_paquete".id;
          public          postgres    false    245            �            1259    37546    Reservacion_reservacion    TABLE     T  CREATE TABLE public."Reservacion_reservacion" (
    "idReservacion" integer NOT NULL,
    "fechaRegistroReservacion" timestamp with time zone,
    "fechaEntradaReservacion" timestamp with time zone,
    "fechaSalidaReservacion" timestamp with time zone,
    "precioReservacion" integer NOT NULL,
    "estadoReservacion" boolean NOT NULL
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
       public          postgres    false    219            I           0    0 )   Reservacion_reservacion_idReservacion_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."Reservacion_reservacion_idReservacion_seq" OWNED BY public."Reservacion_reservacion"."idReservacion";
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
       public          postgres    false    221            J           0    0 )   Reservacion_tipousuario_idTipoUsuario_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."Reservacion_tipousuario_idTipoUsuario_seq" OWNED BY public."Reservacion_tipousuario"."idTipoUsuario";
          public          postgres    false    220            �            1259    37573    Reservacion_usuario    TABLE     �  CREATE TABLE public."Reservacion_usuario" (
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
    "telefonoUsuario" character varying(20) NOT NULL,
    "paqueteID" integer,
    CONSTRAINT "Reservacion_usuario_paqueteID_check" CHECK (("paqueteID" >= 0))
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
       public          postgres    false    227            K           0    0 !   Reservacion_usuario_groups_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."Reservacion_usuario_groups_id_seq" OWNED BY public."Reservacion_usuario_groups".id;
          public          postgres    false    226            �            1259    37571    Reservacion_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_usuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Reservacion_usuario_id_seq";
       public          postgres    false    225            L           0    0    Reservacion_usuario_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Reservacion_usuario_id_seq" OWNED BY public."Reservacion_usuario".id;
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
       public          postgres    false    229            M           0    0 +   Reservacion_usuario_user_permissions_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public."Reservacion_usuario_user_permissions_id_seq" OWNED BY public."Reservacion_usuario_user_permissions".id;
          public          postgres    false    228            �            1259    37614    Reservacion_viajecontratado    TABLE       CREATE TABLE public."Reservacion_viajecontratado" (
    "idViajeContratado" integer NOT NULL,
    "estadoViajeContratado" boolean NOT NULL,
    "reservacion_viajeContratado_id" integer,
    "usuario_viajeContratado_id" integer,
    "vueloTurista_vueloContratado_id" integer
);
 1   DROP TABLE public."Reservacion_viajecontratado";
       public         heap    postgres    false            �            1259    37612 1   Reservacion_viajecontratado_idViajeContratado_seq    SEQUENCE     �   CREATE SEQUENCE public."Reservacion_viajecontratado_idViajeContratado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public."Reservacion_viajecontratado_idViajeContratado_seq";
       public          postgres    false    233            N           0    0 1   Reservacion_viajecontratado_idViajeContratado_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_viajecontratado_idViajeContratado_seq" OWNED BY public."Reservacion_viajecontratado"."idViajeContratado";
          public          postgres    false    232            �            1259    37562    Reservacion_vuelo    TABLE     �   CREATE TABLE public."Reservacion_vuelo" (
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
       public          postgres    false    223            O           0    0    Reservacion_vuelo_idVuelo_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Reservacion_vuelo_idVuelo_seq" OWNED BY public."Reservacion_vuelo"."idVuelo";
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
       public          postgres    false    231            P           0    0 +   Reservacion_vueloturista_idVueloTurista_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Reservacion_vueloturista_idVueloTurista_seq" OWNED BY public."Reservacion_vueloturista"."idVueloTurista";
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
       public          postgres    false    209            Q           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
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
       public          postgres    false    211            R           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
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
       public          postgres    false    207            S           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
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
       public          postgres    false    243            T           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    242            �            1259    37457    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
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
       public          postgres    false    205            U           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
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
       public          postgres    false    203            V           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    37773    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       2604    37522    Reservacion_album id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_album" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_album_id_seq"'::regclass);
 E   ALTER TABLE public."Reservacion_album" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213                        2604    37655    Reservacion_albumimage id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_albumimage" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_albumimage_id_seq"'::regclass);
 J   ALTER TABLE public."Reservacion_albumimage" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241                       2604    37530 !   Reservacion_condicion idCondicion    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_condicion" ALTER COLUMN "idCondicion" SET DEFAULT nextval('public."Reservacion_condicion_idCondicion_seq"'::regclass);
 T   ALTER TABLE public."Reservacion_condicion" ALTER COLUMN "idCondicion" DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    37643 +   Reservacion_detallepaquete idDetallePaquete    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_detallepaquete" ALTER COLUMN "idDetallePaquete" SET DEFAULT nextval('public."Reservacion_detallepaquete_idDetallePaquete_seq"'::regclass);
 ^   ALTER TABLE public."Reservacion_detallepaquete" ALTER COLUMN "idDetallePaquete" DROP DEFAULT;
       public          postgres    false    238    239    239                       2604    37541    Reservacion_hotel idHotel    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_hotel" ALTER COLUMN "idHotel" SET DEFAULT nextval('public."Reservacion_hotel_idHotel_seq"'::regclass);
 L   ALTER TABLE public."Reservacion_hotel" ALTER COLUMN "idHotel" DROP DEFAULT;
       public          postgres    false    217    216    217                       2604    37625    Reservacion_paquete idPaquete    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_paquete" ALTER COLUMN "idPaquete" SET DEFAULT nextval('public."Reservacion_paquete_idPaquete_seq"'::regclass);
 P   ALTER TABLE public."Reservacion_paquete" ALTER COLUMN "idPaquete" DROP DEFAULT;
       public          postgres    false    234    235    235                       2604    37635 (   Reservacion_paquete_condicion_paquete id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_paquete_condicion_paquete_id_seq"'::regclass);
 Y   ALTER TABLE public."Reservacion_paquete_condicion_paquete" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            #           2604    44896 *   Reservacion_paquete_reservacion_paquete id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_paquete_reservacion_paquete_id_seq"'::regclass);
 [   ALTER TABLE public."Reservacion_paquete_reservacion_paquete" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246                       2604    37549 %   Reservacion_reservacion idReservacion    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_reservacion" ALTER COLUMN "idReservacion" SET DEFAULT nextval('public."Reservacion_reservacion_idReservacion_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_reservacion" ALTER COLUMN "idReservacion" DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    37557 %   Reservacion_tipousuario idTipoUsuario    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_tipousuario" ALTER COLUMN "idTipoUsuario" SET DEFAULT nextval('public."Reservacion_tipousuario_idTipoUsuario_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_tipousuario" ALTER COLUMN "idTipoUsuario" DROP DEFAULT;
       public          postgres    false    220    221    221                       2604    37576    Reservacion_usuario id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_id_seq"'::regclass);
 G   ALTER TABLE public."Reservacion_usuario" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225                       2604    37590    Reservacion_usuario_groups id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_groups_id_seq"'::regclass);
 N   ALTER TABLE public."Reservacion_usuario_groups" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227                       2604    37598 '   Reservacion_usuario_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Reservacion_usuario_user_permissions_id_seq"'::regclass);
 X   ALTER TABLE public."Reservacion_usuario_user_permissions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229                       2604    37617 -   Reservacion_viajecontratado idViajeContratado    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_viajecontratado" ALTER COLUMN "idViajeContratado" SET DEFAULT nextval('public."Reservacion_viajecontratado_idViajeContratado_seq"'::regclass);
 `   ALTER TABLE public."Reservacion_viajecontratado" ALTER COLUMN "idViajeContratado" DROP DEFAULT;
       public          postgres    false    233    232    233                       2604    37565    Reservacion_vuelo idVuelo    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_vuelo" ALTER COLUMN "idVuelo" SET DEFAULT nextval('public."Reservacion_vuelo_idVuelo_seq"'::regclass);
 L   ALTER TABLE public."Reservacion_vuelo" ALTER COLUMN "idVuelo" DROP DEFAULT;
       public          postgres    false    222    223    223                       2604    37606 '   Reservacion_vueloturista idVueloTurista    DEFAULT     �   ALTER TABLE ONLY public."Reservacion_vueloturista" ALTER COLUMN "idVueloTurista" SET DEFAULT nextval('public."Reservacion_vueloturista_idVueloTurista_seq"'::regclass);
 Z   ALTER TABLE public."Reservacion_vueloturista" ALTER COLUMN "idVueloTurista" DROP DEFAULT;
       public          postgres    false    230    231    231                       2604    37478    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209                       2604    37488    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211                       2604    37470    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            !           2604    37754    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            
           2604    37460    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            	           2604    37449    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203                      0    37519    Reservacion_album 
   TABLE DATA           X   COPY public."Reservacion_album" (id, title, "timestamp", updated, owner_id) FROM stdin;
    public          postgres    false    213   �>      5          0    37652    Reservacion_albumimage 
   TABLE DATA           G   COPY public."Reservacion_albumimage" (id, image, album_id) FROM stdin;
    public          postgres    false    241   �>                0    37527    Reservacion_condicion 
   TABLE DATA           ~   COPY public."Reservacion_condicion" ("idCondicion", "tituloCondicion", "descripcionCondicion", "estadoCondicion") FROM stdin;
    public          postgres    false    215   �>      3          0    37640    Reservacion_detallepaquete 
   TABLE DATA           �   COPY public."Reservacion_detallepaquete" ("idDetallePaquete", "tituloDetallePaquete", "nroDiaDetallePaquete", "descripcionDetallePaquete", "imagenDetallePaquete", "estadoDetallePaquete", "paquete_detallePaquete_id") FROM stdin;
    public          postgres    false    239   M?                0    37538    Reservacion_hotel 
   TABLE DATA           v   COPY public."Reservacion_hotel" ("idHotel", "nombreHotel", "ciudadHotel", "telefonoHotel", "estadoVuelo") FROM stdin;
    public          postgres    false    217   PC      /          0    37622    Reservacion_paquete 
   TABLE DATA           B  COPY public."Reservacion_paquete" ("idPaquete", "tituloPaquete", "nDiasPaquete", "nNochesPaquete", "nHorasPaquete", "tipoMonedaPaquete", "precioPaquete", "unidadPorPrecioPaquete", "edadMinimaPaquete", "visitasPaquete", "mesPaquete", "disponibilidadPaquete", "imagenPrincipal", "imagenAvatar", "estadoPaquete") FROM stdin;
    public          postgres    false    235   mC      1          0    37632 %   Reservacion_paquete_condicion_paquete 
   TABLE DATA           _   COPY public."Reservacion_paquete_condicion_paquete" (id, paquete_id, condicion_id) FROM stdin;
    public          postgres    false    237   �E      :          0    44893 '   Reservacion_paquete_reservacion_paquete 
   TABLE DATA           c   COPY public."Reservacion_paquete_reservacion_paquete" (id, paquete_id, reservacion_id) FROM stdin;
    public          postgres    false    246   �E                0    37546    Reservacion_reservacion 
   TABLE DATA           �   COPY public."Reservacion_reservacion" ("idReservacion", "fechaRegistroReservacion", "fechaEntradaReservacion", "fechaSalidaReservacion", "precioReservacion", "estadoReservacion") FROM stdin;
    public          postgres    false    219   	F      !          0    37554    Reservacion_tipousuario 
   TABLE DATA           �   COPY public."Reservacion_tipousuario" ("idTipoUsuario", "nombreTipoUsuario", "fechaCreacionTipoUsuario", "estadoTipoUsuario") FROM stdin;
    public          postgres    false    221   &F      %          0    37573    Reservacion_usuario 
   TABLE DATA           �   COPY public."Reservacion_usuario" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, "imagenUsuario", "DNIUsuario", "telefonoUsuario", "paqueteID") FROM stdin;
    public          postgres    false    225   CF      '          0    37587    Reservacion_usuario_groups 
   TABLE DATA           P   COPY public."Reservacion_usuario_groups" (id, usuario_id, group_id) FROM stdin;
    public          postgres    false    227   �J      )          0    37595 $   Reservacion_usuario_user_permissions 
   TABLE DATA           _   COPY public."Reservacion_usuario_user_permissions" (id, usuario_id, permission_id) FROM stdin;
    public          postgres    false    229   �J      -          0    37614    Reservacion_viajecontratado 
   TABLE DATA           �   COPY public."Reservacion_viajecontratado" ("idViajeContratado", "estadoViajeContratado", "reservacion_viajeContratado_id", "usuario_viajeContratado_id", "vueloTurista_vueloContratado_id") FROM stdin;
    public          postgres    false    233   �J      #          0    37562    Reservacion_vuelo 
   TABLE DATA           t   COPY public."Reservacion_vuelo" ("idVuelo", "origenVuelo", "destinoVuelo", "fechaVuelo", "estadoVuelo") FROM stdin;
    public          postgres    false    223   K      +          0    37603    Reservacion_vueloturista 
   TABLE DATA           �   COPY public."Reservacion_vueloturista" ("idVueloTurista", "descripcion_vueloTurista", "estadoVueloTurista", "vuelo_vueloTurista_id") FROM stdin;
    public          postgres    false    231   6K                0    37475 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   SK                0    37485    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   pK                0    37467    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   �K      7          0    37751    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    243   DN                0    37457    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   aN                0    37446    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   (O      8          0    37773    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    244   3Q      W           0    0    Reservacion_album_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Reservacion_album_id_seq"', 1, false);
          public          postgres    false    212            X           0    0    Reservacion_albumimage_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_albumimage_id_seq"', 1, false);
          public          postgres    false    240            Y           0    0 %   Reservacion_condicion_idCondicion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."Reservacion_condicion_idCondicion_seq"', 3, true);
          public          postgres    false    214            Z           0    0 /   Reservacion_detallepaquete_idDetallePaquete_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public."Reservacion_detallepaquete_idDetallePaquete_seq"', 16, true);
          public          postgres    false    238            [           0    0    Reservacion_hotel_idHotel_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_hotel_idHotel_seq"', 1, false);
          public          postgres    false    216            \           0    0 ,   Reservacion_paquete_condicion_paquete_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Reservacion_paquete_condicion_paquete_id_seq"', 9, true);
          public          postgres    false    236            ]           0    0 !   Reservacion_paquete_idPaquete_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Reservacion_paquete_idPaquete_seq"', 12, true);
          public          postgres    false    234            ^           0    0 .   Reservacion_paquete_reservacion_paquete_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public."Reservacion_paquete_reservacion_paquete_id_seq"', 1, false);
          public          postgres    false    245            _           0    0 )   Reservacion_reservacion_idReservacion_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."Reservacion_reservacion_idReservacion_seq"', 1, false);
          public          postgres    false    218            `           0    0 )   Reservacion_tipousuario_idTipoUsuario_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."Reservacion_tipousuario_idTipoUsuario_seq"', 1, false);
          public          postgres    false    220            a           0    0 !   Reservacion_usuario_groups_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Reservacion_usuario_groups_id_seq"', 1, false);
          public          postgres    false    226            b           0    0    Reservacion_usuario_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Reservacion_usuario_id_seq"', 12, true);
          public          postgres    false    224            c           0    0 +   Reservacion_usuario_user_permissions_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Reservacion_usuario_user_permissions_id_seq"', 1, false);
          public          postgres    false    228            d           0    0 1   Reservacion_viajecontratado_idViajeContratado_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public."Reservacion_viajecontratado_idViajeContratado_seq"', 1, false);
          public          postgres    false    232            e           0    0    Reservacion_vuelo_idVuelo_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Reservacion_vuelo_idVuelo_seq"', 1, false);
          public          postgres    false    222            f           0    0 +   Reservacion_vueloturista_idVueloTurista_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Reservacion_vueloturista_idVueloTurista_seq"', 1, false);
          public          postgres    false    230            g           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208            h           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            i           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);
          public          postgres    false    206            j           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    242            k           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);
          public          postgres    false    204            l           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);
          public          postgres    false    202            <           2606    37524 (   Reservacion_album Reservacion_album_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Reservacion_album"
    ADD CONSTRAINT "Reservacion_album_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Reservacion_album" DROP CONSTRAINT "Reservacion_album_pkey";
       public            postgres    false    213            m           2606    37657 2   Reservacion_albumimage Reservacion_albumimage_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Reservacion_albumimage"
    ADD CONSTRAINT "Reservacion_albumimage_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public."Reservacion_albumimage" DROP CONSTRAINT "Reservacion_albumimage_pkey";
       public            postgres    false    241            >           2606    37535 0   Reservacion_condicion Reservacion_condicion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."Reservacion_condicion"
    ADD CONSTRAINT "Reservacion_condicion_pkey" PRIMARY KEY ("idCondicion");
 ^   ALTER TABLE ONLY public."Reservacion_condicion" DROP CONSTRAINT "Reservacion_condicion_pkey";
       public            postgres    false    215            j           2606    37649 :   Reservacion_detallepaquete Reservacion_detallepaquete_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_detallepaquete"
    ADD CONSTRAINT "Reservacion_detallepaquete_pkey" PRIMARY KEY ("idDetallePaquete");
 h   ALTER TABLE ONLY public."Reservacion_detallepaquete" DROP CONSTRAINT "Reservacion_detallepaquete_pkey";
       public            postgres    false    239            @           2606    37543 (   Reservacion_hotel Reservacion_hotel_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Reservacion_hotel"
    ADD CONSTRAINT "Reservacion_hotel_pkey" PRIMARY KEY ("idHotel");
 V   ALTER TABLE ONLY public."Reservacion_hotel" DROP CONSTRAINT "Reservacion_hotel_pkey";
       public            postgres    false    217            c           2606    37723 d   Reservacion_paquete_condicion_paquete Reservacion_paquete_cond_paquete_id_condicion_id_42653190_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_cond_paquete_id_condicion_id_42653190_uniq" UNIQUE (paquete_id, condicion_id);
 �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete_cond_paquete_id_condicion_id_42653190_uniq";
       public            postgres    false    237    237            g           2606    37637 P   Reservacion_paquete_condicion_paquete Reservacion_paquete_condicion_paquete_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_condicion_paquete_pkey" PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete_condicion_paquete_pkey";
       public            postgres    false    237            a           2606    37629 ,   Reservacion_paquete Reservacion_paquete_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."Reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_pkey" PRIMARY KEY ("idPaquete");
 Z   ALTER TABLE ONLY public."Reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete_pkey";
       public            postgres    false    235            w           2606    44905 g   Reservacion_paquete_reservacion_paquete Reservacion_paquete_rese_paquete_id_reservacion_i_0ca3347b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_rese_paquete_id_reservacion_i_0ca3347b_uniq" UNIQUE (paquete_id, reservacion_id);
 �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete_rese_paquete_id_reservacion_i_0ca3347b_uniq";
       public            postgres    false    246    246            z           2606    44898 T   Reservacion_paquete_reservacion_paquete Reservacion_paquete_reservacion_paquete_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete_reservacion_paquete_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete_reservacion_paquete_pkey";
       public            postgres    false    246            B           2606    37551 4   Reservacion_reservacion Reservacion_reservacion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_reservacion"
    ADD CONSTRAINT "Reservacion_reservacion_pkey" PRIMARY KEY ("idReservacion");
 b   ALTER TABLE ONLY public."Reservacion_reservacion" DROP CONSTRAINT "Reservacion_reservacion_pkey";
       public            postgres    false    219            D           2606    37559 4   Reservacion_tipousuario Reservacion_tipousuario_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_tipousuario"
    ADD CONSTRAINT "Reservacion_tipousuario_pkey" PRIMARY KEY ("idTipoUsuario");
 b   ALTER TABLE ONLY public."Reservacion_tipousuario" DROP CONSTRAINT "Reservacion_tipousuario_pkey";
       public            postgres    false    221            N           2606    37592 :   Reservacion_usuario_groups Reservacion_usuario_groups_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_pkey";
       public            postgres    false    227            Q           2606    37671 W   Reservacion_usuario_groups Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq" UNIQUE (usuario_id, group_id);
 �   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_usuario_id_group_id_20eabc1b_uniq";
       public            postgres    false    227    227            H           2606    37582 ,   Reservacion_usuario Reservacion_usuario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Reservacion_usuario"
    ADD CONSTRAINT "Reservacion_usuario_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Reservacion_usuario" DROP CONSTRAINT "Reservacion_usuario_pkey";
       public            postgres    false    225            T           2606    37600 N   Reservacion_usuario_user_permissions Reservacion_usuario_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario_user_permissions_pkey" PRIMARY KEY (id);
 |   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario_user_permissions_pkey";
       public            postgres    false    229            W           2606    37685 d   Reservacion_usuario_user_permissions Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq" UNIQUE (usuario_id, permission_id);
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario_user_usuario_id_permission_id_a95a4f44_uniq";
       public            postgres    false    229    229            K           2606    37584 4   Reservacion_usuario Reservacion_usuario_username_key 
   CONSTRAINT     w   ALTER TABLE ONLY public."Reservacion_usuario"
    ADD CONSTRAINT "Reservacion_usuario_username_key" UNIQUE (username);
 b   ALTER TABLE ONLY public."Reservacion_usuario" DROP CONSTRAINT "Reservacion_usuario_username_key";
       public            postgres    false    225            ^           2606    37619 <   Reservacion_viajecontratado Reservacion_viajecontratado_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_viajecontratado"
    ADD CONSTRAINT "Reservacion_viajecontratado_pkey" PRIMARY KEY ("idViajeContratado");
 j   ALTER TABLE ONLY public."Reservacion_viajecontratado" DROP CONSTRAINT "Reservacion_viajecontratado_pkey";
       public            postgres    false    233            F           2606    37570 (   Reservacion_vuelo Reservacion_vuelo_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Reservacion_vuelo"
    ADD CONSTRAINT "Reservacion_vuelo_pkey" PRIMARY KEY ("idVuelo");
 V   ALTER TABLE ONLY public."Reservacion_vuelo" DROP CONSTRAINT "Reservacion_vuelo_pkey";
       public            postgres    false    223            Y           2606    37611 6   Reservacion_vueloturista Reservacion_vueloturista_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_vueloturista"
    ADD CONSTRAINT "Reservacion_vueloturista_pkey" PRIMARY KEY ("idVueloTurista");
 d   ALTER TABLE ONLY public."Reservacion_vueloturista" DROP CONSTRAINT "Reservacion_vueloturista_pkey";
       public            postgres    false    231            1           2606    37515    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            6           2606    37501 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            9           2606    37490 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            3           2606    37480    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            ,           2606    37492 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            .           2606    37472 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            p           2606    37760 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    243            '           2606    37464 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            )           2606    37462 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            %           2606    37454 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            t           2606    37780 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    244            :           1259    37748 #   Reservacion_album_owner_id_1fd92707    INDEX     i   CREATE INDEX "Reservacion_album_owner_id_1fd92707" ON public."Reservacion_album" USING btree (owner_id);
 9   DROP INDEX public."Reservacion_album_owner_id_1fd92707";
       public            postgres    false    213            k           1259    37747 (   Reservacion_albumimage_album_id_9c94a753    INDEX     s   CREATE INDEX "Reservacion_albumimage_album_id_9c94a753" ON public."Reservacion_albumimage" USING btree (album_id);
 >   DROP INDEX public."Reservacion_albumimage_album_id_9c94a753";
       public            postgres    false    241            h           1259    37741 =   Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6    INDEX     �   CREATE INDEX "Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6" ON public."Reservacion_detallepaquete" USING btree ("paquete_detallePaquete_id");
 S   DROP INDEX public."Reservacion_detallepaquete_paquete_detallePaquete_id_6a861ad6";
       public            postgres    false    239            d           1259    37735 ;   Reservacion_paquete_condicion_paquete_condicion_id_be083b33    INDEX     �   CREATE INDEX "Reservacion_paquete_condicion_paquete_condicion_id_be083b33" ON public."Reservacion_paquete_condicion_paquete" USING btree (condicion_id);
 Q   DROP INDEX public."Reservacion_paquete_condicion_paquete_condicion_id_be083b33";
       public            postgres    false    237            e           1259    37734 9   Reservacion_paquete_condicion_paquete_paquete_id_145e8890    INDEX     �   CREATE INDEX "Reservacion_paquete_condicion_paquete_paquete_id_145e8890" ON public."Reservacion_paquete_condicion_paquete" USING btree (paquete_id);
 O   DROP INDEX public."Reservacion_paquete_condicion_paquete_paquete_id_145e8890";
       public            postgres    false    237            x           1259    44916 ;   Reservacion_paquete_reservacion_paquete_paquete_id_17b8ca7c    INDEX     �   CREATE INDEX "Reservacion_paquete_reservacion_paquete_paquete_id_17b8ca7c" ON public."Reservacion_paquete_reservacion_paquete" USING btree (paquete_id);
 Q   DROP INDEX public."Reservacion_paquete_reservacion_paquete_paquete_id_17b8ca7c";
       public            postgres    false    246            {           1259    44917 ?   Reservacion_paquete_reservacion_paquete_reservacion_id_3e395480    INDEX     �   CREATE INDEX "Reservacion_paquete_reservacion_paquete_reservacion_id_3e395480" ON public."Reservacion_paquete_reservacion_paquete" USING btree (reservacion_id);
 U   DROP INDEX public."Reservacion_paquete_reservacion_paquete_reservacion_id_3e395480";
       public            postgres    false    246            L           1259    37683 ,   Reservacion_usuario_groups_group_id_b2a38555    INDEX     {   CREATE INDEX "Reservacion_usuario_groups_group_id_b2a38555" ON public."Reservacion_usuario_groups" USING btree (group_id);
 B   DROP INDEX public."Reservacion_usuario_groups_group_id_b2a38555";
       public            postgres    false    227            O           1259    37682 .   Reservacion_usuario_groups_usuario_id_7f9c3e4c    INDEX        CREATE INDEX "Reservacion_usuario_groups_usuario_id_7f9c3e4c" ON public."Reservacion_usuario_groups" USING btree (usuario_id);
 D   DROP INDEX public."Reservacion_usuario_groups_usuario_id_7f9c3e4c";
       public            postgres    false    227            R           1259    37697 ;   Reservacion_usuario_user_permissions_permission_id_c4af727c    INDEX     �   CREATE INDEX "Reservacion_usuario_user_permissions_permission_id_c4af727c" ON public."Reservacion_usuario_user_permissions" USING btree (permission_id);
 Q   DROP INDEX public."Reservacion_usuario_user_permissions_permission_id_c4af727c";
       public            postgres    false    229            U           1259    37696 8   Reservacion_usuario_user_permissions_usuario_id_b44609ab    INDEX     �   CREATE INDEX "Reservacion_usuario_user_permissions_usuario_id_b44609ab" ON public."Reservacion_usuario_user_permissions" USING btree (usuario_id);
 N   DROP INDEX public."Reservacion_usuario_user_permissions_usuario_id_b44609ab";
       public            postgres    false    229            I           1259    37669 *   Reservacion_usuario_username_ca69cc99_like    INDEX     �   CREATE INDEX "Reservacion_usuario_username_ca69cc99_like" ON public."Reservacion_usuario" USING btree (username varchar_pattern_ops);
 @   DROP INDEX public."Reservacion_usuario_username_ca69cc99_like";
       public            postgres    false    225            [           1259    37719 >   Reservacion_viajecontratad_reservacion_viajeContratad_aa381e10    INDEX     �   CREATE INDEX "Reservacion_viajecontratad_reservacion_viajeContratad_aa381e10" ON public."Reservacion_viajecontratado" USING btree ("reservacion_viajeContratado_id");
 T   DROP INDEX public."Reservacion_viajecontratad_reservacion_viajeContratad_aa381e10";
       public            postgres    false    233            \           1259    37721 >   Reservacion_viajecontratad_vueloTurista_vueloContrata_c4bf3d60    INDEX     �   CREATE INDEX "Reservacion_viajecontratad_vueloTurista_vueloContrata_c4bf3d60" ON public."Reservacion_viajecontratado" USING btree ("vueloTurista_vueloContratado_id");
 T   DROP INDEX public."Reservacion_viajecontratad_vueloTurista_vueloContrata_c4bf3d60";
       public            postgres    false    233            _           1259    37720 ?   Reservacion_viajecontratado_usuario_viajeContratado_id_4ef551b6    INDEX     �   CREATE INDEX "Reservacion_viajecontratado_usuario_viajeContratado_id_4ef551b6" ON public."Reservacion_viajecontratado" USING btree ("usuario_viajeContratado_id");
 U   DROP INDEX public."Reservacion_viajecontratado_usuario_viajeContratado_id_4ef551b6";
       public            postgres    false    233            Z           1259    37703 7   Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6    INDEX     �   CREATE INDEX "Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6" ON public."Reservacion_vueloturista" USING btree ("vuelo_vueloTurista_id");
 M   DROP INDEX public."Reservacion_vueloturista_vuelo_vueloTurista_id_521e6ad6";
       public            postgres    false    231            /           1259    37516    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            4           1259    37512 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            7           1259    37513 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            *           1259    37498 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            n           1259    37771 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    243            q           1259    37772 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    243            r           1259    37782 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    244            u           1259    37781 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    244                       2606    37658 O   Reservacion_album Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_album"
    ADD CONSTRAINT "Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id" FOREIGN KEY (owner_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public."Reservacion_album" DROP CONSTRAINT "Reservacion_album_owner_id_1fd92707_fk_Reservacion_usuario_id";
       public          postgres    false    213    225    2888            �           2606    37742 J   Reservacion_albumimage Reservacion_albumima_album_id_9c94a753_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_albumimage"
    ADD CONSTRAINT "Reservacion_albumima_album_id_9c94a753_fk_Reservaci" FOREIGN KEY (album_id) REFERENCES public."Reservacion_album"(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public."Reservacion_albumimage" DROP CONSTRAINT "Reservacion_albumima_album_id_9c94a753_fk_Reservaci";
       public          postgres    false    213    2876    241            �           2606    44899 Z   Reservacion_detallepaquete Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_detallepaquete"
    ADD CONSTRAINT "Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci" FOREIGN KEY ("paquete_detallePaquete_id") REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_detallepaquete" DROP CONSTRAINT "Reservacion_detallep_paquete_detallePaque_6a861ad6_fk_Reservaci";
       public          postgres    false    2913    235    239            �           2606    44918 ]   Reservacion_paquete_condicion_paquete Reservacion_paquete__condicion_id_be083b33_fk_Reservaci    FK CONSTRAINT        ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete__condicion_id_be083b33_fk_Reservaci" FOREIGN KEY (condicion_id) REFERENCES public."Reservacion_condicion"("idCondicion") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete__condicion_id_be083b33_fk_Reservaci";
       public          postgres    false    237    2878    215            �           2606    44923 [   Reservacion_paquete_condicion_paquete Reservacion_paquete__paquete_id_145e8890_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete"
    ADD CONSTRAINT "Reservacion_paquete__paquete_id_145e8890_fk_Reservaci" FOREIGN KEY (paquete_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_paquete_condicion_paquete" DROP CONSTRAINT "Reservacion_paquete__paquete_id_145e8890_fk_Reservaci";
       public          postgres    false    2913    235    237            �           2606    44906 ]   Reservacion_paquete_reservacion_paquete Reservacion_paquete__paquete_id_17b8ca7c_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete__paquete_id_17b8ca7c_fk_Reservaci" FOREIGN KEY (paquete_id) REFERENCES public."Reservacion_paquete"("idPaquete") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete__paquete_id_17b8ca7c_fk_Reservaci";
       public          postgres    false    235    246    2913            �           2606    44911 a   Reservacion_paquete_reservacion_paquete Reservacion_paquete__reservacion_id_3e395480_fk_Reservaci    FK CONSTRAINT     
  ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete"
    ADD CONSTRAINT "Reservacion_paquete__reservacion_id_3e395480_fk_Reservaci" FOREIGN KEY (reservacion_id) REFERENCES public."Reservacion_reservacion"("idReservacion") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_paquete_reservacion_paquete" DROP CONSTRAINT "Reservacion_paquete__reservacion_id_3e395480_fk_Reservaci";
       public          postgres    false    219    2882    246            �           2606    37691 ]   Reservacion_usuario_user_permissions Reservacion_usuario__permission_id_c4af727c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario__permission_id_c4af727c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario__permission_id_c4af727c_fk_auth_perm";
       public          postgres    false    229    207    2862            �           2606    37672 P   Reservacion_usuario_groups Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci" FOREIGN KEY (usuario_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario__usuario_id_7f9c3e4c_fk_Reservaci";
       public          postgres    false    227    2888    225            �           2606    37686 Z   Reservacion_usuario_user_permissions Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions"
    ADD CONSTRAINT "Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci" FOREIGN KEY (usuario_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_user_permissions" DROP CONSTRAINT "Reservacion_usuario__usuario_id_b44609ab_fk_Reservaci";
       public          postgres    false    2888    225    229            �           2606    37677 X   Reservacion_usuario_groups Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_usuario_groups"
    ADD CONSTRAINT "Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_usuario_groups" DROP CONSTRAINT "Reservacion_usuario_groups_group_id_b2a38555_fk_auth_group_id";
       public          postgres    false    2867    227    209            �           2606    37704 [   Reservacion_viajecontratado Reservacion_viajecon_reservacion_viajeCon_aa381e10_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_viajecontratado"
    ADD CONSTRAINT "Reservacion_viajecon_reservacion_viajeCon_aa381e10_fk_Reservaci" FOREIGN KEY ("reservacion_viajeContratado_id") REFERENCES public."Reservacion_reservacion"("idReservacion") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_viajecontratado" DROP CONSTRAINT "Reservacion_viajecon_reservacion_viajeCon_aa381e10_fk_Reservaci";
       public          postgres    false    219    233    2882            �           2606    37709 [   Reservacion_viajecontratado Reservacion_viajecon_usuario_viajeContrat_4ef551b6_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_viajecontratado"
    ADD CONSTRAINT "Reservacion_viajecon_usuario_viajeContrat_4ef551b6_fk_Reservaci" FOREIGN KEY ("usuario_viajeContratado_id") REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_viajecontratado" DROP CONSTRAINT "Reservacion_viajecon_usuario_viajeContrat_4ef551b6_fk_Reservaci";
       public          postgres    false    233    225    2888            �           2606    37714 [   Reservacion_viajecontratado Reservacion_viajecon_vueloTurista_vueloCo_c4bf3d60_fk_Reservaci    FK CONSTRAINT       ALTER TABLE ONLY public."Reservacion_viajecontratado"
    ADD CONSTRAINT "Reservacion_viajecon_vueloTurista_vueloCo_c4bf3d60_fk_Reservaci" FOREIGN KEY ("vueloTurista_vueloContratado_id") REFERENCES public."Reservacion_vueloturista"("idVueloTurista") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_viajecontratado" DROP CONSTRAINT "Reservacion_viajecon_vueloTurista_vueloCo_c4bf3d60_fk_Reservaci";
       public          postgres    false    231    2905    233            �           2606    37698 X   Reservacion_vueloturista Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservacion_vueloturista"
    ADD CONSTRAINT "Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci" FOREIGN KEY ("vuelo_vueloTurista_id") REFERENCES public."Reservacion_vuelo"("idVuelo") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Reservacion_vueloturista" DROP CONSTRAINT "Reservacion_vuelotur_vuelo_vueloTurista_i_521e6ad6_fk_Reservaci";
       public          postgres    false    2886    231    223            ~           2606    37507 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    2862    211    207            }           2606    37502 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    209    2867            |           2606    37493 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    207    2857            �           2606    37761 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    2857    243    205            �           2606    37766 L   django_admin_log django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id" FOREIGN KEY (user_id) REFERENCES public."Reservacion_usuario"(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Reservacion_usuario_id";
       public          postgres    false    243    225    2888                  x������ � �      5      x������ � �         I   x�3�tI-H,*)-J崴20PH��S�L�JUHT�ITpN�-�������������Y�eD��4.Cҵ��qqq v�1)      3   �  x��U=s�F��_�e��`Q���T��%cy)�J�8B�9��{8M�����_�R�
�;Wy{ )zR� A�޾��8+�b[#���,G��V6Pm�X^brL��}f,�y��MY}1���% ���I�� Go��� ���F�30�,�q��:��	G�{�X��ޱ�6D�w�٧[���Ur��	�v��wb|m�	���.���N�*�2H�;X�\��=vo�.H������#T[|G<7F�F�����6��/e�_Hm��e<h���۠h���͎h_E+_�؊E�&k4%)y���%��I�SU��~���V׹�?a!��aJ�ySb�aO�@C����Ib�ջ��xt/<�[��i�Zz٣��# �ɱ���t4o���1�8Ƣ���u��@y��]'�p����*�r��-�����w?�~��K<���>(��s:cm������6�k���3�z�Z���>�������G�S��_�S4Y�K�oc|i�UYܜp ��+��c�(B`_%�'�����U�E�n)��u!N�4��f����r��O��aJ���h�C��A�9��3��  �\#�t�h!iJ��@(Hm=�;+��փ�&Vٹ<)&�US6���q�S�2�RA�rЊ��{x�j#�cPv,hę���윛���uJ��q&�]�Fr|o��yh��m�j������]�x��%�G}W�&��~�x�6��m ƚ�G3���jClV������ɀa>�!ۄ�(����8��M�~,�ݿޣy�ϋ|tdյ����s��Bmc����$��<���D������<��(�I��e�x� 2���y�i5�"��[�X/����A��ݷd��Zidi*ESK��љ2��ۅ}�J�e�;�7֙�2^:��_W�F�V�Uh�UZcq;�(C�x��у��R����y���ƨݿ�/����1eZp8����\�D|27a�<�B�j�owb�%���Q�STKC�mb}P|y\����_���;            x������ � �      /   >  x���[��@���U��F{Z�!�� �`U�RD��D�����n�0K�rh�L���������q�O��h��H�������*N�i���߉BH���nu�%?�� ���u¸�9�(�C'����{���('�4	���Bt"�Fxb�)��tf#�U3kT^t�>r�%:'�O�$�ؤ�$jlǍ&��}�/>g�����h�P�f�lf�����R\�ZDj���d�m�$d)��.ւЯ�8=��z5�Zf;�ѐ���I2��q)L� |�Bm(�AM�T��b���)�9���xe�&y{ބ���(�C��d�|�7��Ɠd���,I%���&�K��@&��,@��F�ѕ�?;Jd�ـģ��G��n@�H�,���ɶ�s+ɭ�&��_G�QwM�&.5Ȍ���M|ʜ��rt�s�+����_�@��n�,\s�>4eu�Qe�<o:g|�I����<O���H��鞨�����}7�n:cUleg��vޟV�i�lÛ�ֈh�ܣGǎb��3C#s���.�Q�z�V�ʏ�Y ��D,����_����/�T�      1   !   x�3�4�4�2�4���@Ғ�H��qqq 6:�      :      x������ � �            x������ � �      !      x������ � �      %   o  x���[��J���E?��i��$ǻ"^[�INJ�*(�?�3�8��a�Yko
�d��8�����b�<��C��|T��5�J�9jbkRo�IG�6�8D����hU�XAh�`��;Bb�Q�AUTL��)��D� ��q�ڤ|����Cъ���{�a&b��
��(��������<I�Q1Zz�������pݩ��O���	s�!6�~7�>�+ު?��p�>�S�@u�Imа_�ZO�g�/7��^!�(Ԉ,R�RI���#�r��U���<��d���De�]�}cΐR���:�� �e��(��+�Q���]�Ք��y�|�V�)�/WN����5��g��w�
�?���&AQ%La� �����5[�϶����[�:�h�Yt�f�WQY���j}>D+�����<%Ǔ=� @�3�<���v�R?��5��*#*V����O��G{'hN��@�Ra\��f���.��`t^)^�>�[}��^�뛎?�f�ʄ��%0�an�`oR���gP|�xN i���@���.g��dx,�$s��9���4OI�[��}/=�k��/'ӑ��&Փg��AÏ���Ye�h������v�۠�E<e�/��j�L&Q�n�&	v�`�WV��ŋ�C�x��iF��ĳ�����F�zkV7Ӡ=K�ڱ��(���r�����,�����#Ț$�LUTz�� �f��1���~�z��r�ܸQe���
d�_�Cw�O��&�,�ͮX�EG��C�s+^� �%�(A"bX���f��f�r�4B�if���Bǉ��6P��yH�BJȲ�7���n�[4V=7�؇q�y�`	��s���_�9��AYd��1�堏9�r7�Ou��)��3�Q#�兓�V'��r��8�im�T�-N��_��!�_��I���OP��%�b߉�<DQ�|�;��j�lJ-!��gӉ~ZU��6&s�Y��-�:݆�Y���V�����o��r�²"S_l��:�x��V99�f?�-�o��������$^���6'x���<�3�ʈw:B��k�X���g�I��g���E��.�\�ָ�o�c��:U�H�1�\ѩ@�#{W�%��A�%��1�"�T��mz���~�///��4�      '      x������ � �      )      x������ � �      -      x������ � �      #      x������ � �      +      x������ � �            x������ � �            x������ � �         �  x�m�[��0E��UxEd�y|����;�G��}�I��"�08�}-;����w]5L�*���e����qK[r{��=(*�l ��V��G �}���W��6�=���/K?��5.ؓ�S �	�,�������"�Qp�ly���a������"N:�:�ԬB X�v�nӸ��U��#�#�`�U��(u
��J��GEşX���W��l��4��qe�E�2���JG�P����j�UF\6�ß�Ü�~�Ze��������� p�m~�ߦ��oQ�����3��T��z�wp��ԡ������!2���=%���>�a0P�߶QI�}tDD%��BD$� ��mN��0?�K�\�CTl���YtR�ʁ��O�"W�r
��1U۲���L|q��_5,�F塤�Z5�d��-�"#%�
�<�0D(��G��%2*/�A1dD`2.�ω��T�K�C�T!!-2�rAjdHD����UϣZ��_Vo\�s��m��#y9���MK�ȩ喺�l�!f���������8�t�@�˶U9��K)U����F����tYe���^.6����
����8�)���r'%A�ob8A]X�0�OB�у�ܠB�Ӄ�e���N��m"z;Mp)e������H�� ��=�\�<TW	-py�".�Z�|�&��k����      7      x������ � �         �   x�e�I�0E��a�p�lLk�L$RoO
b��}��ɱ���8R�<��`��I�=��1��E�k���c�V�)Q��3���`k�T(߱o�Aw�v�����D!��7�]*%�b-3G�V�{%��J�Ow�ߕ����h�x��ތ�C[�Nx�$V�<��s����a�#�i ��         �  x���͎�0�sy�y*ۉ����畢�L��v�����$@aJGp��_c�o�v�q��q<w~�  mu�����q⃨d,%砤�o詒l�������G��U� 4FIdn?_��b��+Ⱥz���|�T�P���A۸o[��!��L�\��ϔ�R��qU�J��&*jV��8m7��ԓ�	~$j7��nUhl��d�:"Ō�p_S�Ϸ���Ƒ��G���	}=����ލm?X��[��mo?���BWi03W�N�Ո%�$�%�4��(��)pH7
�J�v��b��L�\D;uaD�v}�}~H��|��L�"���8�]x���\hP:�Cr�M���1WRs9���PLU�E��mh��7���/��#��h��7�_�v��V��|0� � ��"�uR/�\!e�Z4˱����,,���,��� Ȓ0V�I�o!lr(/�$\"r����P)�IT���&�-��%"� �S���(�)J��f�^
��      8   �  x�u�͎�0���S�$�M!�,:	PP01[���68?m��~HYT����#�s>wB^��a kX1��k�,S[���o3���XG���eȗd�E��!��f*���!S������su��M�]J�0�����D��x���ƴ����6�C����jĪBԺ�{��&8�O���ϩ�rz�2J~r��P�D�86%��ν��\Bu�S&�Jr_&9L�锓h��!�C�L��]�Jh�5u��;C ���~p��K��k{� x�^����R���4�j+�9��v�9��~�T&��&>��h	��[̃B$y�	�ESfM�����/;���ԓWQ��s��gu��{V��O]=bR����H0���t*���:߅5*�	Q���sŴ��j�x��xfz�I��H@$3�`��d�&��o�	A�摳�{C��;o�'���������L;sL__��x�x��퀵��,���%��)     
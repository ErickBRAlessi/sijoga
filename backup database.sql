PGDMP          1                x            sijoga    12.2    12.2 D    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            f           1262    35244    sijoga    DATABASE     �   CREATE DATABASE sijoga WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE sijoga;
                postgres    false            �            1259    36936    tb_advogado    TABLE     i   CREATE TABLE public.tb_advogado (
    pk_oab integer NOT NULL,
    cpf character varying(11) NOT NULL
);
    DROP TABLE public.tb_advogado;
       public         heap    postgres    false            �            1259    36961    tb_advogado_parte    TABLE     �   CREATE TABLE public.tb_advogado_parte (
    pk_id integer NOT NULL,
    oab_adv integer NOT NULL,
    id_parte integer NOT NULL
);
 %   DROP TABLE public.tb_advogado_parte;
       public         heap    postgres    false            �            1259    36959    tb_advogado_parte_pk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_advogado_parte_pk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_advogado_parte_pk_id_seq;
       public          postgres    false    210            g           0    0    tb_advogado_parte_pk_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_advogado_parte_pk_id_seq OWNED BY public.tb_advogado_parte.pk_id;
          public          postgres    false    209            �            1259    36916    tb_endereco    TABLE     �   CREATE TABLE public.tb_endereco (
    pk_cpf character varying(11) NOT NULL,
    cep integer NOT NULL,
    complemento character varying(32) NOT NULL
);
    DROP TABLE public.tb_endereco;
       public         heap    postgres    false            �            1259    37007    tb_fase    TABLE     �  CREATE TABLE public.tb_fase (
    pk_id integer NOT NULL,
    id_processo integer NOT NULL,
    parte_abertura integer,
    titulo character varying(50) NOT NULL,
    reclamacao_parte character varying(10000),
    justificativa_juiz character varying(10000),
    status character varying(50),
    documento bytea,
    data_abertura timestamp without time zone,
    data_decisao date
);
    DROP TABLE public.tb_fase;
       public         heap    postgres    false            �            1259    37005    tb_fase_pk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_fase_pk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tb_fase_pk_id_seq;
       public          postgres    false    214            h           0    0    tb_fase_pk_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tb_fase_pk_id_seq OWNED BY public.tb_fase.pk_id;
          public          postgres    false    213            �            1259    37028    tb_intimacao    TABLE     �   CREATE TABLE public.tb_intimacao (
    pk_id integer NOT NULL,
    fase integer NOT NULL,
    oficial_de_justica integer,
    data_abertura timestamp without time zone
);
     DROP TABLE public.tb_intimacao;
       public         heap    postgres    false            �            1259    37026    tb_intimacao_pk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_intimacao_pk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tb_intimacao_pk_id_seq;
       public          postgres    false    216            i           0    0    tb_intimacao_pk_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tb_intimacao_pk_id_seq OWNED BY public.tb_intimacao.pk_id;
          public          postgres    false    215            �            1259    36926    tb_juiz    TABLE     e   CREATE TABLE public.tb_juiz (
    pk_oab integer NOT NULL,
    cpf character varying(11) NOT NULL
);
    DROP TABLE public.tb_juiz;
       public         heap    postgres    false            �            1259    36948    tb_parte    TABLE     �   CREATE TABLE public.tb_parte (
    pk_id integer NOT NULL,
    cpf character varying(11) NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.tb_parte;
       public         heap    postgres    false            �            1259    36946    tb_parte_pk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_parte_pk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tb_parte_pk_id_seq;
       public          postgres    false    208            j           0    0    tb_parte_pk_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tb_parte_pk_id_seq OWNED BY public.tb_parte.pk_id;
          public          postgres    false    207            �            1259    36900 	   tb_pessoa    TABLE     �   CREATE TABLE public.tb_pessoa (
    pk_cpf character varying(11) NOT NULL,
    nome character varying(50),
    sobrenome character varying(200),
    nascimento date
);
    DROP TABLE public.tb_pessoa;
       public         heap    postgres    false            �            1259    36979    tb_processo    TABLE       CREATE TABLE public.tb_processo (
    pk_id integer NOT NULL,
    oab_juiz integer NOT NULL,
    promovido integer NOT NULL,
    promovente integer NOT NULL,
    vencedor integer,
    data_abertura timestamp without time zone,
    status character varying(50)
);
    DROP TABLE public.tb_processo;
       public         heap    postgres    false            �            1259    36977    tb_processo_pk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_processo_pk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_processo_pk_id_seq;
       public          postgres    false    212            k           0    0    tb_processo_pk_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_processo_pk_id_seq OWNED BY public.tb_processo.pk_id;
          public          postgres    false    211            �            1259    36905 
   tb_usuario    TABLE     �   CREATE TABLE public.tb_usuario (
    pk_cpf character varying(11) NOT NULL,
    email character varying(50) NOT NULL,
    senha character varying(32) NOT NULL,
    admin boolean DEFAULT false
);
    DROP TABLE public.tb_usuario;
       public         heap    postgres    false            �
           2604    37620    tb_advogado_parte pk_id    DEFAULT     �   ALTER TABLE ONLY public.tb_advogado_parte ALTER COLUMN pk_id SET DEFAULT nextval('public.tb_advogado_parte_pk_id_seq'::regclass);
 F   ALTER TABLE public.tb_advogado_parte ALTER COLUMN pk_id DROP DEFAULT;
       public          postgres    false    210    209    210            �
           2604    37621    tb_fase pk_id    DEFAULT     n   ALTER TABLE ONLY public.tb_fase ALTER COLUMN pk_id SET DEFAULT nextval('public.tb_fase_pk_id_seq'::regclass);
 <   ALTER TABLE public.tb_fase ALTER COLUMN pk_id DROP DEFAULT;
       public          postgres    false    213    214    214            �
           2604    37622    tb_intimacao pk_id    DEFAULT     x   ALTER TABLE ONLY public.tb_intimacao ALTER COLUMN pk_id SET DEFAULT nextval('public.tb_intimacao_pk_id_seq'::regclass);
 A   ALTER TABLE public.tb_intimacao ALTER COLUMN pk_id DROP DEFAULT;
       public          postgres    false    216    215    216            �
           2604    37623    tb_parte pk_id    DEFAULT     p   ALTER TABLE ONLY public.tb_parte ALTER COLUMN pk_id SET DEFAULT nextval('public.tb_parte_pk_id_seq'::regclass);
 =   ALTER TABLE public.tb_parte ALTER COLUMN pk_id DROP DEFAULT;
       public          postgres    false    207    208    208            �
           2604    37624    tb_processo pk_id    DEFAULT     v   ALTER TABLE ONLY public.tb_processo ALTER COLUMN pk_id SET DEFAULT nextval('public.tb_processo_pk_id_seq'::regclass);
 @   ALTER TABLE public.tb_processo ALTER COLUMN pk_id DROP DEFAULT;
       public          postgres    false    212    211    212            V          0    36936    tb_advogado 
   TABLE DATA           2   COPY public.tb_advogado (pk_oab, cpf) FROM stdin;
    public          postgres    false    206   �Q       Z          0    36961    tb_advogado_parte 
   TABLE DATA           E   COPY public.tb_advogado_parte (pk_id, oab_adv, id_parte) FROM stdin;
    public          postgres    false    210   �Q       T          0    36916    tb_endereco 
   TABLE DATA           ?   COPY public.tb_endereco (pk_cpf, cep, complemento) FROM stdin;
    public          postgres    false    204   �Q       ^          0    37007    tb_fase 
   TABLE DATA           �   COPY public.tb_fase (pk_id, id_processo, parte_abertura, titulo, reclamacao_parte, justificativa_juiz, status, documento, data_abertura, data_decisao) FROM stdin;
    public          postgres    false    214   R       `          0    37028    tb_intimacao 
   TABLE DATA           V   COPY public.tb_intimacao (pk_id, fase, oficial_de_justica, data_abertura) FROM stdin;
    public          postgres    false    216   /S       U          0    36926    tb_juiz 
   TABLE DATA           .   COPY public.tb_juiz (pk_oab, cpf) FROM stdin;
    public          postgres    false    205   cS       X          0    36948    tb_parte 
   TABLE DATA           4   COPY public.tb_parte (pk_id, cpf, tipo) FROM stdin;
    public          postgres    false    208   �S       R          0    36900 	   tb_pessoa 
   TABLE DATA           H   COPY public.tb_pessoa (pk_cpf, nome, sobrenome, nascimento) FROM stdin;
    public          postgres    false    202   �S       \          0    36979    tb_processo 
   TABLE DATA           n   COPY public.tb_processo (pk_id, oab_juiz, promovido, promovente, vencedor, data_abertura, status) FROM stdin;
    public          postgres    false    212   MT       S          0    36905 
   tb_usuario 
   TABLE DATA           A   COPY public.tb_usuario (pk_cpf, email, senha, admin) FROM stdin;
    public          postgres    false    203   �T       l           0    0    tb_advogado_parte_pk_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tb_advogado_parte_pk_id_seq', 2, true);
          public          postgres    false    209            m           0    0    tb_fase_pk_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tb_fase_pk_id_seq', 4, true);
          public          postgres    false    213            n           0    0    tb_intimacao_pk_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_intimacao_pk_id_seq', 1, true);
          public          postgres    false    215            o           0    0    tb_parte_pk_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tb_parte_pk_id_seq', 2, true);
          public          postgres    false    207            p           0    0    tb_processo_pk_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tb_processo_pk_id_seq', 1, true);
          public          postgres    false    211            �
           2606    36966 -   tb_advogado_parte tb_advogado_parte_pk_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.tb_advogado_parte
    ADD CONSTRAINT tb_advogado_parte_pk_id_key UNIQUE (pk_id);
 W   ALTER TABLE ONLY public.tb_advogado_parte DROP CONSTRAINT tb_advogado_parte_pk_id_key;
       public            postgres    false    210            �
           2606    36940    tb_advogado tb_advogado_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_advogado
    ADD CONSTRAINT tb_advogado_pkey PRIMARY KEY (pk_oab);
 F   ALTER TABLE ONLY public.tb_advogado DROP CONSTRAINT tb_advogado_pkey;
       public            postgres    false    206            �
           2606    36920    tb_endereco tb_endereco_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_endereco
    ADD CONSTRAINT tb_endereco_pkey PRIMARY KEY (pk_cpf);
 F   ALTER TABLE ONLY public.tb_endereco DROP CONSTRAINT tb_endereco_pkey;
       public            postgres    false    204            �
           2606    37015    tb_fase tb_fase_pk_id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.tb_fase
    ADD CONSTRAINT tb_fase_pk_id_key UNIQUE (pk_id);
 C   ALTER TABLE ONLY public.tb_fase DROP CONSTRAINT tb_fase_pk_id_key;
       public            postgres    false    214            �
           2606    37033 #   tb_intimacao tb_intimacao_pk_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.tb_intimacao
    ADD CONSTRAINT tb_intimacao_pk_id_key UNIQUE (pk_id);
 M   ALTER TABLE ONLY public.tb_intimacao DROP CONSTRAINT tb_intimacao_pk_id_key;
       public            postgres    false    216            �
           2606    36930    tb_juiz tb_juiz_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tb_juiz
    ADD CONSTRAINT tb_juiz_pkey PRIMARY KEY (pk_oab);
 >   ALTER TABLE ONLY public.tb_juiz DROP CONSTRAINT tb_juiz_pkey;
       public            postgres    false    205            �
           2606    36953    tb_parte tb_parte_pk_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.tb_parte
    ADD CONSTRAINT tb_parte_pk_id_key UNIQUE (pk_id);
 E   ALTER TABLE ONLY public.tb_parte DROP CONSTRAINT tb_parte_pk_id_key;
       public            postgres    false    208            �
           2606    36904    tb_pessoa tb_pessoa_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_pessoa
    ADD CONSTRAINT tb_pessoa_pkey PRIMARY KEY (pk_cpf);
 B   ALTER TABLE ONLY public.tb_pessoa DROP CONSTRAINT tb_pessoa_pkey;
       public            postgres    false    202            �
           2606    36984 !   tb_processo tb_processo_pk_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tb_processo
    ADD CONSTRAINT tb_processo_pk_id_key UNIQUE (pk_id);
 K   ALTER TABLE ONLY public.tb_processo DROP CONSTRAINT tb_processo_pk_id_key;
       public            postgres    false    212            �
           2606    36910    tb_usuario tb_usuario_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (pk_cpf);
 D   ALTER TABLE ONLY public.tb_usuario DROP CONSTRAINT tb_usuario_pkey;
       public            postgres    false    203            �
           2606    36967 $   tb_advogado_parte adv_parte_parte_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_advogado_parte
    ADD CONSTRAINT adv_parte_parte_fk FOREIGN KEY (oab_adv) REFERENCES public.tb_advogado(pk_oab);
 N   ALTER TABLE ONLY public.tb_advogado_parte DROP CONSTRAINT adv_parte_parte_fk;
       public          postgres    false    206    210    2747            �
           2606    36941    tb_advogado advoga_pessoa_fk    FK CONSTRAINT        ALTER TABLE ONLY public.tb_advogado
    ADD CONSTRAINT advoga_pessoa_fk FOREIGN KEY (cpf) REFERENCES public.tb_pessoa(pk_cpf);
 F   ALTER TABLE ONLY public.tb_advogado DROP CONSTRAINT advoga_pessoa_fk;
       public          postgres    false    2739    206    202            �
           2606    36921    tb_endereco endereco_pessoa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_endereco
    ADD CONSTRAINT endereco_pessoa_fk FOREIGN KEY (pk_cpf) REFERENCES public.tb_pessoa(pk_cpf);
 H   ALTER TABLE ONLY public.tb_endereco DROP CONSTRAINT endereco_pessoa_fk;
       public          postgres    false    2739    204    202            �
           2606    37021    tb_fase fase_abertura_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_fase
    ADD CONSTRAINT fase_abertura_fk FOREIGN KEY (parte_abertura) REFERENCES public.tb_parte(pk_id);
 B   ALTER TABLE ONLY public.tb_fase DROP CONSTRAINT fase_abertura_fk;
       public          postgres    false    2749    214    208            �
           2606    37016    tb_fase fase_processo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_fase
    ADD CONSTRAINT fase_processo_fk FOREIGN KEY (id_processo) REFERENCES public.tb_processo(pk_id);
 B   ALTER TABLE ONLY public.tb_fase DROP CONSTRAINT fase_processo_fk;
       public          postgres    false    212    214    2753            �
           2606    37034    tb_intimacao intimacao_fase_fk    FK CONSTRAINT        ALTER TABLE ONLY public.tb_intimacao
    ADD CONSTRAINT intimacao_fase_fk FOREIGN KEY (fase) REFERENCES public.tb_fase(pk_id);
 H   ALTER TABLE ONLY public.tb_intimacao DROP CONSTRAINT intimacao_fase_fk;
       public          postgres    false    2755    216    214            �
           2606    36931    tb_juiz juiz_pessoa_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.tb_juiz
    ADD CONSTRAINT juiz_pessoa_fk FOREIGN KEY (cpf) REFERENCES public.tb_pessoa(pk_cpf);
 @   ALTER TABLE ONLY public.tb_juiz DROP CONSTRAINT juiz_pessoa_fk;
       public          postgres    false    202    205    2739            �
           2606    36972 $   tb_advogado_parte parte_adv_parte_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_advogado_parte
    ADD CONSTRAINT parte_adv_parte_fk FOREIGN KEY (id_parte) REFERENCES public.tb_parte(pk_id);
 N   ALTER TABLE ONLY public.tb_advogado_parte DROP CONSTRAINT parte_adv_parte_fk;
       public          postgres    false    210    2749    208            �
           2606    36954    tb_parte parte_pessoa_fk    FK CONSTRAINT     {   ALTER TABLE ONLY public.tb_parte
    ADD CONSTRAINT parte_pessoa_fk FOREIGN KEY (cpf) REFERENCES public.tb_pessoa(pk_cpf);
 B   ALTER TABLE ONLY public.tb_parte DROP CONSTRAINT parte_pessoa_fk;
       public          postgres    false    208    202    2739            �
           2606    36985    tb_processo processo_juiz_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_processo
    ADD CONSTRAINT processo_juiz_fk FOREIGN KEY (oab_juiz) REFERENCES public.tb_juiz(pk_oab);
 F   ALTER TABLE ONLY public.tb_processo DROP CONSTRAINT processo_juiz_fk;
       public          postgres    false    205    212    2745            �
           2606    36995 "   tb_processo processo_promovente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_processo
    ADD CONSTRAINT processo_promovente_fk FOREIGN KEY (promovente) REFERENCES public.tb_parte(pk_id);
 L   ALTER TABLE ONLY public.tb_processo DROP CONSTRAINT processo_promovente_fk;
       public          postgres    false    2749    208    212            �
           2606    36990 !   tb_processo processo_promovido_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_processo
    ADD CONSTRAINT processo_promovido_fk FOREIGN KEY (promovido) REFERENCES public.tb_parte(pk_id);
 K   ALTER TABLE ONLY public.tb_processo DROP CONSTRAINT processo_promovido_fk;
       public          postgres    false    212    208    2749            �
           2606    37000     tb_processo processo_vencedor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_processo
    ADD CONSTRAINT processo_vencedor_fk FOREIGN KEY (vencedor) REFERENCES public.tb_parte(pk_id);
 J   ALTER TABLE ONLY public.tb_processo DROP CONSTRAINT processo_vencedor_fk;
       public          postgres    false    208    212    2749            �
           2606    36911    tb_usuario usuario_pessoa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT usuario_pessoa_fk FOREIGN KEY (pk_cpf) REFERENCES public.tb_pessoa(pk_cpf);
 F   ALTER TABLE ONLY public.tb_usuario DROP CONSTRAINT usuario_pessoa_fk;
       public          postgres    false    203    2739    202            V      x�3�4F .N������ c��      Z      x�3�4�4�2�4�4����� H      T      x������ � �      ^     x�m��n� ���)���\v��Z�gz��2�N;��b3���UH`����:�@��$B�8'q��`�\0n��'ɋhnd��#�n_8�u���2������y�7��/H��"�F��m��o���u߷�5V�t�C���$q��L���Z|7��#�s��K��:��=�>A�a������|��/��X۫�$e��`�&\Doq	%Tn�	���3�O��9*SU�_t�{��κ��Q�S~t��c/�����b���rZ      `   $   x�3�4�4�4�4202�50"+0����� ]h      U      x�3�4E �=... "�8      X   (   x�3�4D ΀ _�0O.#N#������r��qqq 4cS      R   �   x�]��
�0E���$�U���2:���|���X+bp�K����i*�q-�=�
,y]%��I��"p~�z�����+Wq��m:��mr�I�Ji�T�;��(��4�W��.�x�a4���Τ2�      \   /   x�3�4�4�4���420��54�56P00�#NG'נ�=... �"�      S   g   x�30�NG_O?0�����s�p" g@����������L�2B ���_����$
Tn� @���&�$�Q`� �^��Q �J��qqq 260     
CREATE TABLE public.intersecciones
(
  id integer NOT NULL DEFAULT nextval('intersect_id'::regclass),
  usuario character(20) NOT NULL,
  geom geometry(LineString,4326),
  peligrosidad integer,
  CONSTRAINT intersecciones_pkey PRIMARY KEY (id),
  CONSTRAINT intersecciones_usuario_fkey FOREIGN KEY (usuario)
      REFERENCES public.usuario (usuario) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.intersecciones
  OWNER TO postgres;
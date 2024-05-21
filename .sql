CREATE TABLE instituição (
 id BIGSERIAL,
 descrição VARCHAR,
 horas de trabalho INTEGER,
 avaliação INTEGER,
 posts INTEGER,
 voluntariados (id) INTEGER,
 permissões INTEGER,
 senha (hash) VARCHAR,
 Email VARCHAR,
 CNPJ INTEGER,
 foto de perfil (id) INTEGER,
 Nome fantasia INTEGER,
 tipo INTEGER
);


ALTER TABLE instituição ADD CONSTRAINT instituição_pkey PRIMARY KEY (id);

CREATE TABLE Post (
 id BIGSERIAL,
 data INTEGER,
 hora INTEGER,
 descrição INTEGER,
 comentários (id) INTEGER,
 Nome fantasia INTEGER
);


ALTER TABLE Post ADD CONSTRAINT Post_pkey PRIMARY KEY (id, Nome fantasia);

CREATE TABLE comentario (
 id BIGSERIAL,
 Conteúdo VARCHAR,
 foto de perfil (id) INTEGER,
 hora INTEGER,
 Nome fantasia INTEGER
);


ALTER TABLE comentario ADD CONSTRAINT comentario_pkey PRIMARY KEY (id, Nome fantasia, foto de perfil (id));

CREATE TABLE Voluntariado (
 id BIGSERIAL,
 Nome INTEGER,
 descrição VARCHAR,
 Users (id) INTEGER,
 horas INTEGER
);


ALTER TABLE Voluntariado ADD CONSTRAINT Voluntariado_pkey PRIMARY KEY (id, Users (id));

CREATE TABLE User (
 id BIGSERIAL,
 senha (hash) INTEGER,
 Email INTEGER,
 CPF INTEGER,
 foto de perfil (id) INTEGER,
 premissões INTEGER,
 voluntariados (id) INTEGER,
 horas de trabalho INTEGER,
 descrição INTEGER,
 posts INTEGER,
 Data de cadastro INTEGER,
 Tags INTEGER
);


ALTER TABLE User ADD CONSTRAINT User_pkey PRIMARY KEY (id);

CREATE TABLE tipo (
 id BIGSERIAL,
 Empresa INTEGER,
 ONG INTEGER
);


ALTER TABLE tipo ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);

ALTER TABLE instituição ADD CONSTRAINT instituição_posts_fkey FOREIGN KEY (posts) REFERENCES Post(id);
ALTER TABLE instituição ADD CONSTRAINT instituição_voluntariados (id)_fkey FOREIGN KEY (voluntariados (id)) REFERENCES Voluntariado(id);
ALTER TABLE instituição ADD CONSTRAINT instituição_foto de perfil (id)_fkey FOREIGN KEY (foto de perfil (id)) REFERENCES comentario(foto de perfil (id));
ALTER TABLE instituição ADD CONSTRAINT instituição_Nome fantasia_fkey FOREIGN KEY (Nome fantasia) REFERENCES comentario(Nome fantasia);
ALTER TABLE instituição ADD CONSTRAINT instituição_Nome fantasia_fkey FOREIGN KEY (Nome fantasia) REFERENCES Post(Nome fantasia);
ALTER TABLE instituição ADD CONSTRAINT instituição_tipo_fkey FOREIGN KEY (tipo) REFERENCES tipo(id);
ALTER TABLE Post ADD CONSTRAINT Post_comentários (id)_fkey FOREIGN KEY (comentários (id)) REFERENCES comentario(id);
ALTER TABLE Voluntariado ADD CONSTRAINT Voluntariado_Users (id)_fkey FOREIGN KEY (Users (id)) REFERENCES User(id);
ALTER TABLE User ADD CONSTRAINT User_posts_fkey FOREIGN KEY (posts) REFERENCES Post(id);
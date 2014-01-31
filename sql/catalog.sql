-- Database Creation
#CREATE DATABASE catalog_new;
USE catalog_new;

-- Table Script Creation
CREATE TABLE project_categories(
   category_id int(11),
   project_id int(11),
   PRIMARY KEY (category_id ,project_id)
) ENGINE = 'INNODB';

CREATE TABLE project_genres(
   project_id int(11),
   genre_id int(11),
   PRIMARY KEY (project_id ,genre_id)
) ENGINE = 'INNODB';

CREATE TABLE project_authors(
   project_id int(11),
   author_id int(11),
   type varchar(15),
   PRIMARY KEY (project_id ,author_id)
) ENGINE = 'INNODB';

CREATE TABLE person_roles(
   person_id int(11),
   role_id int(11),
   PRIMARY KEY (person_id ,role_id)
) ENGINE = 'INNODB';

CREATE TABLE group_projects(
   group_id int(11),
   project_id int(11),
   PRIMARY KEY (group_id ,project_id)
) ENGINE = 'INNODB';

CREATE TABLE files(
   project_id int(11),
   file_number int(11),
   `key` varchar(40),
   `value` text,
   PRIMARY KEY (project_id)
) ENGINE = 'INNODB';

CREATE TABLE keywords(
   id int(11),
   `value` varchar(25),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE authors(
   id int(11),
   first_name varchar(55),
   last_name varchar(55),
   psuedo_first_name varchar(55),
   psuedo_last_name varchar(55),
   author_url text,
   other_url text,
   dob varchar(10),
   dod varchar(10),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE persons(
   id int(11),
   forum_name varchar(55),
   email varchar(55),
   website varchar(255),
   display_name varchar(55),
   agreement int(11),
   max_projects int(11),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE groups(
   id int(11),
   name varchar(255),
   description text,
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE categories(
   id int(11),
   name varchar(55),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE genres(
   id int(11),
   name varchar(55),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE languages(
   id int(11),
   name varchar(55),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE projects(
   id int(11),
   language_id int(11),
   person_bc_id int(11),
   person_altbc_id int(11),
   person_mc_id int(11),
   person_pl_id int(11),
   title_prefix varchar(55),
   title text,
   description text,
   project_type varchar(55),
   num_sections int(11),
   has_preface int(11),
   date_target DateTime,
   date_completed DateTime,
   status varchar(55),
   url_text_source text,
   url_project text,
   url_other text,
   date_begin DateTime,
   copyright_check int(11),
   url_librivox text,
   url_forum text,
   url_iarchive text,
   notes text,
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE sections(
   id int(11),
   project_id int(11),
   section_number int(11),
   title text,
   listen_url text,
   status varchar(55),
   pl_status varchar(55),
   word_count int(11),
   notes text,
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE readers(
   id int(11),
   person_id int(11),
   project_id int(11),
   section_number int(11),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

CREATE TABLE roles(
   id int(11),
   name varchar(55),
   code varchar(11),
   PRIMARY KEY (id)
) ENGINE = 'INNODB';

-- Relationships Creation
ALTER TABLE project_authors ADD  CONSTRAINT projects_project_authors_CON FOREIGN KEY(project_id) REFERENCES projects (id);
ALTER TABLE authors ADD  CONSTRAINT project_authors_authors_CON FOREIGN KEY(id) REFERENCES project_authors (author_id);
ALTER TABLE group_projects ADD  CONSTRAINT group_projects_group_projects_CON FOREIGN KEY(project_id) REFERENCES group_projects (project_id);
ALTER TABLE group_projects ADD  CONSTRAINT group_projects_group_projects_CON FOREIGN KEY(project_id) REFERENCES group_projects (project_id);
ALTER TABLE projects ADD  CONSTRAINT group_projects_projects_CON FOREIGN KEY(id) REFERENCES group_projects (project_id);
ALTER TABLE groups ADD  CONSTRAINT groups_groups_CON FOREIGN KEY(id) REFERENCES groups (id);
ALTER TABLE group_projects ADD  CONSTRAINT groups_group_projects_CON FOREIGN KEY(group_id) REFERENCES groups (id);
ALTER TABLE projects ADD  CONSTRAINT languages_projects_CON FOREIGN KEY(language_id) REFERENCES languages (id);
ALTER TABLE projects ADD  CONSTRAINT project_categories_projects_CON FOREIGN KEY(id) REFERENCES project_categories (project_id);
ALTER TABLE project_categories ADD  CONSTRAINT categories_project_categories_CON FOREIGN KEY(category_id) REFERENCES categories (id);
ALTER TABLE projects ADD  CONSTRAINT project_genres_projects_CON FOREIGN KEY(id) REFERENCES project_genres (project_id);
ALTER TABLE project_genres ADD  CONSTRAINT genres_project_genres_CON FOREIGN KEY(genre_id) REFERENCES genres (id);
ALTER TABLE projects ADD  CONSTRAINT files_projects_CON FOREIGN KEY(id) REFERENCES files (project_id);
ALTER TABLE projects ADD  CONSTRAINT projects_projects_CON FOREIGN KEY(person_bc_id) REFERENCES projects (person_bc_id);
ALTER TABLE persons ADD  CONSTRAINT persons_persons_CON FOREIGN KEY(id) REFERENCES persons (id);
ALTER TABLE persons ADD  CONSTRAINT persons_persons_CON FOREIGN KEY(id) REFERENCES persons (id);
ALTER TABLE persons ADD  CONSTRAINT projects_persons_CON FOREIGN KEY(id) REFERENCES projects (person_bc_id);
ALTER TABLE persons ADD  CONSTRAINT projects_persons_CON FOREIGN KEY(id) REFERENCES projects (person_altbc_id);
ALTER TABLE persons ADD  CONSTRAINT projects_persons_CON FOREIGN KEY(id) REFERENCES projects (person_mc_id);
ALTER TABLE persons ADD  CONSTRAINT projects_persons_CON FOREIGN KEY(id) REFERENCES projects (person_pl_id);
ALTER TABLE groups ADD  CONSTRAINT person_groups_groups_CON FOREIGN KEY(id) REFERENCES person_groups (group_id);
ALTER TABLE persons ADD  CONSTRAINT person_groups_persons_CON FOREIGN KEY(id) REFERENCES person_groups (person_id);
ALTER TABLE readers ADD  CONSTRAINT persons_readers_CON FOREIGN KEY(person_id) REFERENCES persons (id);
ALTER TABLE files ADD  CONSTRAINT files_files_CON FOREIGN KEY(project_id) REFERENCES files (project_id);
ALTER TABLE files ADD  CONSTRAINT readers_files_CON FOREIGN KEY(file_number) REFERENCES readers (section_numer);
ALTER TABLE files ADD  CONSTRAINT files_files_CON FOREIGN KEY(file_number) REFERENCES files (file_number);
ALTER TABLE projects ADD  CONSTRAINT projects_projects_CON FOREIGN KEY(url_other) REFERENCES projects (date_begin);
ALTER TABLE sections ADD  CONSTRAINT projects_sections_CON FOREIGN KEY(project_id) REFERENCES projects (id);
ALTER TABLE readers ADD  CONSTRAINT sections_readers_CON FOREIGN KEY(project_id) REFERENCES sections (project_id);
ALTER TABLE readers ADD  CONSTRAINT sections_readers_CON FOREIGN KEY(section_numer) REFERENCES sections (section_number);
ALTER TABLE readers ADD  CONSTRAINT files_readers_CON FOREIGN KEY(project_id) REFERENCES files (project_id);
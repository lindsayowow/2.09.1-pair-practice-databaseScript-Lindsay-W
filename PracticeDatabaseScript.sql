-- You’re developing a library system that needs to expand to serve multiple 
-- departments in a university, tracking both library resources and course 
-- materials. 

START TRANSACTION;

DROP TABLE IF EXISTS departments, library_resources, course_materials;

CREATE TABLE departments (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(20) NOT NULL,
    contact_name VARCHAR(50) NULL DEFAULT 'N/A',
    campus VARCHAR(50) NULL default ''
);

CREATE TABLE course_materials (
     id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     format_type varchar(20) NOT NULL,
     title VARCHAR(100) NOT NULL,
     department_id int references departments(id),
     FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE library_resources (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    media_type Varchar(20) NOT NULL,
    title VARCHAR(100) NOT NULL,
	department_id int references departments(id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (department_name, contact_name, campus) VALUES
    ('Linguistics', 'Jean-Pierre Theroux', 'Madrid'),
    ('Biology', 'Greg Mendel', 'Main'),
    ('Aviation', 'Amelia Wright', 'Parks');

INSERT INTO library_resources (media_type, title, department_id) VALUES
     ('Textbook','Wie Gehts', 1),
     ('Flight Manual', 'The Beginning Guide to Breaking in the Sky', 3),
     ('Pipette Kit', 'Beaker Brand Bio Bobbles', 2);
    
INSERT INTO course_materials (format_type, title, department_id) VALUES
     ('BlueRay', 'Advanced Flight Simulator', 3),
     ('Encyclopedia', 'Field Guide of Flower Types', 2),
	 ('CD','Learning Spanish 101', 1);
    
commit;
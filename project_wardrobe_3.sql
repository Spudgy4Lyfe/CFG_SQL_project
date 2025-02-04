CREATE DATABASE Clothes;

USE Clothes;

-- table of owners

CREATE TABLE Owner
(owner_id INT AUTO_INCREMENT PRIMARY KEY,
owner_name VARCHAR(20) NOT NULL);

INSERT INTO Owner
(owner_name)
VALUES 
("Anna"),
("Pati"),
("Borrowed"),
("Recycled");


-- table of colours

CREATE TABLE Colours
(colour_id INT AUTO_INCREMENT PRIMARY KEY,
colour_name VARCHAR(20) NOT NULL,
HEX_code VARCHAR(8),
RGB_code VARCHAR(20));

-- insert colours.csv, use existing table Clothes.colours
-- colours table taken from https://htmlcolorcodes.com/color-names/

-- table of locations

CREATE TABLE Location
(location_id INT AUTO_INCREMENT PRIMARY KEY,
location VARCHAR(50) NOT NULL);

INSERT INTO Location
(location)
VALUES
("wardrobe"),
("drawer"),
("bedroom door"),
("bathroom door"),
("living door"),
("drying rack"),
("laundry basket"),
("floor"),
("chair"),
("banister"),
("the pile");


-- table describing purpose of item of clothing

CREATE TABLE Purpose
(purpose_id INT AUTO_INCREMENT PRIMARY KEY,
purpose VARCHAR(20) NOT NULL);

INSERT INTO Purpose
(purpose)
VALUES
("smart"),
("smart-casual"),
("casual"),
("gym"),
("outdoor");


-- block of code relating to table containing the names of clothes

CREATE TABLE Clothes_type
(id INT AUTO_INCREMENT PRIMARY KEY,
item VARCHAR(20) NOT NULL,
brand VARCHAR(20),
colour_id INT,
purpose_id INT,
default_location_id INT,
current_location_id INT,
is_clean Bool,
owner_id INT);

-- insert Clothes_type.csv, use existing table Clothes.Clothes_type

-- inserting another column containing DATE of when an item of clothing was placed in current_location, value NULL will be handled by a procedure
ALTER TABLE Clothes_type
ADD COLUMN current_location_date DATE 
AFTER current_location_id;

-- inserting foreign keys on table Clothes_type
ALTER TABLE Clothes_type
ADD CONSTRAINT
fk_cl_colour_id
FOREIGN KEY
(colour_id)
REFERENCES
Clothes.Colours
(colour_id);

ALTER TABLE Clothes_type
ADD CONSTRAINT
fk_cl_owner_id
FOREIGN KEY
(owner_id)
REFERENCES
Clothes.Owner
(owner_id);

ALTER TABLE Clothes_type
ADD CONSTRAINT
fk_cl_purpose_id
FOREIGN KEY
(purpose_id)
REFERENCES
Clothes.Purpose
(purpose_id);

ALTER TABLE Clothes_type
ADD CONSTRAINT
fk_cl_default_location_id
FOREIGN KEY
(default_location_id)
REFERENCES
Clothes.location
(location_id);

ALTER TABLE Clothes_type
ADD CONSTRAINT
fk_cl_current_location_id
FOREIGN KEY
(current_location_id)
REFERENCES
Clothes.location
(location_id);


-- block of code relating to table containing shoes

CREATE TABLE Shoes
(id INT AUTO_INCREMENT PRIMARY KEY,
item VARCHAR(20) NOT NULL,
brand VARCHAR(20),
colour_id INT,
purpose_id INT,
is_clean Bool,
owner_id INT);

-- insert Shoes.csv, use existing table Clothes.Shoes

-- inserting foreign keys on table Shoes
ALTER TABLE Shoes
ADD CONSTRAINT
fk_sh_colour_id
FOREIGN KEY
(colour_id)
REFERENCES
Clothes.Colours
(colour_id);

ALTER TABLE Shoes
ADD CONSTRAINT
fk_sh_purpose_id
FOREIGN KEY
(purpose_id)
REFERENCES
Clothes.Purpose
(purpose_id);

ALTER TABLE Shoes
ADD CONSTRAINT
fk_sh_owner_id
FOREIGN KEY
(owner_id)
REFERENCES
Clothes.Owner
(owner_id);



-- block of code relating to table containing accessories

CREATE TABLE Accessories
(id INT AUTO_INCREMENT PRIMARY KEY,
item VARCHAR(20) NOT NULL,
brand VARCHAR(20),
colour_id INT,
purpose_id INT,
owner_id INT);

-- insert accessories.csv , use existing table Clothes.accessories

-- inserting foreign keys on table Shoes
ALTER TABLE Accessories
ADD CONSTRAINT
fk_ac_colour_id
FOREIGN KEY
(colour_id)
REFERENCES
Clothes.Colours
(colour_id);

ALTER TABLE Accessories
ADD CONSTRAINT
fk_ac_purpose_id
FOREIGN KEY
(purpose_id)
REFERENCES
Clothes.Purpose
(purpose_id);

ALTER TABLE Accessories
ADD CONSTRAINT
fk_ac_owner_id
FOREIGN KEY
(owner_id)
REFERENCES
Clothes.Owner
(owner_id);

-- bonus table ;p
CREATE TABLE Secret_Cayman_account
(transaction_id INT AUTO_INCREMENT PRIMARY KEY,
cay_owner_id INT DEFAULT 1,
per_job FLOAT,
job_date DATE DEFAULT (CURRENT_DATE));



-- inserting a foreign key on table Secret_Cayman_account
ALTER TABLE secret_cayman_account
ADD CONSTRAINT
fk_cay_owner_id
FOREIGN KEY
(cay_owner_id)
REFERENCES
Clothes.Owner
(owner_id);

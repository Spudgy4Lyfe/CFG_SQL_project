USE Clothes;
SELECT * FROM Clothes_type;

SELECT item, owner_id FROM Clothes_type
WHERE item LIKE "%sock%" AND owner_id = 2 AND is_clean = 1;

-- JOINS
-- 1
-- this join shows all clean black items of clothing regardless of owner
SELECT
    ct.item,
    ct.brand,
    c.colour_name,
    o.owner_name
FROM
    Clothes_type ct
LEFT JOIN
    Colours c ON ct.colour_id = c.colour_id
LEFT JOIN
    Owner o ON ct.owner_id = o.owner_id
WHERE c.colour_name = "black" AND ct.is_clean = 1; -- AND o.owner_name = "Pati";

-- 2
-- this join shows where Pati's clothes are currently located if not in default location
SELECT
	ct.current_location_id, 
    l.location,
    o.owner_name
FROM 
	Clothes_type ct
LEFT JOIN 
	Location l ON ct.current_location_id = l.location_id
LEFT JOIN
	Owner o ON ct.owner_id = o.owner_id
WHERE owner_name = "Pati" AND default_location_id != current_location_id;

-- 3
-- shows items of clothing whose colour is blue or related
SELECT 
	ct.item, o.owner_name, col.colour_name
FROM 
	Clothes_type AS ct
LEFT JOIN 
	Colours col ON ct.colour_id = col.colour_id
LEFT JOIN 
	Owner o ON ct.owner_id = o.owner_id
WHERE col.colour_name LIKE '%blue%';

-- 4
-- shows shoes with purpose "gym"
SELECT 
	sh.item, o.owner_name FROM Shoes sh
LEFT JOIN 
	Owner o ON sh.owner_id = o.owner_id
WHERE sh.purpose_id = (SELECT p.purpose_id from Purpose p WHERE p.purpose = "gym")
ORDER BY sh.owner_id;

-- 5
-- shows all clothes and shoes with colour_id = 142 -> black 
SELECT 
	item
FROM 
	clothes_type
WHERE colour_id = 142
UNION
SELECT 
	item
FROM 
	shoes
WHERE colour_id = 142;

-- 6
-- shows all clothes and shoes with colour id = 142 together with their owner's name
SELECT ct.item AS clothes_item, o.owner_name
FROM clothes_type AS ct
JOIN owner AS o ON ct.owner_id = o.owner_id
WHERE ct.colour_id = 142
UNION
SELECT s.item AS shoe_item, o.owner_name
FROM shoes AS s
JOIN owner AS o ON s.owner_id = o.owner_id
WHERE s.colour_id = 142;



-- PROCEDURES
-- 1
-- procedure to insert today's date where there is NULL; useful after I added another column to Clothes_type with the current_location_date or any time a line without date is added
DELIMITER //

CREATE PROCEDURE update_current_location_date()

BEGIN

	UPDATE Clothes_type
	SET current_location_date = CURDATE()
	WHERE current_location_date IS NULL;

END //
DELIMITER ;

-- call the procedure
CALL update_current_location_date();

-- 2
-- procedure to add money to secret_cayman_account
-- Patrik does his own laundry but does not like to fold and put away clothes, not fun! He will sometimes ask Anna to help with this. Anna values her time so will charge money for this.
DELIMITER //

CREATE PROCEDURE add_cayman_dosh(
	IN per_hour FLOAT,
    IN num_hours FLOAT
)
BEGIN
	DECLARE per_job_amount FLOAT;
    DECLARE number_of_shirts INT;

	-- calculate the per_job amount, round up the num_hours as it is charged per every hour started; if any shirts need pressing, it is charged £5 per shirt in addition to the per_hour charge
    SELECT COUNT(*) INTO number_of_shirts
    FROM clothes_type
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "the pile")
        AND item = "shirt";
    IF number_of_shirts > 0 THEN
		SET per_job_amount = per_hour * CEIL(num_hours) + (number_of_shirts * 5);
	ELSEIF number_of_shirts = 0 THEN
		SET per_job_amount = per_hour * CEIL(num_hours);
    END IF; 
    
    -- update the current_location to default_location on clothes that were in "the pile" and have now been pressed, folded and put away where they belong
    UPDATE Clothes_type
    SET current_location_id = default_location_id
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "the pile");
    
    -- update the secret_cayman_account table with the new line containing the money earned from this task
    INSERT INTO secret_cayman_account
    (per_job)
    VALUES
    (per_job_amount);
    
END //
DELIMITER ;

-- call the procedure
CALL add_cayman_dosh(30.00, 1.1);

SELECT * FROM secret_cayman_account;

-- DROP PROCEDURE add_cayman_dosh;

-- FUNCTIONS
-- 1
-- checks the number of items in the laundry basket and displays message if threshold met/exceeded
DELIMITER //
CREATE FUNCTION check_laundry_basket_items()
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE item_count INT;
    SET item_count = (SELECT COUNT(*) FROM clothes_type WHERE current_location_id = (SELECT location_id FROM location WHERE location = "laundry basket"));
    IF item_count >= 10 THEN
        RETURN "It's time you run the laundry!";
    ELSE
        RETURN "Laundry can wait another day or two.";
    END IF;
END //
DELIMITER ;

-- call the function
SELECT check_laundry_basket_items();

-- EVENTS
-- 1
-- Anna does her laundry, folding and putting away on Thursdays; this event changes current_location of Anna's clothes from "drying rack" to default_location if date != CURDATE()
-- for Pati, the clothes go from "drying rack" to "the pile", as Anna does not volunteer to deal with his clothes
-- then the event changes current_location from "laundry basket" to "drying rack" for Anna's clothes, current_location_date is updated by a TRIGGER below

DELIMITER //
CREATE EVENT update_clothes_locations
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-06-27 15:00:00'
DO BEGIN
    -- Update current_location_id to default_location_id where current_location_id = "drying rack" -> fold and put away the clothes
    UPDATE Clothes_type
    SET current_location_id = default_location_id
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "drying rack")
        AND current_location_date != CURDATE() -- don't want to move wet clothes, so if on drying rack with current date, won't be moved
        AND owner_id = (SELECT owner_id FROM Owner WHERE owner_name = "Anna");
        
    -- Update current_location_id to "the pile" for Pati's clothes  
	UPDATE Clothes_type
    SET current_location_id = (SELECT location_ FROM Location WHERE location = "the pile")
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "drying rack")
		AND owner_id = (SELECT owner_id FROM Owner WHERE owner_name = "Pati")
        AND current_location_date != CURDATE(); -- again, don't want to move wet clothes

    -- Change current_location_id from "laundry basket" to "drying rack" where the owner is "Anna" -> run and hang the laundry
    UPDATE Clothes_type
    SET current_location_id = (SELECT location_id FROM Location WHERE location = "drying rack")
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "laundry basket")
        AND owner_id = (SELECT owner_id FROM owner WHERE owner_name = "Anna");
END //
DELIMITER ;

-- 2
-- this event changes current_location from "banister" to "laundry basket" on any item which has been on the banister for 14 days or more; I mean Anna is patient, but not THAT patient
DELIMITER //
CREATE EVENT update_location_event
ON SCHEDULE EVERY 1 WEEK
DO BEGIN
    -- Update the current_location_id to "laundry basket" where current_location_id is "banister"
    -- and current_location_date is 14 or more days ago
    UPDATE Clothes_type
    SET current_location_id = (SELECT location_id FROM Location WHERE location = "laundry basket")
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "banister")
    AND (CURDATE() - Clothes_type.current_location_date) >= 14;
END// 

DELIMITER ;

SELECT * FROM Clothes_type
WHERE current_location_id = 10; -- banister

-- TRIGGERS
-- 1
-- this trigger changes the current_location_date in the Clothes_type table to current date if the current_location_id was updated
DELIMITER //

CREATE TRIGGER update_current_location_date
	AFTER UPDATE ON Clothes_type
	FOR EACH ROW
    BEGIN
		IF NEW.current_location_id != OLD.current_location_id THEN
			UPDATE Clothes_type
            SET current_location_date = CURDATE()
            WHERE current_location_id = NEW.current_location_id;
		END IF;
	END //
		
	DELIMITER ;




-- VIEWS
-- 1 
CREATE VIEW vw_clean_clothes AS
	SELECT 
    o.owner_name, 
    ct.item, 
    col.colour_name, 
    l.location
FROM clothes_type AS ct
LEFT JOIN
	Owner o ON ct.owner_id = o.owner_id
LEFT JOIN
	Colours col ON ct.colour_id = col.colour_id
LEFT JOIN
	Location l ON ct.current_location_id = l.location_id
WHERE ct.is_clean = 1;

-- DROP VIEW vw_clean_clothes;

SELECT * FROM vw_clean_clothes;

-- show how many clean clothing items of a specific type there are, from the vw_clean_clothes
SELECT item, COUNT(item) AS item_count
FROM vw_clean_clothes
GROUP BY item
ORDER BY item_count;


-- simple query with GROUP BY on entire Db
SELECT item, colour_id FROM Clothes_type
WHERE item = "t-shirt"
GROUP BY colour_id;

 -- query containing GROUP BY and HAVING
SELECT
    ct.item,
    col.colour_name,
    COUNT(*) AS total_items
FROM clothes_type AS ct
LEFT JOIN Colours col ON ct.colour_id = col.colour_id
GROUP BY ct.item, col.colour_name
HAVING total_items > 2;

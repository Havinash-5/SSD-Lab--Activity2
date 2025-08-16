USE 2025201024_lab2;

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(30))
BEGIN
    DECLARE new_id INT;

    IF NOT EXISTS (
        SELECT 1 FROM Subscribers WHERE SubscriberName = subName
    ) THEN
        -- compute next ID into a variable
        SELECT IFNULL(MAX(SubscriberID),0) + 1 
        INTO new_id
        FROM Subscribers;

        -- insert using variable
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (new_id, subName, CURDATE());

        SELECT CONCAT('Subscriber "', subName, '" has been added.') AS Message;
    ELSE
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Message;
    END IF;
END $$

DELIMITER ;

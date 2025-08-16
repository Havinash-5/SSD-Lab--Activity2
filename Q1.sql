USE 2025201024_lab2;

DELIMITER $$

DROP PROCEDURE IF EXISTS ListAllSubscribers;
CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE subscriber_name VARCHAR(30);

    DECLARE cur CURSOR FOR
        SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	DROP TEMPORARY TABLE IF EXISTS all_names;
    CREATE TEMPORARY TABLE all_names (Subscriber VARCHAR(30));

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO subscriber_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO all_names VALUES (subscriber_name);
    END LOOP;
    CLOSE cur;
    
    SELECT * FROM all_names;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS PrintAllSubscribersWatchHistory;

DELIMITER $$

CREATE PROCEDURE PrintAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sub_id INT;
    DECLARE sub_name VARCHAR(100);

    -- Cursor for all subscribers
    DECLARE cur CURSOR FOR
        SELECT SubscriberID, SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    subscriber_loop: LOOP
        FETCH cur INTO sub_id, sub_name;
        IF done THEN
            LEAVE subscriber_loop;
        END IF;

        -- Print a header row
        SELECT CONCAT('Watch History for ', sub_name, ' (ID: ', sub_id, ')') AS Header;

        -- Call q2 for this subscriber
        CALL GetWatchHistoryBySubscriber(sub_id);

    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;


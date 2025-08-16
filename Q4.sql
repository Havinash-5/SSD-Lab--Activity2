USE 2025201024_lab2;

DROP PROCEDURE IF EXISTS SendWatchTimeReport;

DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE Subscriber_ID INT;

    -- Cursor for all subscribers who have watched something
    DECLARE cur CURSOR FOR
        SELECT DISTINCT SubscriberID 
        FROM WatchHistory;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    subscriber_loop: LOOP
        FETCH cur INTO Subscriber_ID;
        IF done THEN
            LEAVE subscriber_loop;
        END IF;

        -- Header for clarity
        SELECT CONCAT('Watch History for Subscriber ID: ', Subscriber_ID) AS Header;

        -- Call q2 procedure for each subscriber
        CALL GetWatchHistoryBySubscriber(Subscriber_ID);
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;
CALL SendWatchTimeReport();

use 2025201024_lab2;

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;

DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN Subscriber_ID INT)
BEGIN
	SELECT
		s.Title AS Show_Title, 
        s.Genre AS Show_Genre, 
        w.WatchTime AS Minutes_Watched
        FROM WatchHistory w
        JOIN Shows s
			ON  s.ShowID = w.ShowID
    WHERE w.SubscriberID = Subscriber_ID;
END $$

DELIMITER ;


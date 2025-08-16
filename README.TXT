Q1.sql ---------  ListAllSubscribers()
	It is a Procedure that uses cursor cur for printing all the Subscriber Names
    To execute, 
    CALL ListAllSubscribers();  -- print names of all the subscribers

Q2.sql --------- GetWatchHistoryBySubscriber(IN Subscriber_ID INT)
	It is a Procedure that uses a join to get the watch history of the subscriber with ID Subscriber_ID
    To execute, 
    CALL GetWatchHistoryBySubscriber(1);  -- gets you the watch history of the subscriber with ID 1
    
Q3.sql --------- AddSubscriberIfNotExists('Harry Potter')
	It is a Procedure that adds Harry Potter to the subscribers' list if he is not present in the list and gives him a new subscriber ID
    To execute, 
    CALL AddSubscriberIfNotExists('Harry Potter');  -- add the subscriber named Harry Potter to subscribers list
    
Q4.sql --------- SendWatchTimeReport()
	It is a Procedure that uses cursor cur to print the watch history of subscribers if they have watched something by internally calling GetWatchHistoryBySubscriber()
    To execute, 
    CALL SendWatchTimeReport();  -- prints watch history of all subscribers who have watched something
    
Q5.sql --------- PrintAllSubscribersWatchHistory()
	It is a Procedure that uses cursor cur to print the watch history of all the subscribers, irrespective of their watch time
    To execute, 
    CALL PrintAllSubscribersWatchHistory();  -- prints watch history of all subscribers
    
    
    
-- GITHUB REPO LINK

-- Pushing the start and end time of an event back by 2 hours
UPDATE Event 
SET start_time = '2026-08-15 11:00:00', 
    end_time = '2026-08-15 19:00:00'
WHERE event_id = 1;
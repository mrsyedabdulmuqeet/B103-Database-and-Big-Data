SELECT 
    e.title AS 'Event Name',
    o.name AS 'Organizer',
    SUM(t.price) AS 'Total Revenue'
FROM Event e
JOIN Organizer o ON e.organizer_id = o.organizer_id
JOIN TicketType t ON e.event_id = t.event_id
JOIN Booking b ON t.ticket_type_id = b.ticket_type_id
WHERE b.payment_status = 'Paid'
GROUP BY e.title, o.name
ORDER BY 'Total Revenue' DESC;
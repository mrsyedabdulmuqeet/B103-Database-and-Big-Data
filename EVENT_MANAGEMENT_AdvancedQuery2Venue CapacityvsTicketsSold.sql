SELECT 
    v.venue_name,
    v.max_capacity,
    COUNT(b.booking_id) AS 'Tickets Sold',
    (v.max_capacity - COUNT(b.booking_id)) AS 'Remaining Capacity'
FROM Venue v
JOIN Event e ON v.venue_id = e.venue_id
JOIN TicketType t ON e.event_id = t.event_id
LEFT JOIN Booking b ON t.ticket_type_id = b.ticket_type_id
GROUP BY v.venue_name, v.max_capacity;
SELECT DISTINCT 
    p.first_name, 
    p.last_name, 
    p.email,
    e.title AS 'Event Attended'
FROM Participant p
JOIN Booking b ON p.participant_id = b.participant_id
JOIN TicketType t ON b.ticket_type_id = t.ticket_type_id
JOIN Event e ON t.event_id = e.event_id
WHERE t.tier_name = 'VIP Pass' 
  AND b.payment_status = 'Paid';
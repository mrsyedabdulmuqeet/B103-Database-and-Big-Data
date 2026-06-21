SELECT p.first_name, p.last_name, p.email, t.tier_name, b.payment_status
FROM Participant p
JOIN Booking b ON p.participant_id = b.participant_id
JOIN TicketType t ON b.ticket_type_id = t.ticket_type_id
WHERE t.event_id = 1;
-- Registers a new VIP ticket booking for Jane Doe
INSERT INTO Booking (participant_id, ticket_type_id, payment_status) 
VALUES (1, 2, 'Paid');

-- IMPORTANT: Update the available ticket quantity using business logic
UPDATE TicketType 
SET quantity_available = quantity_available - 1 
WHERE ticket_type_id = 2;
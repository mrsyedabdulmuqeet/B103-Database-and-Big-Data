-- If a user cancels, we delete the booking and restore the ticket quantity
DELETE FROM Booking WHERE booking_id = 1;

UPDATE TicketType 
SET quantity_available = quantity_available + 1 
WHERE ticket_type_id = 2;
-- Insert Sample Venues and Organizers
INSERT INTO Venue (venue_name, address, max_capacity) VALUES 
('The Grand Hall', '123 Main St, Dublin', 500),
('Tech Hub Arena', '45 Innovation Way, London', 200);

INSERT INTO Organizer (name, contact_email) VALUES 
('Global Tech Summits', 'contact@globaltech.com'),
('Local Arts Council', 'events@localarts.org');

-- Insert an Event
INSERT INTO Event (title, start_time, end_time, venue_id, organizer_id) VALUES 
('Cloud Architecture Summit 2026', '2026-08-15 09:00:00', '2026-08-15 17:00:00', 1, 1);

-- Insert Ticket Tiers for the Event
INSERT INTO TicketType (event_id, tier_name, price, quantity_available) VALUES 
(1, 'General Admission', 50.00, 400),
(1, 'VIP Pass', 150.00, 100);

-- Insert a Participant
INSERT INTO Participant (first_name, last_name, email) VALUES 
('Jane', 'Doe', 'jane.doe@example.com');
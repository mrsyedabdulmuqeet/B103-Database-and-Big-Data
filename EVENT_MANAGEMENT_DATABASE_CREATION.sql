-- 1. Create the Venue Table (Parent)
CREATE TABLE Venue (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    max_capacity INT NOT NULL CHECK (max_capacity > 0)
);

-- 2. Create the Organizer Table (Parent)
CREATE TABLE Organizer (
    organizer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(150) NOT NULL UNIQUE
);

-- 3. Create the Event Table (Child of Venue and Organizer)
CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    venue_id INT NOT NULL,
    organizer_id INT NOT NULL,
    CONSTRAINT chk_time CHECK (end_time > start_time),
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id) ON DELETE RESTRICT,
    FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id) ON DELETE CASCADE
);

-- 4. Create the TicketType Table (Child of Event)
CREATE TABLE TicketType (
    ticket_type_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    tier_name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    quantity_available INT NOT NULL CHECK (quantity_available >= 0),
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE
);

-- 5. Create the Participant Table (Parent to Booking)
CREATE TABLE Participant (
    participant_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

-- 6. Create the Booking Table (Child of Participant and TicketType)
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    participant_id INT NOT NULL,
    ticket_type_id INT NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_status VARCHAR(20) NOT NULL CHECK (payment_status IN ('Pending', 'Paid', 'Refunded')),
    FOREIGN KEY (participant_id) REFERENCES Participant(participant_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_type_id) REFERENCES TicketType(ticket_type_id) ON DELETE RESTRICT
);
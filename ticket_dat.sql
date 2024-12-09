-- Movie Ticket Reservation System--


-- Step 1: Create Database
CREATE DATABASE MovieReservation;
USE MovieReservation;

-- Step 2: Create Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Step 3: Create Movies Table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_date DATE
);

-- Step 4: Create Showtimes Table
CREATE TABLE Showtimes (
    showtime_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    start_time DATETIME,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Step 5: Create Reservations Table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    showtime_id INT,
    booking_status VARCHAR(20),
    booking_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (showtime_id) REFERENCES Showtimes(showtime_id)
);

-- Step 6: Create Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT,
    amount DECIMAL(10, 2),
    payment_status VARCHAR(20),
    payment_date DATETIME,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
);

-- Step 7: Create Ratings Table
CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating_score INT CHECK (rating_score BETWEEN 1 AND 5),
    rating_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Step 8: Create Revenue Table
CREATE TABLE Revenue (
    revenue_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    total_revenue DECIMAL(10, 2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);


-- Insert Sample Users
INSERT INTO Users (name, email) VALUES 
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com');

-- Insert Sample Movies
INSERT INTO Movies (title, genre, release_date) VALUES 
('Movie A', 'Action', '2024-01-15'),
('Movie B', 'Comedy', '2024-02-10'),
('Movie C', 'Drama', '2024-03-05');

-- Insert Sample Showtimes
INSERT INTO Showtimes (movie_id, start_time) VALUES 
(1, '2024-10-25 14:00:00'),
(2, '2024-10-25 16:00:00'),
(3, '2024-10-25 18:00:00');

-- Insert Sample Reservations
INSERT INTO Reservations (user_id, showtime_id, booking_status, booking_date) VALUES 
(1, 1, 'Confirmed', '2024-10-23 10:00:00'),
(2, 2, 'Cancelled', '2024-10-23 11:00:00');

-- Insert Sample Payments
INSERT INTO Payments (reservation_id, amount, payment_status, payment_date) VALUES 
(1, 15.00, 'Completed', '2024-10-23 10:15:00');

-- Insert Sample Ratings
INSERT INTO Ratings (user_id, movie_id, rating_score, rating_date) VALUES 
(1, 1, 5, '2024-10-23 12:00:00'),
(2, 2, 4, '2024-10-23 13:00:00');


desc reservations;
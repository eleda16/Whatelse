USE Nespresso;

-- Dropping the actual tables
DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS Contain;
DROP TABLE IF EXISTS Basket;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Coffee;

-- Coffee table: table holding all the different kinds of coffees in store
CREATE TABLE Coffee (
    Serial_number INT,
    Name VARCHAR(30),
    Beans VARCHAR(7),
    Intensity INT,
    Origin VARCHAR(255),
    Color VARCHAR(20),
    Price DECIMAL(10, 2)
);

-- Client table : table holding all the clients that bought something in the store
CREATE TABLE Client (
    Client_id INT,
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    Level VARCHAR(20),
    Favorite_intensity INT
);

-- Basket table : table containing the users and their order
CREATE TABLE Basket(
    Basket_id INT,
    Client_id INT,
    Purchase_date date
);

-- Feedback table : table containing the comments of the users's satisfaction
CREATE TABLE Feedback (
    Feedback_id INT,
    Order_ref int,
    Feedback_date DATE,
    Review TEXT,
    Rating DOUBLE
);

-- Contain table : table linking the baskets and the different coffees and their quantities
CREATE TABLE Contain (
    Basket_id INT,
    Serial_number INT,
    Quantity INT
);


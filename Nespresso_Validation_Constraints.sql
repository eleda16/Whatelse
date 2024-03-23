USE Nespresso;

ALTER TABLE Coffee ADD PRIMARY KEY (Serial_number); -- adding a primary key to the Coffee table
ALTER TABLE Coffee MODIFY Name VARCHAR(30) NOT NULL; -- coffee name cannot be null
ALTER TABLE Coffee ADD CONSTRAINT CHECK (Beans IN ('Arabica', 'Robusta')); -- there are only two kinds of seeds : Arabica and Robusta

ALTER TABLE Client ADD PRIMARY KEY (Client_id); -- adding a primary key to the Client table
ALTER TABLE Client ADD CONSTRAINT UNIQUE (Client_id); -- there can't be two clients with the same ID
ALTER TABLE Client ADD CONSTRAINT CHECK (Level IN ('Connoisseur', 'Expert', 'Ambassador')); -- the level of the client can only be one of these 3

ALTER TABLE Basket ADD PRIMARY KEY (Basket_id); -- adding a primary key to the Basket table
ALTER TABLE Basket ADD CONSTRAINT FOREIGN KEY (Client_id) REFERENCES Client(Client_id); -- adding a foreign key to link Client_id identifiers


ALTER TABLE Feedback ADD PRIMARY KEY (Feedback_id); -- adding a primary key to the Feedback table
ALTER TABLE Feedback ADD CONSTRAINT FOREIGN KEY (Order_ref) REFERENCES Basket(Basket_id); -- adding a foreign key to link Order_ref identifiers
ALTER TABLE Feedback ADD CONSTRAINT CHECK (rating BETWEEN 0 AND 5); -- the rating must be between 0 and 5
ALTER TABLE Feedback ADD CONSTRAINT UNIQUE (Feedback_id); -- you can only give one feedback for a basket

ALTER TABLE Contain ADD PRIMARY KEY (Basket_id, Serial_number); -- adding a primary key to the Contain table
ALTER TABLE Contain ADD CONSTRAINT FOREIGN KEY (Basket_id) REFERENCES Basket(Basket_id); -- adding a foreign key to link Basket_id identifiers
ALTER TABLE Contain ADD CONSTRAINT FOREIGN KEY (Serial_number) REFERENCES Coffee(Serial_number); -- adding a foreign key to link Serial_number identifiers


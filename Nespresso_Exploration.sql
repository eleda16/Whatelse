-- BIG SELECTIONS
SELECT * FROM Coffee; -- A wide range of coffees
SELECT * FROM Client; -- Information on the clients of the shop
SELECT * FROM Basket; -- The ids of the bought baskets, the ids of the buyers, and the date of purchase
SELECT * FROM Contain; -- What every bought basket contains
SELECT * FROM Feedback; -- User experience on the basket after purchase


-- CHOOSING COFFEE --
-- A display if client 45079, Elizabeth Purdue, wanted to know what coffee would be to her liking (hence only the ones with her favorite intensity : 5)
SELECT Name, Beans, Intensity, Price, First_name, Last_name FROM Coffee JOIN Client ON Coffee.Intensity = Client.Favorite_intensity WHERE Client.Client_id = 45079;

SELECT * FROM Coffee WHERE Beans = 'Arabica' AND Intensity > 7; -- Displays coffees that have an intensity greater than 7 but in Arabica beans

SELECT Name, CASE WHEN Beans = 'Robusta' THEN 'Strong' ELSE 'Mild' END AS Strength FROM Coffee; -- Displays if a coffee is strong or mild according to the type of bean

-- Displays the averages of ratings of the bought & rated coffees
SELECT c.Origin, AVG(f.Rating) AS Average_Rating FROM Coffee c JOIN Contain ct ON c.Serial_number = ct.Serial_number JOIN Basket b ON ct.Basket_id = b.Basket_id JOIN Feedback f ON b.Basket_id = f.Order_ref GROUP BY c.Origin;

-- The partition of Arabica and Robusta beans on each country
SELECT Origin, SUM(CASE WHEN Beans = 'Arabica' THEN 1 ELSE 0 END) AS Arabica_Count, SUM(CASE WHEN Beans = 'Robusta' THEN 1 ELSE 0 END) AS Robusta_Count FROM Coffee GROUP BY Origin;


-- PAYMENT --
-- Displays the prices of each basket
SELECT Basket_id, SUM(Quantity * Price) AS Total FROM Contain JOIN Coffee ON contain.Serial_number = Coffee.Serial_number GROUP BY Basket_id;

-- Displays only the price of the basket of client 45079, Elizabeth Purdue
SELECT First_name, Last_name, Purchase_date, SUM(Contain.Quantity * Coffee.Price) AS Total FROM Contain JOIN Coffee ON Contain.Serial_number = Coffee.Serial_number JOIN Basket ON Contain.Basket_id = Basket.Basket_id JOIN Client ON Basket.Client_id = Client.Client_id WHERE Client.Client_id = 45079 GROUP BY First_name, Last_name, Purchase_date;

-- Displays the prices of each basket but with the names of the clients for more clarity
SELECT First_name, Last_name, SUM(Contain.Quantity * Coffee.Price) AS Total FROM Contain JOIN Coffee ON Contain.Serial_number = Coffee.Serial_number JOIN Basket ON Contain.Basket_id = Basket.Basket_id JOIN Client ON Basket.Client_id = Client.Client_id GROUP BY First_name, Last_name;


-- FINDING ORDERS --
SELECT * FROM Basket WHERE Purchase_date BETWEEN '2023-01-01' AND '2023-03-31'; -- displays all orders that occurred between two particular dates


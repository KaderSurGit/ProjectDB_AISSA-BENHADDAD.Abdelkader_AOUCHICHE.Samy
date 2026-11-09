-- 3_insertion.sql

USE luxury_fashion_db;

-- 1. Tables without foreign keys

INSERT INTO BOUTIQUE (Boutique_Code, Boutique_Name, Boutique_City, Boutique_Country, Prestige_Tier, Boutique_Phone) VALUES
('B01', 'Maison Faubourg', 'Paris', 'France', 'Historical', '+33140200001'),
('B02', 'Ginza Flagship', 'Tokyo', 'Japan', 'Flagship', '+81355550002'),
('B03', 'Fifth Ave Maison', 'New York', 'USA', 'Flagship', '+12125550003'),
('B04', 'Milano Montenapoleone', 'Milan', 'Italy', 'Flagship', '+39025550004'),
('B05', 'Courchevel Winter', 'Courchevel', 'France', 'Pop-up', '+33479000005');

INSERT INTO CLIENT_VIP (VIP_Number, First_Name, Last_Name, Email, Phone, Preferred_Language, Spend_Tier) VALUES
('VIP001', 'Eleanor', 'Vanderbilt', 'eleanor.v@email.com', '+19175550101', 'English', 'Diamond'),
('VIP002', 'Kenji', 'Sato', 'k.sato@email.jp', '+81905550202', 'Japanese', 'Platinum'),
('VIP003', 'Isabella', 'Conti', 'isabella.c@email.it', '+393335550303', 'Italian', 'Gold'),
('VIP004', 'Camille', 'Fontaine', 'c.fontaine@email.fr', '+33655550404', 'French', 'Diamond'),
('VIP005', 'Arthur', 'Pendleton', 'arthur.p@email.co.uk', '+447700900505', 'English', 'Platinum'),
('VIP006', 'Mei', 'Lin', 'mei.lin@email.cn', '+86139000006', 'Mandarin', 'Diamond'),
('VIP007', 'Carlos', 'Slimani', 'c.slimani@email.ae', '+971505550707', 'Arabic', 'Gold'),
('VIP008', 'Sofia', 'Rodriguez', 'sofia.r@email.es', '+34600000808', 'Spanish', 'Platinum'),
('VIP009', 'Lars', 'Jensen', 'lars.j@email.dk', '+4520000909', 'English', 'Silver'),
('VIP010', 'Amara', 'Okafor', 'amara.o@email.ng', '+234800001010', 'English', 'Gold');

INSERT INTO LIMITED_PRODUCT (Product_Reference, Product_Name, Product_Category, Material_Description, Production_Limit, Catalog_Price) VALUES
('P101', 'Le Sac Éternel', 'Handbag', 'Matte Niloticus Crocodile with Palladium hardware', 50, 45000.00),
('P102', 'Montre Stellaire', 'Watch', 'Platinum case, meteorite dial, sapphire crystal', 20, 85000.00),
('P103', 'Mocassins Rêve', 'Shoes', 'Calfskin leather, handcrafted wooden sole', 100, 1500.00),
('P104', 'Collier Impérial', 'Jewelry', '18k white gold with Colombian emeralds', 10, 250000.00),
('P105', 'Malle de Voyage', 'Luggage', 'Monogrammed canvas, brass locks, cherry wood', 30, 35000.00),
('P106', 'Ceinture Équestre', 'Accessory', 'Togo leather with gold-plated buckle', 200, 950.00),
('P107', 'Carré de Soie', 'Scarf', '100% hand-rolled silk twill, exclusive artist print', 500, 450.00),
('P108', 'Veste Aviateur', 'Ready-to-wear', 'Shearling and lambskin with bespoke stitching', 40, 12000.00);

-- 2. Tables with Foreign Keys

-- ARTISAN (Recursive: Masters inserted first)
INSERT INTO ARTISAN (Artisan_ID, First_Name, Last_Name, Craft_Specialty, Hire_Date, Years_Experience, Workshop_Location, Mentor_ID, Mentorship_Start_Date) VALUES
('A100', 'Jean', 'Dupont', 'Leatherworking', '2005-03-15', 20, 'Paris Workshop', NULL, NULL),
('A101', 'Marie', 'Laurent', 'Gem-setting', '2010-06-01', 15, 'Geneva Workshop', NULL, NULL),
('A102', 'Carlo', 'Rossi', 'Shoemaking', '2008-09-12', 17, 'Milan Workshop', NULL, NULL);

-- ARTISAN (Recursive: Juniors inserted second, referencing Masters)
INSERT INTO ARTISAN (Artisan_ID, First_Name, Last_Name, Craft_Specialty, Hire_Date, Years_Experience, Workshop_Location, Mentor_ID, Mentorship_Start_Date) VALUES
('A200', 'Lucas', 'Martin', 'Leatherworking', '2022-01-10', 3, 'Paris Workshop', 'A100', '2022-02-01'),
('A201', 'Chloe', 'Dubois', 'Leatherworking', '2023-09-01', 1, 'Paris Workshop', 'A100', '2023-09-15'),
('A202', 'Sophie', 'Bernard', 'Gem-setting', '2021-05-15', 4, 'Geneva Workshop', 'A101', '2021-06-01'),
('A203', 'Luigi', 'Bianchi', 'Shoemaking', '2020-11-20', 5, 'Milan Workshop', 'A102', '2020-12-01'),
('A204', 'Elena', 'Moretti', 'Shoemaking', '2023-02-10', 2, 'Milan Workshop', 'A102', '2023-03-01');

INSERT INTO BESPOKE_ORDER (VIP_Number, Order_Sequential_Num, Order_Date, Estimated_Date, Final_Price, Production_Status, Client_Request_Notes, Artisan_ID, Boutique_Code) VALUES
('VIP001', 1, '2024-01-10', '2024-06-15', 55000.00, 'In Production', 'Custom pink interior lining', 'A100', 'B03'),
('VIP001', 2, '2024-02-20', '2024-08-20', 95000.00, 'Materials Sourced', 'Engrave initials E.V. on case back', 'A101', 'B03'),
('VIP002', 1, '2023-11-05', '2024-03-01', 28000.00, 'Delivered', 'Specific matte black finish', 'A200', 'B02'),
('VIP004', 1, '2024-03-01', '2024-12-01', 275000.00, 'Design Phase', 'Replace standard emeralds with sapphires', 'A101', 'B01'),
('VIP004', 2, '2024-03-15', '2024-05-01', 1800.00, 'In Production', 'Wider fit for shoes', 'A102', 'B01'),
('VIP005', 1, '2024-01-25', '2024-05-10', 40000.00, 'In Production', 'Custom dimensions to fit specific car trunk', 'A100', 'B01'),
('VIP006', 1, '2023-12-10', '2024-04-10', 60000.00, 'Delivered', 'Red crocodile leather', 'A201', 'B02'),
('VIP007', 1, '2024-02-05', '2024-07-01', 15000.00, 'Materials Sourced', 'Gold threading on jacket', 'A200', 'B04'),
('VIP008', 1, '2023-09-15', '2023-12-20', 45000.00, 'Delivered', 'Extra inner pocket', 'A100', 'B04'),
('VIP008', 2, '2024-01-11', '2024-06-01', 320000.00, 'In Production', 'Add 2 carat diamond to necklace', 'A101', 'B04'),
('VIP002', 2, '2024-03-10', '2024-09-10', 42000.00, 'Design Phase', 'Custom hardware finish', 'A200', 'B02'),
('VIP010', 1, '2024-02-28', '2024-08-01', 52000.00, 'Materials Sourced', 'Green interior lining', 'A100', 'B03'),
('VIP003', 1, '2023-10-01', '2024-01-15', 2000.00, 'Delivered', 'Monogrammed heels', 'A203', 'B04'),
('VIP009', 1, '2024-03-20', '2024-10-01', 88000.00, 'Design Phase', 'Blue dial instead of meteorite', 'A101', 'B01'),
('VIP006', 2, '2024-01-05', '2024-05-20', 36000.00, 'In Production', 'Vintage brass locks', 'A100', 'B02');

INSERT INTO STOCK (Boutique_Code, Product_Reference, Stock_Quantity) VALUES
('B01', 'P101', 2),
('B01', 'P103', 15),
('B01', 'P107', 40),
('B02', 'P101', 1),
('B02', 'P106', 25),
('B02', 'P107', 30),
('B03', 'P102', 1),
('B03', 'P105', 3),
('B03', 'P108', 5),
('B04', 'P103', 20),
('B04', 'P104', 1),
('B04', 'P106', 15),
('B05', 'P105', 2),
('B05', 'P107', 50),
('B05', 'P108', 8);

INSERT INTO PURCHASE (VIP_Number, Product_Reference, Purchase_Date, Purchase_Quantity) VALUES
('VIP003', 'P103', '2024-02-14', 2),
('VIP004', 'P101', '2023-12-20', 1),
('VIP002', 'P105', '2024-01-05', 1),
('VIP001', 'P103', '2024-03-10', 3),
('VIP005', 'P102', '2023-11-15', 1),
('VIP006', 'P107', '2024-02-20', 5),
('VIP007', 'P106', '2024-01-22', 2),
('VIP008', 'P101', '2023-10-10', 1),
('VIP009', 'P108', '2024-03-05', 1),
('VIP010', 'P107', '2024-02-14', 3),
('VIP001', 'P107', '2024-01-05', 4),
('VIP002', 'P106', '2024-03-18', 1),
('VIP004', 'P104', '2023-11-25', 1),
('VIP005', 'P105', '2024-02-02', 2),
('VIP008', 'P103', '2024-03-12', 1),
('VIP003', 'P107', '2023-12-01', 2),
('VIP006', 'P108', '2024-01-30', 1),
('VIP007', 'P101', '2023-11-11', 1),
('VIP009', 'P106', '2024-02-28', 2),
('VIP010', 'P105', '2023-10-20', 1);
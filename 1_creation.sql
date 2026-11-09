-- 1_creation.sql
CREATE DATABASE luxury_fashion_db;
USE luxury_fashion_db;

CREATE TABLE BOUTIQUE (
    Boutique_Code VARCHAR(10) PRIMARY KEY,
    Boutique_Name VARCHAR(50) NOT NULL,
    Boutique_City VARCHAR(50),
    Boutique_Country VARCHAR(50),
    Prestige_Tier VARCHAR(20),
    Boutique_Phone VARCHAR(20)
);

CREATE TABLE ARTISAN (
    Artisan_ID VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Craft_Specialty VARCHAR(40),
    Hire_Date DATE,
    Years_Experience INT,
    Workshop_Location VARCHAR(50),
    Mentor_ID VARCHAR(10),
    Mentorship_Start_Date DATE,
    FOREIGN KEY (Mentor_ID) REFERENCES ARTISAN(Artisan_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE CLIENT_VIP (
    VIP_Number VARCHAR(15) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Preferred_Language VARCHAR(20),
    Spend_Tier VARCHAR(30)
);

CREATE TABLE LIMITED_PRODUCT (
    Product_Reference VARCHAR(15) PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(30),
    Material_Description VARCHAR(200),
    Production_Limit INT,
    Catalog_Price DECIMAL(10,2)
);

CREATE TABLE BESPOKE_ORDER (
    VIP_Number VARCHAR(15),
    Order_Sequential_Num INT,
    Order_Date DATE,
    Estimated_Date DATE,
    Final_Price DECIMAL(11,2),
    Production_Status VARCHAR(30),
    Client_Request_Notes VARCHAR(500),
    Artisan_ID VARCHAR(10) NOT NULL,
    Boutique_Code VARCHAR(10) NOT NULL,
    PRIMARY KEY (VIP_Number, Order_Sequential_Num),
    FOREIGN KEY (VIP_Number) REFERENCES CLIENT_VIP(VIP_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Artisan_ID) REFERENCES ARTISAN(Artisan_ID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Boutique_Code) REFERENCES BOUTIQUE(Boutique_Code) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE STOCK (
    Boutique_Code VARCHAR(10),
    Product_Reference VARCHAR(15),
    Stock_Quantity INT DEFAULT 0,
    PRIMARY KEY (Boutique_Code, Product_Reference),
    FOREIGN KEY (Boutique_Code) REFERENCES BOUTIQUE(Boutique_Code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_Reference) REFERENCES LIMITED_PRODUCT(Product_Reference) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PURCHASE (
    VIP_Number VARCHAR(15),
    Product_Reference VARCHAR(15),
    Purchase_Date DATE,
    Purchase_Quantity INT DEFAULT 1,
    PRIMARY KEY (VIP_Number, Product_Reference, Purchase_Date),
    FOREIGN KEY (VIP_Number) REFERENCES CLIENT_VIP(VIP_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_Reference) REFERENCES LIMITED_PRODUCT(Product_Reference) ON DELETE CASCADE ON UPDATE CASCADE
);
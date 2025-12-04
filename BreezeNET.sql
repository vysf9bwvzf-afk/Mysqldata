CREATE DATABASE IF NOT EXISTS BreezeNET;
USE BreezeNET;

CREATE TABLE Gast (
    GastID INT PRIMARY KEY AUTO_INCREMENT,
    Voornaam VARCHAR(50),
    Achternaam VARCHAR(50),
    Email VARCHAR(100),
    Telefoon VARCHAR(20),
    Leeftijd INT,
    IncheckDatum DATE,
    UitcheckDatum DATE,
    Verblijfs_type VARCHAR (100)
);

CREATE TABLE IF NOT EXISTS Activiteit

CREATE TABLE Activiteit (
    ActiviteitID INT PRIMARY KEY AUTO_INCREMENT,
    Naam VARCHAR(100),
    Type VARCHAR(50), -- show / workshop
    MaxCapaciteit INT,
    LeeftijdMin INT,
    LeeftijdMax INT,
    Prijs DECIMAL(8,2),
    LeeftijdToeslagPercentage DECIMAL(5,2) -- alleen bij bepaalde workshopleeftijden
);

CREATE TABLE Reservering (
    ReserveringID INT PRIMARY KEY AUTO_INCREMENT,
    GastID INT,
    ActiviteitID INT,
    AantalPersonen INT,
    TotaalPrijs DECIMAL(8,2),
    DatumReservering DATE,
    FOREIGN KEY (GastID) REFERENCES Gast(GastID),
    FOREIGN KEY (ActiviteitID) REFERENCES Activiteit(ActiviteitID)
);

CREATE TABLE Personeel (
    PersoneelID INT PRIMARY KEY AUTO_INCREMENT,
    Voornaam VARCHAR(50),
    Achternaam VARCHAR(50),
    Functie VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Onderhoudstaak (
    TaakID INT PRIMARY KEY AUTO_INCREMENT,
    Omschrijving VARCHAR(255),
    Prioriteit VARCHAR(20),
    Status VARCHAR(20),
    StartDatum DATE,
    EindDatum DATE,
    PersoneelID INT,
    FOREIGN KEY (PersoneelID) REFERENCES Personeel(PersoneelID)
);

CREATE TABLE IF NOT EXISTS Horeca (
    HorecaID INT AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(100) NOT NULL,
    Type VARCHAR(50),
    PrijsGemiddeld DECIMAL(8,2),
    PersoneelBezetting INT,
    GastVerzoeken TEXT,
    Openingstijd TIME,
    Sluitingstijd TIME
);

CREATE TABLE IF NOT EXISTS Reservering_Horeca (
    ReserveringHorecaID INT AUTO_INCREMENT PRIMARY KEY,
    ReserveringID INT NOT NULL,
    HorecaID INT NOT NULL,
    Aantal INT DEFAULT 1,
    Opmerkingen TEXT,
    FOREIGN KEY (ReserveringID) REFERENCES Reservering(ReserveringID),
    FOREIGN KEY (HorecaID) REFERENCES Horeca(HorecaID)
);

CREATE TABLE IF NOT EXISTS FinancieleRapportage (
    FinancieleRapportageID INT AUTO_INCREMENT PRIMARY KEY,
    PeriodeStart DATE NOT NULL,
    PeriodeEind DATE NOT NULL,
    Omzet DECIMAL(10,2),
    Kosten DECIMAL(10,2),
    Winst DECIMAL(10,2)
);

CREATE TABLE KPI (
    KPIID INT AUTO_INCREMENT PRIMARY KEY,   -- uniek ID voor elke KPI
    Naam VARCHAR(100),                      -- bijvoorbeeld "Aantal gasten", "Omzet per activiteit"
    Waarde DECIMAL(10,2),                   -- numerieke waarde van de KPI
    PersoneelID INT,                         -- verwijzing naar een medewerker (mag leeg zijn)
    Opmerkingen TEXT                         -- optioneel veld voor toelichting
);

SELECT * FROM gast;










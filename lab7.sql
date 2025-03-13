CREATE TABLE klienci (
    idklienta VARCHAR(10) PRIMARY KEY,
    hasło VARCHAR(10) NOT NULL CHECK (LENGTH(hasło) > 4),
    nazwa VARCHAR(40) NOT NULL,
    miasto VARCHAR(40) NOT NULL,
    kod CHAR(6) NOT NULL,
    adres VARCHAR(40) NOT NULL,
    email VARCHAR(40),
    telefon VARCHAR(16) NOT NULL,
    fax VARCHAR(16),
    nip CHAR(13),
    regon VARCHAR(9)
);

CREATE TABLE kompozycje (
    idkompozycji CHAR(5) PRIMARY KEY,
    nazwa VARCHAR(40) NOT NULL,
    opis VARCHAR(100),
    cena FLOAT(7,2) CHECK (cena >= 10.00),
    minimum INT,
    stan INT
);

CREATE TABLE odbiorcy (
    idodbiorcy SERIAL PRIMARY KEY,
    nazwa VARCHAR(40) NOT NULL,
    miasto VARCHAR(40) NOT NULL,
    kod CHAR(6) NOT NULL,
    adres VARCHAR(40) NOT NULL
);

CREATE TABLE zamowienia (
    idzamowienia INT PRIMARY KEY,
    idklienta VARCHAR(10) NOT NULL,
    idodbiorcy BIGINT UNSIGNED NOT NULL,
    idkompozycji CHAR(5) NOT NULL,
    termin DATE NOT NULL,
    cena FLOAT(7,2),
    zaplacone BOOLEAN,
    uwagi VARCHAR(200),
    FOREIGN KEY (idklienta) REFERENCES klienci(idklienta),
    FOREIGN KEY (idodbiorcy) REFERENCES odbiorcy(idodbiorcy),
    FOREIGN KEY (idkompozycji) REFERENCES kompozycje(idkompozycji)
);

CREATE TABLE zapotrzebowanie (
  idkompozycji CHAR(5) NOT NULL,
  sztuk INT DEFAULT 0,
  FOREIGN KEY (idkompozycji) REFERENCES kompozycje(idkompozycji)
);

INSERT INTO klienci (idklienta, hasło, nazwa, miasto, kod, adres, email, telefon, fax, nip, regon) VALUES
('KLI001', 'haslo123', 'Firma A', 'Warszawa', '00-001', 'Ul. Przykladowa 1', 'firmaA@example.com', '123456789', '987654321', '1234567890123', '123456789'),
('KLI002', 'haslo456', 'Firma B', 'Kraków', '30-001', 'Ul. Testowa 2', 'firmaB@example.com', '234567890', '876543210', '2345678901234', '987654321'),
('KLI003', 'haslo789', 'Firma C', 'Poznań', '60-001', 'Ul. Wzorcowa 3', 'firmaC@example.com', '345678901', '765432109', '3456789012345', '876543210'),
('KLI004', 'abc12345', 'Firma D', 'Gdańsk', '80-001', 'Ul. Przykład 4', 'firmaD@example.com', '456789012', '654321098', '4567890123456', '765432109'),
('KLI005', 'def12345', 'Firma E', 'Wrocław', '50-001', 'Ul. Przykładowa 5', 'firmaE@example.com', '567890123', '543210987', '5678901234567', '654321098'),
('KLI006', 'pass4567', 'Firma F', 'Łódź', '90-001', 'Ul. Wzorcowa 6', 'firmaF@example.com', '678901234', '432109876', '6789012345678', '543210987'),
('KLI007', 'word7890', 'Firma G', 'Szczecin', '70-001', 'Ul. Wzorcowa 7', 'firmaG@example.com', '789012345', '321098765', '7890123456789', '432109876'),
('KLI008', 'test1234', 'Firma H', 'Bydgoszcz', '85-001', 'Ul. Przykład 8', 'firmaH@example.com', '890123456', '210987654', '8901234567890', '321098765'),
('KLI009', 'login567', 'Firma I', 'Lublin', '20-001', 'Ul. Przykładowa 9', 'firmaI@example.com', '901234567', '109876543', '9012345678901', '210987654'),
('KLI010', 'qwerty12', 'Firma J', 'Katowice', '40-001', 'Ul. Przykład 10', 'firmaJ@example.com', '012345678', '987654321', '0123456789012', '109876543'),
('KLI011', 'secure45', 'Firma K', 'Białystok', '15-001', 'Ul. Wzorcowa 11', 'firmaK@example.com', '123456780', '876543210', '1234567801234', '987654321'),
('KLI012', 'strong90', 'Firma L', 'Olsztyn', '10-001', 'Ul. Przykład 12', 'firmaL@example.com', '234567891', '765432109', '2345678912345', '876543210'),
('KLI013', 'firmy567', 'Firma M', 'Opole', '45-001', 'Ul. Wzorcowa 13', 'firmaM@example.com', '345678912', '654321098', '3456789123456', '765432109'),
('KLI014', 'pass4321', 'Firma N', 'Gorzów', '66-001', 'Ul. Przykład 14', 'firmaN@example.com', '456789023', '543210987', '4567890234567', '654321098'),
('KLI015', 'key78901', 'Firma O', 'Rzeszów', '35-001', 'Ul. Przykładowa 15', 'firmaO@example.com', '567890234', '432109876', '5678902345678', '543210987'),
('KLI016', 'login321', 'Firma P', 'Zielona Góra', '65-001', 'Ul. Wzorcowa 16', 'firmaP@example.com', '678901245', '321098765', '6789012456789', '432109876'),
('KLI017', 'haslo777', 'Firma Q', 'Toruń', '87-001', 'Ul. Przykład 17', 'firmaQ@example.com', '789012356', '210987654', '7890123567890', '321098765'),
('KLI018', 'klucz123', 'Firma R', 'Kielce', '25-001', 'Ul. Wzorcowa 18', 'firmaR@example.com', '890123467', '109876543', '8901234678901', '210987654'),
('KLI019', 'pass5555', 'Firma S', 'Gliwice', '44-100', 'Ul. Przykładowa 19', 'firmaS@example.com', '901234578', '987654321', '9012345789012', '109876543'),
('KLI020', 'admin123', 'Firma T', 'Radom', '26-600', 'Ul. Wzorcowa 20', 'firmaT@example.com', '012345689', '876543210', '0123456890123', '987654321');

INSERT INTO kompozycje (idkompozycji, nazwa, opis, cena, minimum, stan) VALUES
('K001', 'Kompozycja A', 'Opis A', 20.50, 10, 50),
('K002', 'Kompozycja B', 'Opis B', 30.00, 5, 20),
('K003', 'Kompozycja C', 'Opis C', 45.00, 8, 12),
('K004', 'Kompozycja D', 'Opis D', 15.99, 6, 5),
('K005', 'Kompozycja E', 'Opis E', 100.00, 2, 8),
('K006', 'Kompozycja F', 'Opis F', 75.25, 3, 10),
('K007', 'Kompozycja G', 'Opis G', 50.00, 10, 20),
('K008', 'Kompozycja H', 'Opis H', 25.99, 4, 15),
('K009', 'Kompozycja I', 'Opis I', 35.75, 6, 22),
('K010', 'Kompozycja J', 'Opis J', 90.00, 3, 18),
('K011', 'Kompozycja K', 'Opis K', 60.00, 7, 25),
('K012', 'Kompozycja L', 'Opis L', 40.00, 8, 12),
('K013', 'Kompozycja M', 'Opis M', 55.00, 5, 30),
('K014', 'Kompozycja N', 'Opis N', 20.00, 2, 50),
('K015', 'Kompozycja O', 'Opis O', 65.00, 9, 5),
('K016', 'Kompozycja P', 'Opis P', 80.00, 4, 10),
('K017', 'Kompozycja Q', 'Opis Q', 33.00, 6, 8),
('K018', 'Kompozycja R', 'Opis R', 70.50, 7, 15),
('K019', 'Kompozycja S', 'Opis S', 95.99, 8, 3),
('K020', 'Kompozycja T', 'Opis T', 28.50, 10, 2);

INSERT INTO odbiorcy (nazwa, miasto, kod, adres) VALUES
('Odbiorca A', 'Warszawa', '01-001', 'Ul. Przykładowa 10'),
('Odbiorca B', 'Kraków', '31-001', 'Ul. Testowa 12'),
('Odbiorca C', 'Gdańsk', '81-001', 'Ul. Przykładowa 14'),
('Odbiorca D', 'Wrocław', '51-001', 'Ul. Wzorcowa 16'),
('Odbiorca E', 'Poznań', '61-001', 'Ul. Przykład 18'),
('Odbiorca F', 'Łódź', '91-001', 'Ul. Przykładowa 20'),
('Odbiorca G', 'Szczecin', '71-001', 'Ul. Wzorcowa 22'),
('Odbiorca H', 'Bydgoszcz', '86-001', 'Ul. Przykład 24'),
('Odbiorca I', 'Lublin', '20-400', 'Ul. Testowa 26'),
('Odbiorca J', 'Katowice', '40-999', 'Ul. Wzorcowa 28'),
('Odbiorca K', 'Białystok', '15-555', 'Ul. Przykładowa 30'),
('Odbiorca L', 'Olsztyn', '10-100', 'Ul. Wzorcowa 32'),
('Odbiorca M', 'Opole', '46-200', 'Ul. Przykład 34'),
('Odbiorca N', 'Gorzów', '66-300', 'Ul. Testowa 36'),
('Odbiorca O', 'Rzeszów', '35-678', 'Ul. Wzorcowa 38'),
('Odbiorca P', 'Zielona Góra', '65-789', 'Ul. Przykładowa 40'),
('Odbiorca Q', 'Toruń', '87-111', 'Ul. Przykład 42'),
('Odbiorca R', 'Kielce', '25-333', 'Ul. Wzorcowa 44'),
('Odbiorca S', 'Gliwice', '44-444', 'Ul. Przykładowa 46'),
('Odbiorca T', 'Radom', '26-600', 'Ul. Wzorcowa 48');

INSERT INTO zamowienia (idzamowienia, idklienta, idodbiorcy, idkompozycji, termin, cena, zaplacone, uwagi) VALUES
(1, 'KLI001', 1, 'K001', '2024-11-01', 100.00, TRUE, 'Pierwsze zamówienie'),
(2, 'KLI002', 2, 'K002', '2024-11-02', 150.50, FALSE, 'Uwagi dotyczące zamówienia'),
(3, 'KLI003', 3, 'K003', '2024-11-03', 200.75, TRUE, NULL),
(4, 'KLI004', 4, 'K004', '2024-11-04', 99.99, TRUE, 'Dodatkowe informacje'),
(5, 'KLI005', 5, 'K005', '2024-11-05', 175.00, FALSE, 'Pilne zamówienie'),
(6, 'KLI006', 6, 'K006', '2024-11-06', 125.00, TRUE, 'Zamówienie z rabatem'),
(7, 'KLI007', 7, 'K007', '2024-11-07', 95.50, TRUE, NULL),
(8, 'KLI008', 8, 'K008', '2024-11-08', 80.00, FALSE, 'Częściowo zapłacone'),
(9, 'KLI009', 9, 'K009', '2024-11-09', 140.75, TRUE, 'Wysyłka priorytetowa'),
(10, 'KLI010', 10, 'K010', '2024-11-10', 180.00, TRUE, 'Bez uwag'),
(11, 'KLI011', 11, 'K011', '2024-11-11', 130.00, FALSE, 'W oczekiwaniu na potwierdzenie'),
(12, 'KLI012', 12, 'K012', '2024-11-12', 110.25, TRUE, 'Zamówienie grupowe'),
(13, 'KLI013', 13, 'K013', '2024-11-13', 60.00, TRUE, 'Szybka dostawa'),
(14, 'KLI014', 14, 'K014', '2024-11-14', 95.00, FALSE, NULL),
(15, 'KLI015', 15, 'K015', '2024-11-15', 150.50, TRUE, 'Bezpośrednia dostawa'),
(16, 'KLI016', 16, 'K016', '2024-11-16', 85.75, FALSE, 'Na fakturze VAT'),
(17, 'KLI017', 17, 'K017', '2024-11-17', 115.99, TRUE, 'Dostawa kurierem'),
(18, 'KLI018', 18, 'K018', '2024-11-18', 205.00, TRUE, 'Pilna wysyłka'),
(19, 'KLI019', 19, 'K019', '2024-11-19', 75.00, FALSE, 'Oczekuje na decyzję'),
(20, 'KLI020', 20, 'K020', '2024-11-20', 190.50, TRUE, 'Zamówienie ekspresowe');

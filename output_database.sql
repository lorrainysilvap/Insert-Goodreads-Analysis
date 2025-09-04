-- Tabela DimAuthor (Autor)
CREATE TABLE DimAuthor (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255)
);

-- Tabela DimGenre (Gênero)
CREATE TABLE DimGenre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255)
);

-- Tabela DimDate (Data)
CREATE TABLE DimDate (
    date_id INT PRIMARY KEY, 
    date DATE,
    year INT,
    month INT,
    day INT
);

-- Tabela DimPlatform (Plataforma)
CREATE TABLE DimPlatform (
    platform_id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(255)
);

-- Tabela DimUser (Usuário)
CREATE TABLE DimUser (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    reviewer_id VARCHAR(50)
);

-- Tabela DimLocale (Localidade/Idioma)
CREATE TABLE DimLocale (
    locale_key INT AUTO_INCREMENT PRIMARY KEY,
    country_code VARCHAR(10),
    language_code VARCHAR(10),
    country_name VARCHAR(100),
    language_name VARCHAR(100)
);

-- Tabela DimBook (Livro)
CREATE TABLE DimBook (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    asin VARCHAR(20),
    title VARCHAR(500)
);

-- Tabela DimPublisher (Editora)
CREATE TABLE DimPublisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255),
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES DimBook(book_id)
);

-- Tabela DimSeries (Série)
CREATE TABLE DimSeries (
    series_id INT AUTO_INCREMENT PRIMARY KEY,
    series_name VARCHAR(255),
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES DimBook(book_id)
);

-- Tabela BookAuthor (Ponte Livro-Autor)
CREATE TABLE BookAuthor (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    FOREIGN KEY (author_id) REFERENCES DimAuthor(author_id)
);

-- Tabela BookGenre (Ponte Livro-Gênero)
CREATE TABLE BookGenre (
    book_id INT,
    genre_id INT,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    FOREIGN KEY (genre_id) REFERENCES DimGenre(genre_id)
);

-- Tabela FactReview (Review)
CREATE TABLE FactReview (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    date_id INT,
    platform_id INT,
    language_id INT,
    publisher_id INT,
    series_id INT,
    rating FLOAT,
    review_text_len INT,
    helpful_votes INT,
    total_votes INT,
    FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    FOREIGN KEY (user_id) REFERENCES DimUser(user_id),
    FOREIGN KEY (date_id) REFERENCES DimDate(date_id),
    FOREIGN KEY (platform_id) REFERENCES DimPlatform(platform_id),
    FOREIGN KEY (language_id) REFERENCES DimLocale(locale_key),
    FOREIGN KEY (publisher_id) REFERENCES DimPublisher(publisher_id),
    FOREIGN KEY (series_id) REFERENCES DimSeries(series_id)
);
USE BooksAmazon

CREATE TABLE DimDate (
    date_key INT IDENTITY,
    date DATE NOT NULL,
    year INT NOT NULL,
    quarter INT,
    month INT NOT NULL,
    day INT NOT NULL,   

    CONSTRAINT PK_DimDate PRIMARY KEY (date_key)
)

CREATE TABLE DimPlatform (
    platform_id INT IDENTITY,
    platform_name NVARCHAR(100) NOT NULL,  

    CONSTRAINT PK_DimPlatform PRIMARY KEY (platform_id)
)

CREATE TABLE DimAuthor (  
    author_id INT IDENTITY,
    author_name NVARCHAR(500) NOT NULL,

    CONSTRAINT PK_DimAuthor PRIMARY KEY (author_id)
)

CREATE TABLE DimBook (
    book_id INT IDENTITY,
    asin NVARCHAR(50) NOT NULL,
    title NVARCHAR(600) NOT NULL,
    subtitle NVARCHAR(1000),
    price DECIMAL(10,2),

    CONSTRAINT PK_DimBook PRIMARY KEY (book_id)
)

CREATE TABLE BookAuthor (
    book_id INT NOT NULL,
    author_id INT NOT NULL,

    CONSTRAINT PK_BookAuthor PRIMARY KEY (book_id, author_id),
    CONSTRAINT FK_BookAuthor_Book FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    CONSTRAINT FK_BookAuthor_Author FOREIGN KEY (author_id) REFERENCES DimAuthor(author_id)
)

CREATE TABLE FactReview (
    review_id INT IDENTITY,
    book_id INT NOT NULL,
    date_key INT NOT NULL,
    platform_id INT NOT NULL,
    rating DECIMAL(3,2) NOT NULL,
    rating_number INT,
        
    CONSTRAINT PK_FactReview PRIMARY KEY (review_id),
    CONSTRAINT FK_FactReview_Book FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    CONSTRAINT FK_FactReview_Date FOREIGN KEY (date_key) REFERENCES DimDate(date_key),
    CONSTRAINT FK_FactReview_Platform FOREIGN KEY (platform_id) REFERENCES DimPlatform(platform_id)
)

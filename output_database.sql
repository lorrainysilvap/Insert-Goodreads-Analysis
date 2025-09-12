use BooksAmazon


CREATE TABLE DimDate (

    date_key INT IDENTITY,
    date DATE NOT NULL,
    year INT NOT NULL,
    quarter INT,
    month INT NOT NULL,
    day INT NOT NULL,   

    CONSTRAINT PK_DimDate PRIMARY KEY (date_key)

)

CREATE TABLE DimLocale (
    locale_key INT IDENTITY,
    country_code NVARCHAR(10),
    language_code NVARCHAR(10),
    country_name NVARCHAR(100),
    language_name NVARCHAR(100),

    CONSTRAINT PK_DimLocale PRIMARY KEY (locale_key)

    )

    
CREATE TABLE DimPlatform (
    platform_id INT IDENTITY,
    platform_name NVARCHAR(100) NOT NULL,  

    CONSTRAINT PK_DimPlatform PRIMARY KEY (platform_id)
)



CREATE TABLE DimAuthor (  
    author_id INT IDENTITY,
    author_name NVARCHAR(255) NOT NULL,

    CONSTRAINT PK_DimAuthor PRIMARY KEY (author_id)
)

CREATE TABLE DimBook (

    book_id INT IDENTITY,
    asin NVARCHAR(20) NOT NULL,
    title NVARCHAR(500) NOT NULL,

    CONSTRAINT PK_DimBook PRIMARY KEY (book_id)

)

CREATE TABLE DimGenre (
    genre_id INT IDENTITY,
    genre_name NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_DimGenre PRIMARY KEY (genre_id)
)


CREATE TABLE BookAuthor (

    book_id INT NOT NULL,
    author_id INT NOT NULL,

    CONSTRAINT PK_BookAuthor PRIMARY KEY (book_id, author_id),
    CONSTRAINT FK_BookAuthor_Book FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    CONSTRAINT FK_BookAuthor_Author FOREIGN KEY (author_id) REFERENCES DimAuthor(author_id)
)

CREATE TABLE DimPublisher (

    publisher_id INT IDENTITY,
    publisher_name NVARCHAR(255) NOT NULL,
    book_id INT NOT NULL,  

    CONSTRAINT PK_DimPublisher PRIMARY KEY (publisher_id),
    CONSTRAINT FK_Book FOREIGN KEY (book_id) REFERENCES DimBook(book_id) 
)


CREATE TABLE DimSeries (

    series_id INT IDENTITY,
    series_name NVARCHAR(255) NOT NULL,
    book_id INT NOT NULL,


    CONSTRAINT PK_DimSeries PRIMARY KEY (series_id),
    CONSTRAINT FK_Book_Series FOREIGN KEY (book_id) REFERENCES DimBook(book_id)
)


CREATE TABLE BookGenre (

    book_id INT NOT NULL,
    genre_id INT NOT NULL,

    CONSTRAINT PK_BookGenre PRIMARY KEY (book_id, genre_id),
    CONSTRAINT FK_BookGenre_Book FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    CONSTRAINT FK_BookGenre_Genre FOREIGN KEY (genre_id) REFERENCES DimGenre(genre_id)

)


CREATE TABLE DimUser (

    user_id INT IDENTITY,
    user_name NVARCHAR(100),

    CONSTRAINT PK_DimUser PRIMARY KEY (user_id)  
)


CREATE TABLE FactReview (

    review_id INT IDENTITY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    date_key INT NOT NULL,
    platform_id INT NOT NULL,
    locale_key INT NOT NULL,
    publisher_id INT NOT NULL,
    series_id INT NOT NULL,
    rating INT NOT NULL,
    review_text_len INT,
    helpful_votes INT,
    total_votes INT,

    CONSTRAINT PK_FactReview PRIMARY KEY (review_id),
    CONSTRAINT FK_FactReview_Book FOREIGN KEY (book_id) REFERENCES DimBook(book_id),
    CONSTRAINT FK_FactReview_User FOREIGN KEY (user_id) REFERENCES DimUser(user_id),
    CONSTRAINT FK_FactReview_Date FOREIGN KEY (date_key) REFERENCES DimDate(date_key),
    CONSTRAINT FK_FactReview_Platform FOREIGN KEY (platform_id) REFERENCES DimPlatform(platform_id),
    CONSTRAINT FK_FactReview_Locale FOREIGN KEY (locale_key) REFERENCES DimLocale(locale_key),
    CONSTRAINT FK_FactReview_Publisher FOREIGN KEY (publisher_id) REFERENCES DimPublisher(publisher_id),
    CONSTRAINT FK_FactReview_Series FOREIGN KEY (series_id) REFERENCES DimSeries(series_id)
)


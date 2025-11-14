USE BooksAmazon;
GO

-- 1. Inserir na DimBook
INSERT INTO DimBook (asin, title, subtitle, price)
SELECT DISTINCT 
    NULLIF(parent_asin, ''),
    COALESCE(NULLIF(title, ''), 'Unknown Title'),
    NULLIF(subtitle, ''),
    price
FROM livros
WHERE NULLIF(parent_asin, '') IS NOT NULL;

-- 2. Inserir na DimAuthor
INSERT INTO DimAuthor (author_name)
SELECT DISTINCT 
    NULLIF(author_name, '')
FROM livros
WHERE NULLIF(author_name, '') IS NOT NULL;

-- 3. Criar relação BookAuthor
INSERT INTO BookAuthor (book_id, author_id)
SELECT DISTINCT 
    b.book_id,
    a.author_id
FROM livros l
INNER JOIN DimBook b ON l.parent_asin = b.asin
INNER JOIN DimAuthor a ON l.author_name = a.author_name
WHERE b.book_id IS NOT NULL AND a.author_id IS NOT NULL;

-- 4. Inserir na DimPlatform
INSERT INTO DimPlatform (platform_name)
SELECT DISTINCT 
    NULLIF(main_category, '')
FROM livros
WHERE NULLIF(main_category, '') IS NOT NULL;

-- 5. Inserir na DimDate
INSERT INTO DimDate (date, year, quarter, month, day)
SELECT DISTINCT
    data_lancamento,
    YEAR(data_lancamento),
    DATEPART(QUARTER, data_lancamento),
    MONTH(data_lancamento),
    DAY(data_lancamento)
FROM livros
WHERE data_lancamento IS NOT NULL;

-- 6. Inserir na FactReview
INSERT INTO FactReview (
    book_id, 
    date_key, 
    platform_id, 
    rating,
    rating_number
)
SELECT 
    b.book_id,
    COALESCE(d.date_key, (SELECT TOP 1 date_key FROM DimDate ORDER BY date_key)) as date_key,
    COALESCE(p.platform_id, (SELECT TOP 1 platform_id FROM DimPlatform)) as platform_id,
    average_rating,
    rating_number
FROM livros l
INNER JOIN DimBook b ON l.parent_asin = b.asin
LEFT JOIN DimDate d ON l.data_lancamento = d.date
LEFT JOIN DimPlatform p ON l.main_category = p.platform_name
WHERE l.average_rating IS NOT NULL;
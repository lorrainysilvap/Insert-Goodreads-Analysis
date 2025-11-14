USE BooksAmazon;
GO

-- 1. Criar tabela temporária
CREATE TABLE #temp_json (json_data NVARCHAR(MAX))

-- 2. Fazer BULK INSERT do arquivo
BULK INSERT #temp_json
-- ATENÇÃO: Verifique o caminho do arquivo
FROM 'C:\Users\cleyt\Downloads\meta_Books\meta_Books_1m.jsonl'
WITH (
    ROWTERMINATOR = '0x0a',  -- Fim de linha para JSONL
    DATAFILETYPE = 'char',
    CODEPAGE = '65001'       -- UTF-8 encoding
)

-- 3. Verificar os primeiros registros e contar total
SELECT TOP 3 * FROM #temp_json
SELECT COUNT(*) AS total_registros FROM #temp_json

-- 4. Criar tabela final para os livros
DROP TABLE IF EXISTS livros;

CREATE TABLE livros (
    id INT IDENTITY(1,1) PRIMARY KEY,
    main_category NVARCHAR(100),
    title NVARCHAR(600),
    subtitle NVARCHAR(1000),
    author_name NVARCHAR(500),
    average_rating DECIMAL(3,2),
    rating_number INT,
    price DECIMAL(10,2),
    publisher NVARCHAR(500),
    language NVARCHAR(100),
    isbn_10 NVARCHAR(20),
    isbn_13 NVARCHAR(20),
    pages INT,
    parent_asin NVARCHAR(50),
    data_lancamento DATE,
    data_carregamento DATETIME DEFAULT GETDATE()
);

-- 5. Inserir dados COM TRATAMENTO DE ERROS
INSERT INTO livros (
    main_category, 
    title, 
    subtitle, 
    author_name, 
    average_rating, 
    rating_number, 
    price, 
    parent_asin, 
    data_lancamento
)
SELECT 
    NULLIF(JSON_VALUE(json_data, '$.main_category'), ''),
    NULLIF(JSON_VALUE(json_data, '$.title'), ''),
    NULLIF(JSON_VALUE(json_data, '$.subtitle'), ''),
    NULLIF(JSON_VALUE(json_data, '$.author.name'), ''),
    CASE 
        WHEN ISNUMERIC(JSON_VALUE(json_data, '$.average_rating')) = 1 
        THEN TRY_CAST(JSON_VALUE(json_data, '$.average_rating') AS DECIMAL(3,2))
        ELSE NULL 
    END,
    CASE 
        WHEN ISNUMERIC(JSON_VALUE(json_data, '$.rating_number')) = 1 
        THEN TRY_CAST(JSON_VALUE(json_data, '$.rating_number') AS INT)
        ELSE NULL 
    END,
    CASE 
        WHEN ISNUMERIC(JSON_VALUE(json_data, '$.price')) = 1 
        THEN TRY_CAST(JSON_VALUE(json_data, '$.price') AS DECIMAL(10,2))
        ELSE NULL 
    END,
    NULLIF(JSON_VALUE(json_data, '$.parent_asin'), ''),
    CASE 
        WHEN ISDATE(JSON_VALUE(json_data, '$.date')) = 1 
        THEN TRY_CAST(JSON_VALUE(json_data, '$.date') AS DATE)
        ELSE NULL 
    END
FROM #temp_json
WHERE ISJSON(json_data) = 1;

-- 6. Ver resultados e estatísticas
-- Estatísticas
SELECT 
    COUNT(*) AS total_livros,
    COUNT(data_lancamento) AS livros_com_data,
    COUNT(*) - COUNT(data_lancamento) AS livros_sem_data,
    AVG(average_rating) AS media_avaliacao,
    SUM(rating_number) AS total_avaliacoes
FROM livros;

-- 7. Limpeza
-- DROP TABLE #temp_json
-- DROP database livros
import pandas as pd
import sqlite3

# URL do CSV no GitHub (substitua pelo link direto do arquivo raw)
# Exemplo: https://raw.githubusercontent.com/usuario/repositorio/branch/nome_do_arquivo.csv
url = 'https://github.com/Burufrinhani/Insert-Goodreads-Analysis.git'

# Leia o arquivo CSV diretamente da URL
df = pd.read_csv('books.csv', chunksize=10000, on_bad_lines='skip', encoding='utf-8' )

# Crie uma conexão com um banco de dados SQLite
conn = sqlite3.connect('output_database.db')

# Salve os dados do DataFrame no banco de dados como uma tabela
df.to_sql('table_name', conn, if_exists='replace', index=False)

import pandas as pd
try:
    df = pd.read_csv('caminho_do_seu_arquivo.csv')
    print(df.head())
except Exception as e:
    print(f"Erro: {e}")

# Feche a conexão
conn.close()

print("Arquivo SQL gerado com sucesso!")
# 📚 Análise de Dados de reviews da Amazon - Books

Este repositório armazena o projeto de análise de dados sobre literatura, parte da disciplina de Modelagem de Banco de Dados II, do curso de Ciência da Computação 6º semestre.  
Estamos utilizando um conjunto de dados do **Goodreads**, extraído através do Kaggle. O objetivo principal da análise é explorar tendências e padrões no comportamento de leitores e no desempenho de livros ao longo do tempo.

---

## 📖 Índice

1. [Objetivo](#objetivo)
2. [Planejamento](#planejamento)  
3. [Fonte dos Dados](#fonte-dos-dados)  
4. [Estrutura do Repositório](#estrutura-do-repositorio)
5. [Análise de Dados](#analise-de-dados)
6. [Modelo Lógico](#modelo-logico)
7. [Guia para importar o Backup](#guia-backup)

---

<h2 id="objetivo">📍 Objetivo</h2>

O objetivo deste projeto é analisar os dados de avaliações de livros na Amazon, buscando identificar padrões e tendências no comportamento dos leitores, no desempenho de diferentes obras e editoras, e nas variações de popularidade ao longo do tempo. A partir dessa análise, pretende-se extrair insights relevantes que possam contribuir para a compreensão do mercado literário e do engajamento dos usuários com os livros.

---

<h2 id="planejamento">🗓️ Planejamento</h2>

* **Planner do projeto:** [Trello](https://trello.com/b/glsrUTGu)
* **Plano Análise de Dados:** [Notion](https://www.notion.so/An-lise-de-Dados-de-Reviews-da-Amazon-Books-2602e007d63e809ba953ccd10c330932?source=copy_link)

---

<h2 id="fonte-dos-dados">🔗 Fonte dos Dados</h2>

Este projeto utiliza o dataset **Amazon Product Reviews – Books**, que contém milhões de avaliações de livros feitas por usuários na plataforma Amazon.

* [Amazon Product Reviews - Books](https://cseweb.ucsd.edu/~jmcauley/datasets.html)
* [Dicionário de Dados](https://www.notion.so/Dicion-rio-de-dados-2612e007d63e80dfbed5ec4966221406?source=copy_link)
  - **Conteúdo:** Cada registro possui informações sobre o livro e a avaliação do usuário.  
    🔹 Avaliações  
    🔹 Metadados dos Livros
    
Para acessar o dataset, abra o link, vá até o Amazon Product Reviews, clique no link Amazon Reviews 2023, e vá até o *Grouped by category* lá estará o dataset Books.

---

<h2 id="estrutura-do-repositorio">📂 Estrutura do Repositório</h2>

* `data/`: Pasta contendo os arquivos CSV do dataset baixado do Kaggle.  
* `README.md`: Este arquivo, que fornece uma visão geral do projeto.
* `books.csv`: CSV manipulado no projeto.
* `output_database.sql`: Construção do Banco de Dados e tabelas.
---

<h2 id="analise-de-dados">📈 Plano análise de Dados</h2>

O projeto busca responder as seguintes perguntas:  

1. Quais os livros mais vendidos?  
2. A nota média de um livro tende a cair após picos de reviews?  
3. Quais livros têm o melhor custo-benefício alta avaliação e preço acessível?
4. Existe diferença de preço entre livros mais antigos e mais recentes?
5. Os livros mais caros têm avaliações mais altas?
6. Quais autores têm as avaliações médias mais altas?
7. Há um aumento no número de lançamentos de livros ao longo dos anos?
8. Quais autores se destacam por terem vários livros bem avaliados?
9. Quais autores possuem os livros mais caros e mais baratos?
10. Os livros lançados recentemente têm mais avaliações do que os antigos?

Detalhes no documento:[Plano Análise de Dados](https://www.notion.so/An-lise-de-Dados-de-Reviews-da-Amazon-Books-2602e007d63e809ba953ccd10c330932?source=copy_link)

---

<h2 id="modelo-logico">💡 Modelo Lógico</h2>

[LucidChart](https://lucid.app/lucidchart/eaafedb9-63a4-4c84-92d0-54e4cdd57607/edit?viewport_loc=-486%2C226%2C3586%2C1475%2CHWEp-vi-RSFO&invitationId=inv_5f967cc8-8434-4b09-8b63-84c4b0b0844b)

<img width="2349" height="1727" alt="Diagrama reviews da Amazon" src="https://github.com/user-attachments/assets/4cbaa004-51d8-4da8-a7b4-04c12139961f" />

<h2 id="#guia-backup"> ☁️ Guia para importar o Backup</h2>

Este guia tem como objetivo explicar como rodar o banco de dados através do Backup local - em sua máquina

---

1️⃣ Criando a tabela no SQL Server
   Com o SQL execute o script que criará o banco BooksAmazon:
   
   ->[`CreateDatabase.sql`](https://github.com/user-attachments/files/23477165/CreateDatabase.sql)

2️⃣Certifique-se que o banco foi criado olhando na lateral superior esquerda. É importante que ele esteja selecionado, pois os próximos passos deverão ser executados dentro dele.

<p align="left">
<img width="369" height="270" alt="image" src="https://github.com/user-attachments/assets/056bc900-4141-42c0-a404-c183b887dc71" />


3️⃣ Execute o Script para criar as tabelas do banco:

   ->[`CreateTable.sql`](https://github.com/Burufrinhani/Insert-Goodreads-Analysis/blob/main/output_database.sql)

4️⃣ Neste passo, já temos o banco e as tabelas criadas, agora é necessário realizar o download do Backup:

   ->[`BooksAmazon.bak`](https://drive.google.com/file/d/1nKocZ_g4kVYrME2PGfv-jrv_1FSP9Ic2/view?usp=sharing)
   Realizado o download, armazene em uma pasta local de sua preferência.
   
5️⃣

6️⃣ 


* [1 milhão de registros](https://drive.google.com/file/d/1wr6Ia_pog0gdKnVEynYZDLNG6eorrE9e/view?usp=sharing)
* [Backup .bak](https://drive.google.com/file/d/1nKocZ_g4kVYrME2PGfv-jrv_1FSP9Ic2/view?usp=sharing)


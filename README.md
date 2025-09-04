# 📚 Análise de Dados de reviews da Amazon - Books

Este repositório armazena o projeto de análise de dados sobre literatura, parte da disciplina de Modelagem de Banco de Dados II, do curso de Ciência da Computação 6º semestre.  
Estamos utilizando um conjunto de dados do **Goodreads**, extraído através do Kaggle. O objetivo principal da análise é explorar tendências e padrões no comportamento de leitores e no desempenho de livros ao longo do tempo.

---

## 📖 Índice

1. [Objetivo](#objetivo)
2. [Planejamento](#planejamento)  
3. [Fonte dos Dados](#fonte-dos-dados)  
4. [Estrutura do Repositório](#estrutura-do-repositorio)
5. [Dicionário de Dados](#Dicionário-de-dados).
6. [Análise de Dados](#analise-de-dados)
7. [Modelo Lógico](#modelo-logico)
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
  - **Conteúdo:** Cada registro possui informações sobre o livro e a avaliação do usuário.  
    🔹 Avaliações  
    🔹 Metadados dos Livros
    
Para acessar o dataset, abra o link, vá até o Amazon Product Reviews, clique no link Amazon Reviews 2023, e vá até o *Grouped by category* lá estará o dataset Books.

---

<h2 id="estrutura-do-repositorio">📂 Estrutura do Repositório</h2>

* `data/`: Pasta contendo os arquivos CSV do dataset baixado do Kaggle.  
* `README.md`: Este arquivo, que fornece uma visão geral do projeto.

---

**Dicionário de Dados**

https://protect.checkpoint.com/v2/r02/___https://www.notion.so/Dicion-rio-de-dados-2612e007d63e80dfbed5ec4966221406?source=copy_link___.YzJlOnRlbGVmb25pY2FicmF6aWw6YzpvOmRiMTg1Y2E2YzJmOTdmOGM1YzFiYWY5MGExNTM0NmIwOjc6NDMwODphZDZiMzZkNWQxZTQzZGNmYzFmZTgwYWFkYzBkNjM0N2U1ZjRlN2I1OWJhY2FjYjc4NTBkMmYyYmE2Y2MyNGFlOmg6VDpG

---

<h2 id="plano-analise-de-dados">📈 Plano análise de Dados</h2>

O projeto busca responder as seguintes perguntas:  

1. Quais livros tiveram o maior crescimento no número de avaliações no último trimestre e ano?  
2. A nota média de um livro tende a cair após picos de reviews?  
3. Quais editoras têm o melhor desempenho por gênero em termos de nota média e volume de avaliações?
4. Quais gêneros literários tendem a receber as melhores avaliações?
5. Quais autores têm as avaliações médias mais altas?
   
---

**Material completo**  
Acesse todas as perguntas detalhadas no documento: [Plano Análise de Dados](https://www.notion.so/An-lise-de-Dados-de-Reviews-da-Amazon-Books-2602e007d63e809ba953ccd10c330932?source=copy_link)

---

**Modelo Lógico**

<img width="461" height="281" alt="image" src="https://github.com/user-attachments/assets/c0468068-6437-4a1f-8d45-f4b547e614d2" />


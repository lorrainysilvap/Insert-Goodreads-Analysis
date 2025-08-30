# 📚 Análise de Dados de reviews do Goodreads

Este repositório armazena o projeto de análise de dados sobre literatura, parte da disciplina de Modelagem de Banco de Dados II, do curso de Ciência da Computação 6º semestre.
Estamos utilizando um conjunto de dados do **Goodreads**, extraido através do Kaggle. O objetivo principal da análise é explorar tendências e padrões no comportamento de leitores e no desempenho de livros ao longo do tempo.

---

## 📖 Índice

1.  [Planejamento](#️-planejamento)
2.  [Fontes de Dados](#-fontes-de-dados)
3.  [Estrutura do repositório](#-estrutura-do-repositório)
4.  [Objetivo](#-objetivo)
   
---

### 🗓️Planejamento

* **Planner do projeto:** [Trello](https://trello.com/b/glsrUTGu)
---

### 🔗 Fonte dos Dados

O dataset utilizado para esta análise foi o **Goodreads-books** disponível na plataforma Kaggle. Ele contém informações detalhadas sobre livros, autores, editoras e avaliações feitas por usuários.

* [Kaggle](https://www.kaggle.com/datasets/jealousleopard/goodreadsbooks)
 **Conteúdo:** Inclui arquivos CSV com informações de livros, reviews e notas.
  
* bookID	Identificador único do livro
* title	→ Título da obra
* authors →	Nome(s) do(s) autor(es), múltiplos separados por /
* average_rating	→ Avaliação média do livro (0 a 5 estrelas)
* isbn / isbn13 →	Código de identificação padrão e atualizado do livro
* language_code →	Código do idioma da publicação (ex.: eng)
* num_pages →	Número de páginas
* ratings_count →	Total de avaliações (número de estrelas) recebidas
* text_reviews_count →	Quantidade de resenhas escritas pelos usuários
* publication_date →	Data de publicação
* publisher →	Nome da editora
  
* [Amazon Product Reviews - Books](https://cseweb.ucsd.edu/~jmcauley/datasets.html).
 **Conteúdo:** Cada registro possui informações sobre o livro e a avaliação do usuário:
  
* reviewerID → ID único do usuário
* reviewerName → Nome do avaliador
* asin → ID único do produto (livro)
* reviewText → Texto completo da avaliação
* summary → Resumo ou título da avaliação
* overall → Nota dada (1 a 5 estrelas)
* helpful → Votos de utilidade [x, y] (x = votos úteis, y = total de votos)
* unixReviewTime → Data em timestamp Unix
* reviewTime → Data legível (ex.: 07 3, 2012)
* title → Título do livro
* price → Preço
* publisher → Editora
* categories → Lista de categorias/subcategorias
* salesRank → Ranking de vendas
* related → Livros relacionados (ex.: “comprados juntos”)

---

### 🗂️ Estrutura do Repositório

* `data/`: Pasta contendo os arquivos CSV do dataset baixado do Kaggle.
* `README.md`: Este arquivo, que fornece uma visão geral do projeto.

---

### 📍Objetivo
O projeto busca responder as seguintes perguntas:
*  **Crescimento de Reviews:** Quais livros tiveram o maior crescimento no número de avaliações no último trimestre e ano?
*  **Efeito Hype/Fadiga:** A nota média de um livro tende a cair após picos de reviews? (Investigação sobre o "efeito hype").
*  **Desempenho por Editora:** Quais editoras têm o melhor desempenho por gênero em termos de nota média e volume de avaliações?

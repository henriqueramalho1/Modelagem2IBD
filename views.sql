DROP VIEW IF EXISTS article_keywords;
DROP VIEW IF EXISTS all_collection_articles;
DROP VIEW IF EXISTS article_authors;
DROP VIEW IF EXISTS number_of_article_quotes;
DROP VIEW IF EXISTS number_of_author_quotes;
DROP VIEW IF EXISTS keyword_uses;
DROP VIEW IF EXISTS all_articles_quotes;
DROP VIEW IF EXISTS quotes_texts;

CREATE VIEW article_keywords AS
    (SELECT 
        word, article_id
    FROM
        article
            JOIN
        article_keyword USING (article_id)
            JOIN
        keyword USING (keyword_id));

CREATE VIEW all_collection_articles AS
    (SELECT 
        collection_id,
        collection.type AS collection_type,
        article_id,
        title,
        page_num,
        article.type AS article_type,
        abstract
    FROM
        article
            JOIN
        article_collection USING (article_id)
            JOIN
        collection USING (collection_id));
        
CREATE VIEW article_authors AS
    (SELECT 
        article_id, author.*
    FROM
        article
            JOIN
        article_author USING (article_id)
            JOIN
        author USING (author_id));
        
CREATE VIEW number_of_article_quotes AS
    (SELECT 
        cited_article_id, COUNT(quote_id) AS number_of_quotes
    FROM
        quote
    GROUP BY cited_article_id);
    
CREATE VIEW number_of_author_quotes AS
    (SELECT 
        author_id, name, COUNT(quote_id) AS number_of_quotes
    FROM
        article_authors
            LEFT JOIN
        quote ON article_id = cited_article_id
    GROUP BY author_id
    ORDER BY number_of_quotes DESC);
    
CREATE VIEW keyword_uses AS
    (SELECT 
        keyword_id,
        word,
        COUNT(article_id) AS number_of_keyword_uses
    FROM
        article_keyword
            JOIN
        keyword USING (keyword_id)
    GROUP BY keyword_id
    ORDER BY number_of_keyword_uses DESC);
    
CREATE VIEW all_articles_quotes AS
    (SELECT 
        article_id, title, origin_article_id AS quoted_by
    FROM
        article
            LEFT JOIN
        quote ON article_id = cited_article_id);
        
CREATE VIEW quotes_texts AS
    (SELECT 
        article_id, origin_article_id AS quoted_by, abstract
    FROM
        quote
            JOIN
        article ON (quote.cited_article_id = article.article_id));
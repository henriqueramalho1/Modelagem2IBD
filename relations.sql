-- Inserting data into the author table:
INSERT INTO refacademicas.author (author_id, name, birthdate, email, phone_number, institution) VALUES
(1, 'John Doe', '1990-01-01', 'johndoe@example.com', '1234567890', 'Institution A'),
(2, 'Jane Smith', '1995-05-15', 'janesmith@example.com', '9876543210', 'Institution B'),
(3, 'Michael Johnson', '1985-12-31', 'michaeljohnson@example.com', '4567890123', 'Institution C');

-- Inserting data into the article table:
INSERT INTO refacademicas.article (article_id, title, page_num, type, abstract) VALUES
(1, 'Title of Article 1', 10, 'Type A', 'This is the abstract for Article 1.'),
(2, 'Title of Article 2', 15, 'Type B', 'This is the abstract for Article 2.'),
(3, 'Title of Article 3', 12, 'Type A', 'This is the abstract for Article 3.');

-- Inserting data into the keyword table:
INSERT INTO refacademicas.keyword (keyword_id, word) VALUES
(1, 'Keyword 1'),
(2, 'Keyword 2'),
(3, 'Keyword 3'),
(4, 'Keyword 4');

-- Inserting data into the quote table:
INSERT INTO refacademicas.quote (quote_id, origin_article_id, cited_article_id) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 3, 2),
(4, 3, 2);

-- Inserting data into the collection table:
INSERT INTO refacademicas.collection (collection_id, type) VALUES
(1, 'Collection A'),
(2, 'Collection B');

-- Inserting data into the article_author table:
INSERT INTO refacademicas.article_author (article_id, author_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 2);

-- Inserting data into the article_keyword table:
INSERT INTO refacademicas.article_keyword (article_id, keyword_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4);

-- Inserting data into the article_collection table:
INSERT INTO refacademicas.article_collection (article_id, collection_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);
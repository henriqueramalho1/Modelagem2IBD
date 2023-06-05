CREATE INDEX title_index ON article (title);
CREATE INDEX word_index ON keyword (word);
CREATE INDEX cited_article_index ON quote (cited_article_id);
CREATE INDEX origin_article_index ON quote (origin_article_id);
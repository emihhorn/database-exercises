USE bank_db;

CREATE TABLE IF NOT EXISTS transactions(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    transaction_date DATE,
    description VARCHAR(200),
    memo TEXT,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_successful BOOLEAN,
    PRIMARY KEY (id)
);

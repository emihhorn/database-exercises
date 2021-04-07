CREATE TABLE `users` (
      `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      `email` VARCHAR(75) NOT NULL,
      `password` varchar(20) NOT NULL
);

CREATE TABLE `ad` (
      `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      `title` varchar(75) NOT NULL,
      `description` TEXT NOT NULL,
      `user_id` INT NOT NULL
);

CREATE TABLE `categories` (
      `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      `category_name` VARCHAR(50)
);

CREATE TABLE `ad_categories` (
       `ad_id` INTEGER NOT NULL,
       `categories_id` INTEGER NOT NULL
);

ALTER TABLE `ad` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `ad_categories` ADD FOREIGN KEY (`ad_id`) REFERENCES `ad` (`id`);

ALTER TABLE `ad_categories` ADD FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

CREATE TABLE `users` (
	`id` int NOT NULL,
	`user_type_id` int NOT NULL,
	`username` varchar NOT NULL,
	`email` varchar NOT NULL,
	`password` varchar NOT NULL,
	`logged_in` BOOLEAN NOT NULL,
	`user_token` varchar NOT NULL,
	`token_expiration` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_types` (
	`id` int NOT NULL,
	`type` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
	`id` int NOT NULL,
	`name` varchar NOT NULL,
	`description` varchar NOT NULL,
	`price` DECIMAL NOT NULL,
	`stock` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `carts` (
	`id` int NOT NULL,
	`user_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `orders` (
	`id` int NOT NULL,
	`user_id` int NOT NULL,
	`order_date` DATETIME NOT NULL,
	`total_price` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order_details` (
	`id` int NOT NULL,
	`order_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `users` ADD CONSTRAINT `users_fk0` FOREIGN KEY (`user_type_id`) REFERENCES `user_types`(`id`);

ALTER TABLE `carts` ADD CONSTRAINT `carts_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `carts` ADD CONSTRAINT `carts_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`);








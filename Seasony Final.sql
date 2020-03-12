CREATE TABLE `roles` (
  `role_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL
);

CREATE TABLE `units` (
  `unit_id` int PRIMARY KEY NOT NULL,
  `name` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `users` (
  `user_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `user_roles` (
  `users_role_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_role_id` int NOT NULL,
  `fk_user_id` int NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `crops` (
  `crop_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `plant_variety` varchar(255) NOT NULL,
  `fk_user_id` int NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `crop_stages` (
  `crop_stage_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_crop_id` int NOT NULL,
  `stage` ENUM ('seeding', 'propagation', 'maturity', 'harvest', 'storage', 'delivery', 'gone_bad'),
  `parameter` varchar(255) NOT NULL,
  `min_value` double NOT NULL,
  `optimum_value` double NOT NULL,
  `max_value` double NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `batches` (
  `batch_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_crop_id` int NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `seeding_date` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `batch_areas` (
  `batch_area_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_batch_id` int NOT NULL,
  `fk_area_id` int NOT NULL,
  `number_of_pots` int NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `areas` (
  `area_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fk_parent_area_id` int default null,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `area_users` (
  `area_user_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_area_id` int NOT NULL,
  `fk_user_id` int NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `area_material` (
  `area_material_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL,
  `fk_user_id` int NOT NULL,
  `fk_area_id` int NOT NULL,
  `fk_crop_stage_id` int NOT NULL,
  `fk_purchase_line_id` int NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `area_material_logs` (
  `area_material_log_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_area_material_id` int NOT NULL,
  `entry` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `material` (
  `material_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_supplier_id` int NOT NULL,
  `fk_unit_id` int NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `batch_area_status` (
  `batch_area_status_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_batch_area_id` int NOT NULL,
  `stage` ENUM ('seeding', 'propagation', 'maturity', 'harvest', 'storage', 'delivery', 'gone_bad'),
  `quantity` int NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

CREATE TABLE `batch_area_nonreusable_resource_consumption` (
  `batch_area_nonreusable_resource_consumption_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fk_batch_area_id` int NOT NULL,
  `fk_material_id` int NOT NULL,
  `quantity` float NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp
);

ALTER TABLE `user_roles` ADD FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `user_roles` ADD FOREIGN KEY (`fk_role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `batch_areas` ADD FOREIGN KEY (`fk_batch_id`) REFERENCES `batches` (`batch_id`);

ALTER TABLE `batch_areas` ADD FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`area_id`);

ALTER TABLE `areas` ADD FOREIGN KEY (`area_id`) REFERENCES `area_material` (`fk_area_id`);

ALTER TABLE `batch_area_nonreusable_resource_consumption` ADD FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`batch_area_id`);

ALTER TABLE `material` ADD FOREIGN KEY (`fk_unit_id`) REFERENCES `units` (`unit_id`);

ALTER TABLE `batch_area_nonreusable_resource_consumption` ADD FOREIGN KEY (`fk_material_id`) REFERENCES `material` (`material_id`);

ALTER TABLE `area_material_logs` ADD FOREIGN KEY (`fk_area_material_id`) REFERENCES `area_material` (`area_material_id`);

ALTER TABLE `area_users` ADD FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `area_users` ADD FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`area_id`);

ALTER TABLE `batch_area_status` ADD FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`batch_area_id`);

ALTER TABLE `batches` ADD FOREIGN KEY (`fk_crop_id`) REFERENCES `crops` (`crop_id`);

ALTER TABLE `crop_stages` ADD FOREIGN KEY (`fk_crop_id`) REFERENCES `crops` (`crop_id`);

ALTER TABLE `area_material` ADD FOREIGN KEY (`fk_crop_stage_id`) REFERENCES `crop_stages` (`crop_stage_id`);

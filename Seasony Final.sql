DROP DATABASE seasony;

CREATE DATABASE seasony CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE seasony;

SET sql_mode = '';

CREATE TABLE `roles`
(
    `id`         int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`       varchar(255)    NOT NULL,
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `units`
(
    `id`         int PRIMARY KEY     NOT NULL AUTO_INCREMENT,
    `name`       varchar(255) UNIQUE NOT NULL,
    `created_at` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `users`
(
    `id`         int PRIMARY KEY     NOT NULL AUTO_INCREMENT,
    `name`       varchar(255)        NOT NULL,
    `email`      varchar(255) UNIQUE NOT NULL,
    `created_at` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`    int(1)              NOT NULL DEFAULT 0
);

CREATE TABLE `user_roles`
(
    `id`         int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_role_id` int             NOT NULL,
    `fk_user_id` int             NOT NULL,
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`    int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `crops`
(
    `id`            int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`          varchar(255)    NOT NULL,
    `plant_variety` varchar(255)    NOT NULL,
    `created_at`    timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`       int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `crop_stages`
(
    `id`         int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`       ENUM ('seeding', 'propagation', 'maturity', 'harvest', 'storage', 'delivery', 'gone_bad'),
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `crop_stage_default_values`
(
    `id`               int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_crop_id`       int             NOT NULL,
    `fk_crop_stage_id` int             NOT NULL,
    `parameter`        varchar(255)    NOT NULL,
    `min_value`        double          NOT NULL,
    `optimum_value`    double          NOT NULL,
    `max_value`        double          NOT NULL,
    `created_at`       timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`          int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `batches`
(
    `id`            int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_crop_id`    int             NOT NULL,
    `customer_name` varchar(255)    NOT NULL,
    `seeding_date`  timestamp       NOT NULL,
    `created_at`    timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`       int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `batch_areas`
(
    `id`             int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_batch_id`    int             NOT NULL,
    `fk_area_id`     int             NOT NULL,
    `number_of_pots` int             NOT NULL,
    `created_at`     timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`     timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`        int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `batch_area_crop_stages`
(
    `id`               int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_crop_id`       int             NOT NULL,
    `fk_crop_stage_id` int             NOT NULL,
    `fk_batch_area_id` int             NOT NULL,
    `created_at`       timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `areas`
(
    `id`                int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`              varchar(255)    NOT NULL,
    `fk_parent_area_id` int,
    `created_at`        timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`           int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `area_users`
(
    `area_user_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_area_id`   int             NOT NULL,
    `fk_user_id`   int             NOT NULL,
    `created_at`   timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`      int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `area_materials`
(
    `id`             int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_material_id` int             NOT NULL,
    `fk_area_id`     int             NOT NULL,
    `created_at`     timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`     timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`        int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `area_material_logs`
(
    `id`                          int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_batch_area_crop_stage_id` int             NOT NULL,
    `fk_area_material_id`         int             NOT NULL,
    `entry`                       varchar(255)    NOT NULL,
    `created_at`                  timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                  timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`                     int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `materials`
(
    `id`           int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`         varchar(255)    NOT NULL,
    `company_name` varchar(255)    NOT NULL,
    `fk_unit_id`   int             NOT NULL,
    `created_at`   timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`      int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `batch_area_status`
(
    `id`               int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_batch_area_id` int             NOT NULL,
    `stage`            ENUM ('seeding', 'propagation', 'maturity', 'harvest', 'storage', 'delivery', 'gone_bad'),
    `quantity`         int             NOT NULL,
    `created_at`       timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`          int(1)          NOT NULL DEFAULT 0
);

CREATE TABLE `batch_area_nonreusable_resource_consumption`
(
    `id`               int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fk_batch_area_id` int             NOT NULL,
    `fk_material_id`   int             NOT NULL,
    `quantity`         float           NOT NULL,
    `created_at`       timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`          int(1)          NOT NULL DEFAULT 0
);

ALTER TABLE `user_roles`
    ADD FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_roles`
    ADD FOREIGN KEY (`fk_role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `batch_areas`
    ADD FOREIGN KEY (`fk_batch_id`) REFERENCES `batches` (`id`);

ALTER TABLE `batch_areas`
    ADD FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`id`);

ALTER TABLE `area_materials`
    ADD FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`id`);

ALTER TABLE `area_materials`
    ADD FOREIGN KEY (`fk_material_id`) REFERENCES `materials` (`id`);

ALTER TABLE `batch_area_nonreusable_resource_consumption`
    ADD FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`id`);

ALTER TABLE `materials`
    ADD FOREIGN KEY (`fk_unit_id`) REFERENCES `units` (`id`);

ALTER TABLE `batch_area_nonreusable_resource_consumption`
    ADD FOREIGN KEY (`fk_material_id`) REFERENCES `materials` (`id`);

ALTER TABLE `area_material_logs`
    ADD FOREIGN KEY (`fk_area_material_id`) REFERENCES `area_materials` (`id`);

ALTER TABLE `area_users`
    ADD FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`);

ALTER TABLE `area_users`
    ADD FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`id`);

ALTER TABLE `batch_area_status`
    ADD FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`id`);

ALTER TABLE `batches`
    ADD FOREIGN KEY (`fk_crop_id`) REFERENCES `crops` (`id`);

ALTER TABLE `crop_stage_default_values`
    ADD FOREIGN KEY (`fk_crop_id`) REFERENCES `crops` (`id`);

ALTER TABLE `batch_area_crop_stages`
    ADD FOREIGN KEY (`fk_crop_stage_id`) REFERENCES `crop_stages` (`id`);

ALTER TABLE `batch_area_crop_stages`
    ADD FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`id`);

ALTER TABLE `area_material_logs`
    ADD FOREIGN KEY (`fk_batch_area_crop_stage_id`) REFERENCES `batch_area_crop_stages` (`id`);

ALTER TABLE `crop_stage_default_values`
    ADD FOREIGN KEY (`fk_crop_stage_id`) REFERENCES `crop_stages` (`id`);


insert into areas (name, fk_parent_area_id)
values ('area 1', null);
insert into areas (name, fk_parent_area_id)
values ('green house 1', 1);
insert into areas (name, fk_parent_area_id)
values ('room 1', 2);
insert into areas (name, fk_parent_area_id)
values ('stand 1', 3);
insert into areas (name, fk_parent_area_id)
values ('tray 1', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 2', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 3', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 4', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 5', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 6', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 7', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 8', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 9', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 10', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 11', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 12', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 13', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 14', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 15', 4);
insert into areas (name, fk_parent_area_id)
values ('tray 16', 4);


insert into units (name)
values ('milligram');
insert into units (name)
values ('gram');
insert into units (name)
values ('kilogram');
insert into units (name)
values ('millimeter');
insert into units (name)
values ('centimeter');
insert into units (name)
values ('meter');
insert into units (name)
values ('centigrade');
insert into units (name)
values ('fahrenheit');
insert into units (name)
values ('milliliter');
insert into units (name)
values ('centiliter');
insert into units (name)
values ('deciliter');
insert into units (name)
values ('liter');
insert into units (name)
values ('piece');
insert into units (name)
values ('cubic_meter');


insert into roles (name)
values ('super_admin'),
       ('admin'),
       ('user'),
       ('purchase'),
       ('sale'),
       ('production'),
       ('sensor');

insert into users (name, email)
values ('Nalani Ingry', 'ningry0@csmonitor.com');
insert into users (name, email)
values ('Valaria Southeran', 'vsoutheran1@amazon.co.uk');
insert into users (name, email)
values ('Oralia Hallatt', 'ohallatt2@aboutads.info');
insert into users (name, email)
values ('Diane Woloschin', 'dwoloschin3@taobao.com');
insert into users (name, email)
values ('Vasily Trenouth', 'vtrenouth4@vimeo.com');
insert into users (name, email)
values ('Fara Spire', 'fspire5@nps.gov');
insert into users (name, email)
values ('Moshe Foresight', 'mforesight6@smh.com.au');
insert into users (name, email)
values ('Carree Camin', 'ccamin7@springer.com');
insert into users (name, email)
values ('Betti Smowton', 'bsmowton8@va.gov');
insert into users (name, email)
values ('Stanley Langton', 'slangton9@mapy.cz');
insert into users (name, email)
values ('Caterina Easlea', 'ceasleaa@joomla.org');
insert into users (name, email)
values ('Florie Wehner', 'fwehnerb@amazonaws.com');
insert into users (name, email)
values ('Georgine Manshaw', 'gmanshawc@cnet.com');
insert into users (name, email)
values ('Laughton O''Doohaine', 'lodoohained@printfriendly.com');
insert into users (name, email)
values ('Wally Adnet', 'wadnete@fc2.com');
insert into users (name, email)
values ('Rowena Mitrovic', 'rmitrovicf@hc360.com');
insert into users (name, email)
values ('Aloysius Brigham', 'abrighamg@google.co.uk');
insert into users (name, email)
values ('Joan Shirer', 'jshirerh@com.com');
insert into users (name, email)
values ('Lavinie Godlonton', 'lgodlontoni@icio.us');
insert into users (name, email)
values ('Agretha Blanchard', 'ablanchardj@msn.com');
insert into users (name, email)
values ('Ase Gartshore', 'agartshorek@is.gd');
insert into users (name, email)
values ('Jolie Mordey', 'jmordeyl@over-blog.com');
insert into users (name, email)
values ('Candy McCurdy', 'cmccurdym@blogspot.com');
insert into users (name, email)
values ('Niven Brunsden', 'nbrunsdenn@cbc.ca');
insert into users (name, email)
values ('Boote Pinnell', 'bpinnello@wix.com');
insert into users (name, email)
values ('Minor Bliven', 'mblivenp@scribd.com');
insert into users (name, email)
values ('Timmi Cawson', 'tcawsonq@1und1.de');
insert into users (name, email)
values ('Cinderella Brailsford', 'cbrailsfordr@webs.com');
insert into users (name, email)
values ('Heywood Osipenko', 'hosipenkos@cbsnews.com');
insert into users (name, email)
values ('Gale Osgar', 'gosgart@jimdo.com');

insert into materials (name, company_name, fk_unit_id)
values ('ANTIMONY TRISULFIDE', 'Homeocare Laboratories', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Diethylpropion hydrochloride', 'PD-Rx Pharmaceuticals, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('ALCOHOL', 'Triad Group', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Benzocain', 'Eau Zone Oils and Fragrances LTD', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Benazepril hydrochloride', 'Trigen Laboratories, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Mineral Oil', 'Best Choice', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Atomoxetine hydrochloride', 'Eli Lilly and Company', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Hydrochlorothiazide', 'Macleods Pharmaceuticals Limited', 1);
insert into materials (name, company_name, fk_unit_id)
values ('TITANIUM DIOXIDE', 'Laboratoires Clarins S.A.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('loxapine succinate', 'Watson Pharma, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('OCTINOXATE', 'Ventura Corporation (San Juan, P.R)', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Aralia racemosa', 'Apotheca Company', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Montelukast', 'Bryant Ranch Prepack', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Ranitidine', 'Walgreen Company', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Isopropyl Alcohol', 'Wal-Mart Stores Inc', 1);
insert into materials (name, company_name, fk_unit_id)
values ('LIDOCAINE HYDROCHLORIDE', 'APP Pharmaceuticals, LLC', 1);
insert into materials (name, company_name, fk_unit_id)
values ('OCTISALATE', 'ORIGINS NATURAL RESOURCES INC.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('sodium fluoride', 'Chattem, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Fentanyl Citrate', 'Cantrell Drug Company', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Acetaminophen, Diphenhydramine HCl', 'Supervalu Inc', 1);
insert into materials (name, company_name, fk_unit_id)
values ('CINCHONA OFFICINALIS BARK', 'Washington Homeopathic Products', 1);
insert into materials (name, company_name, fk_unit_id)
values ('TOPICAL STARCH', 'KJI Industrial Co Ltd', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Levetiracetam', 'American Health Packaging', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Prochlorperazine Maleate', 'Northwind Pharmaceuticals', 1);
insert into materials (name, company_name, fk_unit_id)
values ('adenosine', 'IASO Inc', 1);
insert into materials (name, company_name, fk_unit_id)
values ('zolpidem tartrate', 'REMEDYREPACK INC.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Oxycodone Hydrochloride', 'Zydus Pharmaceuticals (USA) Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('CLONAZEPAM', 'Caraco Pharmaceutical Laboratories, Ltd.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('IBUPROFEN', 'Costco Wholesale', 1);
insert into materials (name, company_name, fk_unit_id)
values ('ONDANSETRON', 'Rebel Distributors Corp', 1);
insert into materials (name, company_name, fk_unit_id)
values ('CHLORHEXIDINE GLUCONATE, ETHYL ALCOHOL', 'MKR International Inc', 1);
insert into materials (name, company_name, fk_unit_id)
values ('EUPHRASIA STRICTA', 'Natural Health Supply', 1);
insert into materials (name, company_name, fk_unit_id)
values ('risperidone', 'Cardinal Health', 1);
insert into materials (name, company_name, fk_unit_id)
values ('TRICLOSAN', 'Volume Distributors, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('PANAX GINSENG FRUIT', 'Korea Genetic Pharm Co., Ltd', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Octinoxate and Oxybenzone', 'Ventura Corporation LTD', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Sodium Citrate', 'Alva-Amco Pharmacal Companies, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('PHENTERMINE HYDROCHLORIDE', 'Apotheca, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('levocetirizine dihydrochloride', 'UCB, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Tolnaftate', 'Perrigo New York Inc', 1);
insert into materials (name, company_name, fk_unit_id)
values ('Oxygen', 'Coastal Med Tech, Inc.', 1);
insert into materials (name, company_name, fk_unit_id)
values ('temprature_sensor', 'Quaxo', 13);
insert into materials (name, company_name, fk_unit_id)
values ('humidity_sensor', 'Rhyloo', 13);
insert into materials (name, company_name, fk_unit_id)
values ('co2_sensor', 'Katz', 13);
insert into materials (name, company_name, fk_unit_id)
values ('gas_sensor', 'Voomm', 13);
insert into materials (name, company_name, fk_unit_id)
values ('water_level_sensor', 'Topicware', 13);
insert into materials (name, company_name, fk_unit_id)
values ('smoke_sensor', 'Cogidoo', 13);
insert into materials (name, company_name, fk_unit_id)
values ('big_tray', 'Izio', 13);
insert into materials (name, company_name, fk_unit_id)
values ('big_pot', 'Talane', 13);
insert into materials (name, company_name, fk_unit_id)
values ('small_tray', 'Oyope', 13);
insert into materials (name, company_name, fk_unit_id)
values ('small_pot', 'Skipstorm', 13);
insert into materials (name, company_name, fk_unit_id)
values ('light_bulb', 'Dynabox', 13);
insert into materials (name, company_name, fk_unit_id)
values ('soil', 'Dabvine', 14);
insert into materials (name, company_name, fk_unit_id)
values ('paper_bag', 'Eayo', 13);
insert into materials (name, company_name, fk_unit_id)
values ('plastic_bag', 'Twimm', 13);
insert into materials (name, company_name, fk_unit_id)
values ('Lettuce_seed', 'Natural One', 3);
insert into materials (name, company_name, fk_unit_id)
values ('Shiso_seed', 'Natural One', 3);


insert into crops (name, plant_variety)
values ('Lettuce ', 'Asteraceae');
insert into crops (name, plant_variety)
values ('Shiso ', 'Lamiaceae');

insert into crop_stages (name)
values ('seeding'),
       ('propagation'),
       ('maturity'),
       ('harvest'),
       ('storage'),
       ('delivery'),
       ('god_bad');


insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 1, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 1, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 1, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 1, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 1, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 2, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 2, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 2, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 2, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 2, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 3, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 3, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 3, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 3, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 3, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 4, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 4, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 4, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 4, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 4, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 5, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 5, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 5, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 5, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (1, 5, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');


insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 1, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 1, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 1, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 1, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 1, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 2, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 2, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 2, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 2, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 2, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 3, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 3, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 3, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 3, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 3, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 4, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 4, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 4, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 4, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 4, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');

insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 5, 'temperature', 20, 22, 25, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 5, 'humidity', 70, 80, 90, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 5, 'ph', 7, 7, 7, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 5, 'ec', 700, 900, 1120, '2020-03-11', '2020-03-11');
insert into crop_stage_default_values (fk_crop_id, fk_crop_stage_id, parameter, min_value, optimum_value, max_value,
                                 created_at, updated_at)
values (2, 5, 'water_level', 150, 500, 900, '2020-03-11', '2020-03-11');


insert into area_materials (fk_material_id, fk_area_id)
values (42, 5),
       (43, 5),
       (44, 5),
       (45, 5),
       (46, 5),
       (47, 5),
       (48, 5),
       (52, 5),
       (42, 6),
       (43, 6),
       (44, 6),
       (46, 6),
       (46, 6),
       (47, 6),
       (48, 6),
       (52, 6),
       (42, 7),
       (43, 7),
       (44, 7),
       (47, 7),
       (46, 7),
       (47, 7),
       (48, 7),
       (52, 7),
       (42, 8),
       (43, 8),
       (44, 8),
       (48, 8),
       (46, 8),
       (47, 8),
       (48, 8),
       (52, 8),
       (42, 9),
       (43, 9),
       (44, 9),
       (48, 9),
       (46, 9),
       (47, 9),
       (48, 9),
       (52, 9);

insert into batches (fk_crop_id, customer_name, seeding_date)
values (1, 'Italian cucine', '2020-04-01'),
       (1, 'Italian cucine', '2020-05-01'),
       (1, 'Italian cucine', '2020-06-01'),
       (1, 'Italian cucine', '2020-07-01'),
       (1, 'Italian cucine', '2020-08-01'),
       (1, 'Italian cucine', '2020-09-01'),
       (1, 'Italian cucine', '2020-10-01'),
       (1, 'Italian cucine', '2020-11-01'),
       (2, 'Italian cucine', '2020-04-01'),
       (2, 'Italian cucine', '2020-05-01'),
       (3, 'Italian cucine', '2020-06-01'),
       (4, 'Italian cucine', '2020-07-01'),
       (5, 'Italian cucine', '2020-08-01'),
       (6, 'Italian cucine', '2020-09-01'),
       (7, 'Italian cucine', '2020-10-01'),
       (8, 'Italian cucine', '2020-11-01');

insert into batch_areas (fk_batch_id, fk_area_id, number_of_pots)
values (1, 5, 20),
       (1, 6, 20),
       (1, 7, 20),
       (1, 8, 20),
       (1, 9, 20),
       (1, 10, 20),
       (1, 12, 20),
       (1, 13, 20),
       (2, 5, 20),
       (2, 6, 20),
       (2, 7, 20),
       (2, 8, 20),
       (2, 9, 20),
       (2, 10, 20),
       (2, 12, 20),
       (2, 13, 20);
--
-- Файл сгенерирован с помощью SQLiteStudio v3.3.3 в Sun Apr 3 15:05:36 2022
--
-- Использованная кодировка текста: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: companies
CREATE TABLE companies (companyId INTEGER PRIMARY KEY, name TEXT UNIQUE, adress TEXT UNIQUE);
INSERT INTO companies (companyId, name, adress) VALUES (1, 'A Side Productions2', 'москва ленина 1');
INSERT INTO companies (companyId, name, adress) VALUES (2, 'Amuse (музыкальная компания)', 'москва ленина_2');
INSERT INTO companies (companyId, name, adress) VALUES (3, 'Связанная Независимая запись', 'москва ленина 3');
INSERT INTO companies (companyId, name, adress) VALUES (4, 'Аудиомашина', 'москва ленина 4');
INSERT INTO companies (companyId, name, adress) VALUES (5, 'Bad Boy Records', 'москва ленина 5');
INSERT INTO companies (companyId, name, adress) VALUES (6, 'Альянс Беннетта', 'москва ленина 6');
INSERT INTO companies (companyId, name, adress) VALUES (7, 'Синдикат Голубого города', 'москва ленина 7');
INSERT INTO companies (companyId, name, adress) VALUES (8, 'Браво Музыка', 'москва ленина 8');
INSERT INTO companies (companyId, name, adress) VALUES (9, 'Гэвин Кэмпбелл (музыкальный продюсер)', 'москва ленина 89');
INSERT INTO companies (companyId, name, adress) VALUES (10, 'Музыкальное производство Capellen', 'москва ленина 9');
INSERT INTO companies (companyId, name, adress) VALUES (11, 'Наличные денежные записи', 'москва ленина 12');
INSERT INTO companies (companyId, name, adress) VALUES (12, 'Музыка и звук ВТОРОГО ПИЛОТА', 'москва ленина 14');
INSERT INTO companies (companyId, name, adress) VALUES (13, 'Краеугольные каменные Кии', 'москва ленина 15');
INSERT INTO companies (companyId, name, adress) VALUES (14, 'Творческий Импульс Развлечения', 'москва ленина 16');
INSERT INTO companies (companyId, name, adress) VALUES (15, 'Кертис Энтерпрайзес', 'москва ленина 17');

-- Таблица: countries
CREATE TABLE countries (countryId INTEGER PRIMARY KEY, country TEXT UNIQUE);
INSERT INTO countries (countryId, country) VALUES (1, 'Абхазия');
INSERT INTO countries (countryId, country) VALUES (2, 'Австралия');
INSERT INTO countries (countryId, country) VALUES (3, 'Австрия');
INSERT INTO countries (countryId, country) VALUES (4, 'Азербайджан');
INSERT INTO countries (countryId, country) VALUES (5, 'Албания');
INSERT INTO countries (countryId, country) VALUES (6, 'АлжирАм');
INSERT INTO countries (countryId, country) VALUES (7, 'Американское Самоа');
INSERT INTO countries (countryId, country) VALUES (8, 'Ангола');
INSERT INTO countries (countryId, country) VALUES (9, 'Андорра');
INSERT INTO countries (countryId, country) VALUES (10, 'Антигуа и Барбуда');
INSERT INTO countries (countryId, country) VALUES (11, 'Аргентина');
INSERT INTO countries (countryId, country) VALUES (12, 'Армения');
INSERT INTO countries (countryId, country) VALUES (13, 'Аруба');
INSERT INTO countries (countryId, country) VALUES (14, 'Афганистан');
INSERT INTO countries (countryId, country) VALUES (15, 'Багамы');
INSERT INTO countries (countryId, country) VALUES (16, 'Бангладеш');
INSERT INTO countries (countryId, country) VALUES (17, 'Барбадос');
INSERT INTO countries (countryId, country) VALUES (18, 'Бахрейн');
INSERT INTO countries (countryId, country) VALUES (19, 'Белиз');
INSERT INTO countries (countryId, country) VALUES (20, 'Белоруссия');
INSERT INTO countries (countryId, country) VALUES (21, 'Бельгия');
INSERT INTO countries (countryId, country) VALUES (22, 'Бенин');
INSERT INTO countries (countryId, country) VALUES (23, 'Бермудские Острова');
INSERT INTO countries (countryId, country) VALUES (24, 'Болгария');
INSERT INTO countries (countryId, country) VALUES (25, 'Боливия');
INSERT INTO countries (countryId, country) VALUES (26, 'Бонэйр');
INSERT INTO countries (countryId, country) VALUES (27, 'Босния и Герцеговина');
INSERT INTO countries (countryId, country) VALUES (28, 'Ботсвана');
INSERT INTO countries (countryId, country) VALUES (29, 'Бразилия');
INSERT INTO countries (countryId, country) VALUES (30, 'Виргинские острова');
INSERT INTO countries (countryId, country) VALUES (31, 'Бруней');
INSERT INTO countries (countryId, country) VALUES (32, 'Буркина-Фасо');
INSERT INTO countries (countryId, country) VALUES (33, 'БурундиБутан');
INSERT INTO countries (countryId, country) VALUES (34, 'Вануату');
INSERT INTO countries (countryId, country) VALUES (35, 'Ватикан');
INSERT INTO countries (countryId, country) VALUES (36, 'Великобритания');
INSERT INTO countries (countryId, country) VALUES (37, 'Венгрия');
INSERT INTO countries (countryId, country) VALUES (38, 'Венесуэла');
INSERT INTO countries (countryId, country) VALUES (39, 'Восточный Тимор');
INSERT INTO countries (countryId, country) VALUES (40, 'Вьетнам');

-- Таблица: ensemble_members
CREATE TABLE ensemble_members (ensembleId INTEGER NOT NULL, musicianId INTEGER, FOREIGN KEY (ensembleId) REFERENCES ensembles (ensembleId), FOREIGN KEY (musicianId) REFERENCES performers (performerId));
INSERT INTO ensemble_members (ensembleId, musicianId) VALUES (3, 7);

-- Таблица: ensemble_types
CREATE TABLE ensemble_types (ensembleTypeId INTEGER PRIMARY KEY, ensembleType TEXT UNIQUE NOT NULL);
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (1, 'дуэт');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (2, 'трио');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (3, 'квартет');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (4, 'квинтет');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (5, 'секстет');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (6, 'септет');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (7, 'октет');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (8, 'нонет');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (9, 'децимето');
INSERT INTO ensemble_types (ensembleTypeId, ensembleType) VALUES (10, 'ундецимет');

-- Таблица: ensembles
CREATE TABLE ensembles (ensembleId INTEGER PRIMARY KEY, name TEXT UNIQUE NOT NULL, directorId INTEGER NOT NULL, countryId INTEGER, ensembeTypeId INTEGER, FOREIGN KEY (directorId) REFERENCES musicians (musicianId), FOREIGN KEY (countryId) REFERENCES countries (countryId), FOREIGN KEY (ensembeTypeId) REFERENCES ensemble_types (ensembleTypeId));
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (3, '9nine', 2, 1, 3);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (4, '10 Years', 3, 3, 4);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (5, '10,000 Maniacs', 4, 3, 6);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (6, '10cc', 5, 5, 7);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (7, '12 Stones', 6, 6, 5);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (8, '13th Floor Elevators', 2, 7, 3);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (9, '14U', 7, 5, 2);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (10, '15&', 6, 7, 5);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (11, '16 Horsepower', 7, 8, 4);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (12, '16 Volt', 8, 9, 5);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (13, '17 Hippies', 9, 3, 2);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (14, '20 Fingers', 10, 2, 9);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (15, '21st Century Schizoid Band', 4, 1, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (16, '22-20s', 5, 8, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (17, '22-Pistepirkko', 6, 7, 3);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (18, '23 Skidoo', 7, 4, 3);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (19, '23:45', 7, 5, 2);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (20, '24K', 7, 10, 4);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (21, '25/17', 8, 11, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (22, '36 Crazyfists', 6, 3, 5);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (23, '38 Special (группа)', 3, 4, 6);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (24, '40 Below Summer', 3, 12, 7);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (25, '45 Grave', 1, 14, 5);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (26, '48May', 1, 15, 3);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (27, '65daysofstatic', 1, 15, 3);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (28, '67 (группа)', 1, 1, 5);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (29, 'The 69 Eyes', 5, 17, 6);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (30, '75 (группа)', 2, 14, 2);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (31, '77 Bombay Street', 8, 2, 9);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (32, '98 Degrees (группа)', 9, 4, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (33, '100 Gecs', 10, 5, 5);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (34, '100% (группа)', 11, 3, 7);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (35, 'The 101ers', 12, 2, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (36, 'ensembleName', 7, NULL, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (37, 'ensembleName1', 25, NULL, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (38, 'new ens', 7, NULL, 1);
INSERT INTO ensembles (ensembleId, name, directorId, countryId, ensembeTypeId) VALUES (39, '', 26, NULL, 1);

-- Таблица: instruments
CREATE TABLE instruments (instrumentId INTEGER PRIMARY KEY, instrument TEXT UNIQUE NOT NULL);
INSERT INTO instruments (instrumentId, instrument) VALUES (1, 'Абхарца');
INSERT INTO instruments (instrumentId, instrument) VALUES (2, 'Абыкь');
INSERT INTO instruments (instrumentId, instrument) VALUES (3, 'Авлос');
INSERT INTO instruments (instrumentId, instrument) VALUES (4, 'Агого');
INSERT INTO instruments (instrumentId, instrument) VALUES (5, 'Адаул');
INSERT INTO instruments (instrumentId, instrument) VALUES (6, 'Аджэн');
INSERT INTO instruments (instrumentId, instrument) VALUES (7, 'Адырна');
INSERT INTO instruments (instrumentId, instrument) VALUES (8, 'Аккордеон');
INSERT INTO instruments (instrumentId, instrument) VALUES (9, 'Аккордеон с клавиатурой Кравцова');
INSERT INTO instruments (instrumentId, instrument) VALUES (10, 'Акустическая гитара');
INSERT INTO instruments (instrumentId, instrument) VALUES (11, 'Акьапкьап');
INSERT INTO instruments (instrumentId, instrument) VALUES (12, 'Альбока');
INSERT INTO instruments (instrumentId, instrument) VALUES (13, 'Альпийский рог');
INSERT INTO instruments (instrumentId, instrument) VALUES (14, 'Альт');
INSERT INTO instruments (instrumentId, instrument) VALUES (15, 'Альтовая флейта');
INSERT INTO instruments (instrumentId, instrument) VALUES (16, 'Альтовый кларнет');
INSERT INTO instruments (instrumentId, instrument) VALUES (17, 'Анандалахари');
INSERT INTO instruments (instrumentId, instrument) VALUES (18, 'Ангелика');
INSERT INTO instruments (instrumentId, instrument) VALUES (19, 'Английская гитара');
INSERT INTO instruments (instrumentId, instrument) VALUES (20, 'Английский рожок');
INSERT INTO instruments (instrumentId, instrument) VALUES (21, 'Апхьарца');
INSERT INTO instruments (instrumentId, instrument) VALUES (22, 'Ардин');
INSERT INTO instruments (instrumentId, instrument) VALUES (23, 'Арфа');
INSERT INTO instruments (instrumentId, instrument) VALUES (24, 'Архилютня');
INSERT INTO instruments (instrumentId, instrument) VALUES (25, 'Ахоко');
INSERT INTO instruments (instrumentId, instrument) VALUES (26, 'Ахымаа');
INSERT INTO instruments (instrumentId, instrument) VALUES (27, 'Ачамгур');
INSERT INTO instruments (instrumentId, instrument) VALUES (28, 'Ачыжь');
INSERT INTO instruments (instrumentId, instrument) VALUES (29, 'Ачырпын');
INSERT INTO instruments (instrumentId, instrument) VALUES (30, 'Ашико');
INSERT INTO instruments (instrumentId, instrument) VALUES (31, 'Аюмаа');

-- Таблица: music_performance
CREATE TABLE music_performance (performanceId INTEGER PRIMARY KEY, compostionId INTEGER NOT NULL REFERENCES musical_composition (compositionId), directorId INTEGER, countryId INTEGER, ensembleId INTEGER NOT NULL, FOREIGN KEY (directorId) REFERENCES musicians (musicianId), FOREIGN KEY (countryId) REFERENCES countries (countryId), FOREIGN KEY (ensembleId) REFERENCES ensembles (ensembleId), UNIQUE (compostionId, ensembleId), FOREIGN KEY (compostionId) REFERENCES musical_composition (compositionId));
INSERT INTO music_performance (performanceId, compostionId, directorId, countryId, ensembleId) VALUES (1, 1, NULL, NULL, 5);
INSERT INTO music_performance (performanceId, compostionId, directorId, countryId, ensembleId) VALUES (4, 3, NULL, NULL, 39);
INSERT INTO music_performance (performanceId, compostionId, directorId, countryId, ensembleId) VALUES (5, 4, NULL, NULL, 4);

-- Таблица: musical_composition
CREATE TABLE musical_composition (compositionId INTEGER PRIMARY KEY, name TEXT UNIQUE ON CONFLICT ROLLBACK NOT NULL, authorId INTEGER, date Text, FOREIGN KEY (authorId) REFERENCES musicians (musicianId));
INSERT INTO musical_composition (compositionId, name, authorId, date) VALUES (1, 'qqqw', 43, NULL);
INSERT INTO musical_composition (compositionId, name, authorId, date) VALUES (2, '', 44, NULL);
INSERT INTO musical_composition (compositionId, name, authorId, date) VALUES (3, 'qqw', 45, NULL);
INSERT INTO musical_composition (compositionId, name, authorId, date) VALUES (4, 'qqw1', 45, NULL);
INSERT INTO musical_composition (compositionId, name, authorId, date) VALUES (5, 'qqad', 53, NULL);

-- Таблица: musicians
CREATE TABLE musicians (musicianId INTEGER PRIMARY KEY ON CONFLICT IGNORE, name TEXT UNIQUE NOT NULL, countryId INTEGER, date TEXT, FOREIGN KEY (countryId) REFERENCES countries (countryId));
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (1, '2 Chainz', 1, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (2, '4atty aka Tilla', 1, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (3, '5 Плюх', 2, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (4, '6 Dogs', 3, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (5, '6ix9ine', 4, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (6, '6lack', 4, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (7, '10AGE', 5, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (8, '21 Savage', 5, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (9, '40 Glocc', 6, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (10, '42 Dugg', 7, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (11, '50 Cent', 8, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (12, '140 ударов в минуту', 9, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (13, '808Melo', 10, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (14, 'А', 11, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (15, 'А. Рахман Хассан', 12, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (16, 'Аав, Эвальд', 13, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (17, 'Аавик, Юхан', 14, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (18, 'Аалто, Саара', 14, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (19, 'Аалтонен, Эркки', 15, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (20, 'Ааре, Тыну', 16, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (21, 'Аарика, Аннели', 17, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (22, 'Аарон, Дуду', 17, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (23, 'Аарон, Ли', 18, '1890');
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (24, 'bah', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (25, 'new director2', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (26, 'Абхарца', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (27, 'musa', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (28, 'sdasdas', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (29, 'qwert', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (30, 'bah2', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (31, 'bah3', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (32, 'bah4', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (33, 'bah5', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (34, '56rfg', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (35, '56rfgs', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (36, '56rfgss', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (37, '56rfgasd', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (38, 'sdsdsa', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (39, 'dsdasd', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (40, 'xdsads', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (41, 'жуковский', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (42, 'qwee', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (43, 'qqqw', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (44, '', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (45, 'qqw', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (46, 'qwqq', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (47, 'qwqq2', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (49, 'qwqq3', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (50, 'qwqq4', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (51, 'qwqq5', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (52, 'qwqq6', NULL, NULL);
INSERT INTO musicians (musicianId, name, countryId, date) VALUES (53, 'www', NULL, NULL);

-- Таблица: performances_on_record
CREATE TABLE performances_on_record (performanceId INTEGER NOT NULL, recordId INTEGER NOT NULL, FOREIGN KEY (performanceId) REFERENCES music_performance (performanceId), FOREIGN KEY (recordId) REFERENCES records (recordId), UNIQUE (performanceId, recordId) ON CONFLICT IGNORE);
INSERT INTO performances_on_record (performanceId, recordId) VALUES (1, 1);
INSERT INTO performances_on_record (performanceId, recordId) VALUES (4, 2);
INSERT INTO performances_on_record (performanceId, recordId) VALUES (5, 2);
INSERT INTO performances_on_record (performanceId, recordId) VALUES (5, 3);

-- Таблица: performers
CREATE TABLE performers (performerId INTEGER PRIMARY KEY, musicianId INTEGER NOT NULL, instrumentId INTEGER, FOREIGN KEY (musicianId) REFERENCES musicians (musicianId), FOREIGN KEY (instrumentId) REFERENCES instruments (instrumentId), UNIQUE (musicianId, instrumentId) ON CONFLICT IGNORE);
INSERT INTO performers (performerId, musicianId, instrumentId) VALUES (7, 51, 1);

-- Таблица: price
CREATE TABLE price (priceId INTEGER PRIMARY KEY, retailPrice REAL, wholesalePrice REAL, recordId INTEGER, 
			FOREIGN KEY(recordId) REFERENCES records(recordId));
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (1, 1000.0, 800.0, 1);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (2, 1000.0, 800.0, 2);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (3, 1000.0, 800.0, 3);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (4, 1000.0, 800.0, 4);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (5, 1000.0, 800.0, 5);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (6, 1000.0, 800.0, 6);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (7, 1000.0, 800.0, 7);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (8, 1000.0, 800.0, 8);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (9, 1000.0, 800.0, 10);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (10, 1000.0, 800.0, 11);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (11, 1000.0, 800.0, 12);
INSERT INTO price (priceId, retailPrice, wholesalePrice, recordId) VALUES (12, 1000.0, 800.0, 9);

-- Таблица: records
CREATE TABLE records (recordId INTEGER PRIMARY KEY, recordCompanyId INTEGER, wholesaleCompanyId INTEGER, recordName TEXT UNIQUE NOT NULL, date TEXT, recordsCount INTEGER, FOREIGN KEY (recordCompanyId) REFERENCES companies (companyId), FOREIGN KEY (wholesaleCompanyId) REFERENCES companies (companyId));
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (1, 1, 2, 'Doors — Light My Fire', '1890', 55);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (2, 3, 2, 'Sunshine of My Life', '1890', 0);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (3, 4, 5, 'Traveling Band', '1890', 56);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (4, 1, 5, 'Play with Fire', '1890', 67);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (5, 2, 3, 'Lady Jane	', '1890', 175);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (6, 4, 4, 'Stairway to Heaven', '1890', 185);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (7, 5, 5, 'Honky Cat', '1890', 186);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (8, 4, 5, 'Smoke on the Water', '1890', 164);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (9, 3, 2, 'Your Song', '1890', 186);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (10, 3, 3, 'Starman', '1890', 180);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (11, 1, 1, 'That’s All Right	', '1890', 189);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (12, 1, 1, 'All Together', '1890', 190);
INSERT INTO records (recordId, recordCompanyId, wholesaleCompanyId, recordName, date, recordsCount) VALUES (13, 1, 2, 'neo disc2', '2023', 220);

-- Таблица: sales
CREATE TABLE sales (salesId INTEGER PRIMARY KEY, date TEXT, recordId INTEGER, soldCount INTEGER, price REAL, FOREIGN KEY (recordId) REFERENCES records (recordId));
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (1, '2022-03-31', 1, 20, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (2, '2022-03-31', 2, 19, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (3, '2022-03-31', 3, 18, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (4, '2022-03-31', 4, 17, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (5, '2022-03-31', 5, 16, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (6, '2022-03-31', 6, 15, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (7, '2022-03-31', 7, 14, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (8, '2022-03-31', 8, 13, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (9, '2022-03-31', 9, 12, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (10, '2022-03-31', 10, 20, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (11, '2022-03-31', 11, 11, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (12, '2022-03-31', 12, 10, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (13, '2022-03-31', 1, 20, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (14, '2022-04-01', 8, 23, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (15, '2022-04-01', 1, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (16, '2022-04-01', 1, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (17, '2022-04-01', 1, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (18, '2022-04-01', 1, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (19, '2022-04-01', 1, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (20, '2022-04-01', 3, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (21, '2022-04-01', 3, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (22, '2022-04-01', 3, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (23, '2022-04-01', 3, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (24, '2022-04-01', 3, 21, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (25, '2022-04-01', 2, 10, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (26, '2022-04-01', 2, 10, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (27, '2022-04-01', 2, 10, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (28, '2022-04-01', 2, 10, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (29, '2022-04-01', 2, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (30, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (31, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (32, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (33, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (34, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (35, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (36, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (37, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (38, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (39, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (40, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (41, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (42, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (43, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (44, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (45, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (46, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (47, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (48, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (49, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (50, '2022-04-01', 3, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (51, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (52, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (53, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (54, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (55, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (56, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (57, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (58, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (59, '2022-04-01', 5, 1, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (60, '2022-04-01', 4, 3, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (61, '2022-04-01', 4, 3, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (62, '2022-04-01', 4, 55, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (63, '2022-04-01', 4, 55, 800.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (64, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (65, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (66, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (67, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (68, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (69, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (70, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (71, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (72, '2022-04-01', 6, 0, 1000.0);
INSERT INTO sales (salesId, date, recordId, soldCount, price) VALUES (73, '2022-04-02', 2, 140, 800.0);

-- Триггер: checkCount
CREATE TRIGGER checkCount BEFORE INSERT ON sales WHEN NEW.soldCount > (SELECT recordsCount FROM records WHERE records.recordId = new.recordId) BEGIN SELECT RAISE (FAIL, 'недостаточно товара'); END;

-- Триггер: delete_composition
CREATE TRIGGER delete_composition INSTEAD OF DELETE ON record_compositions BEGIN DELETE FROM performances_on_record WHERE recordId = old.recordId and performanceId = old.performanceId;
DELETE FROM music_performance WHERE performanceId NOT IN 
    (SELECT performanceId FROM performances_on_record );
DELETE FROM musical_composition WHERE compositionId NOT IN 
(select compositionId FROM music_performance) ;
DELETE FROM musicians WHERE musicianId = 48 AND musicianId NOT IN (SELECT authorId from musical_composition WHERE authorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM music_performance WHERE directorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM ensembles WHERE directorId is not null) AND
musicianId NOT IN (SELECT musicianId FROM performers WHERE musicianId is not null); END;

-- Триггер: delete_ensembles
CREATE TRIGGER delete_ensembles INSTEAD OF DELETE ON simple_ensembles BEGIN DELETE FROM ensembles WHERE ensembleId = old.ensembleId;
DELETE FROM ensemble_members WHERE ensembleId NOT IN (SELECT  ensembleId
FROM ensembles);
DELETE FROM performers WHERE performerId NOT IN (SELECT  musicianId
FROM ensemble_members);
DELETE FROM musicians WHERE musicianId = 48 AND musicianId NOT IN (SELECT authorId from musical_composition WHERE authorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM music_performance WHERE directorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM ensembles WHERE directorId is not null) AND
musicianId NOT IN (SELECT musicianId FROM performers WHERE musicianId is not null); END;

-- Триггер: delete_musicians
CREATE TRIGGER delete_musicians INSTEAD OF DELETE ON ensemble_musicians BEGIN DELETE FROM ensemble_members 
WHERE ensembleId = old.ensembleId AND musicianId = old.performerId;
DELETE FROM performers WHERE performerId NOT IN (SELECT  musicianId
FROM ensemble_members);
DELETE FROM musicians WHERE musicianId = 48 AND musicianId NOT IN (SELECT authorId from musical_composition WHERE authorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM music_performance WHERE directorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM ensembles WHERE directorId is not null) AND
musicianId NOT IN (SELECT musicianId FROM performers WHERE musicianId is not null); END;

-- Триггер: delete_records
CREATE TRIGGER delete_records INSTEAD OF DELETE ON simple_records BEGIN DELETE FROM records    WHERE recordId = old.recordId;
DELETE FROM companies  WHERE name = old.companyName AND NOT EXISTS 
			(SELECT * from simple_records WHERE companyName = old.companyName);
DELETE FROM  companies WHERE adress = old.adress  AND NOT EXISTS 
			(SELECT * from simple_records WHERE adress = old.adress);
DELETE FROM performances_on_record WHERE recordId = old.recordId;
DELETE FROM music_performance WHERE performanceId NOT IN 
    (SELECT performanceId FROM performances_on_record );
DELETE FROM musical_composition WHERE compositionId NOT IN 
(select compositionId FROM music_performance) ;
DELETE FROM musicians WHERE musicianId = 48 AND musicianId NOT IN (SELECT authorId from musical_composition WHERE authorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM music_performance WHERE directorId is not null) AND 
musicianId NOT IN (SELECT directorId FROM ensembles WHERE directorId is not null) AND
musicianId NOT IN (SELECT musicianId FROM performers WHERE musicianId is not null); END;

-- Триггер: insert_composition
CREATE TRIGGER insert_composition INSTEAD OF INSERT ON record_compositions BEGIN INSERT OR IGNORE INTO musicians (name)
SELECT * FROM (SELECT new.compositor) ;
INSERT OR IGNORE INTO musical_composition (name, authorId)  Values
(   new.compositionName, (SELECT musicianId FROM musicians WHERE musicians.name = new.compositor LIMIT 1) );
INSERT OR IGNORE INTO music_performance (compostionId,  ensembleId) VALUES
((SELECT compositionId FROM musical_composition WHERE name = new.compositionName LIMIT 1),
(SELECT ensembleId FROM ensembles where name = new.ansembleName LIMIT 1));
INSERT INTO performances_on_record (performanceId, recordId) VALUES
( (select max(performanceId) from  music_performance LIMIT 1), 
new.recordId); END;

-- Триггер: insert_ensembles
CREATE TRIGGER insert_ensembles INSTEAD OF INSERT ON simple_ensembles BEGIN INSERT INTO musicians (name) SELECT * FROM (SELECT new.director)  WHERE NOT EXISTS 
(SELECT * FROM musicians WHERE musicians.name = new.director) LIMIT 1;
INSERT INTO ensembles (name, ensembeTypeId, directorId) VALUES 
(new.ensembleName, (SELECT ensembleTypeId FROM ensemble_types LIMIT 1), 
(SELECT musicianId FROM musicians WHERE name = new.director) ); END;

-- Триггер: insert_musicians
CREATE TRIGGER insert_musicians INSTEAD OF INSERT ON ensemble_musicians BEGIN INSERT INTO musicians (name)
SELECT * FROM (SELECT new.name) AS temp
WHERE NOT EXISTS (
    SELECT name FROM musicians WHERE name = new.name
) LIMIT 1;
INSERT INTO performers (musicianId, instrumentId)
SELECT * FROM (SELECT musicians.musicianId FROM musicians WHERE name = new.name),
(SELECT instrumentId FROM instruments WHERE instrument = new.instrument) 
WHERE NOT EXISTS (
    SELECT * FROM performers WHERE musicianId = (SELECT musicians.musicianId FROM musicians WHERE name = new.name) AND instrumentId = 
    (SELECT instrumentId FROM instruments WHERE instrument = new.instrument)
) LIMIT 1;
INSERT INTO ensemble_members (ensembleId, musicianId) 
select * from
 (select new.ensembleId,performers.performerId from performers, musicians 
 where musicians.name = new.name and performers.musicianId = musicians.musicianId limit 1)
 WHere not exists
( select * from ensemble_members WHERE ensembleID = new.ensembleID AND ensemble_members.musicianID =(select performers.performerId from performers, musicians 
 where musicians.name = new.name and performers.musicianId = musicians.musicianId)); END;

-- Триггер: insert_records
CREATE TRIGGER insert_records INSTEAD OF INSERT ON simple_records BEGIN INSERT INTO companies (name)
SELECT * FROM (SELECT new.companyName) AS temp
WHERE NOT EXISTS (
    SELECT name FROM companies WHERE name = new.companyName
) LIMIT 1;
INSERT INTO companies (adress)
SELECT * FROM (SELECT new.adress) AS temp
WHERE NOT EXISTS (
    SELECT adress FROM companies WHERE adress = new.adress
) LIMIT 1;
insert into records (recordName, date, recordCompanyId, wholesaleCompanyId, recordsCount )
VALUES(new.recordName, new.recordDate, (SELECT companyId FROM companies WHERE name=new.companyName LIMIT 1),
    (SELECT companyId FROM companies WHERE adress=new.adress LIMIT 1), new.recordsCount
); END;

-- Триггер: sale
CREATE TRIGGER sale AFTER INSERT ON sales BEGIN UPDATE records SET recordsCount = records.recordsCount - new.soldCount WHERE records.recordId = new.recordId;
UPDATE sales SET date = date('now') WHERE sales.salesId = new.salesId;
UPDATE sales SET price = (SELECT (CASE WHEN new.soldCount > 10 THEN wholesalePrice ELSE retailPrice END) AS currentPrice FROM price WHERE price.recordId = new.recordId) WHERE sales.salesId = new.salesId; END;

-- Триггер: update_record
CREATE TRIGGER update_record INSTEAD OF UPDATE ON simple_records BEGIN UPDATE companies  set name = new.companyName 
WHERE companyId = (select recordCompanyId from records where recordId = new.recordId LIMIT 1);
UPDATE companies set adress = new.adress WHERE adress = old.adress	;
UPDATE records SET recordName = new.recordName, date=new.recordDate, recordsCount=new.recordsCount 
WHERE recordId = old.recordId; END;

-- Представление: ensemble_musicians
CREATE VIEW ensemble_musicians AS select ensembles.ensembleId,
 musicians.name,
 instruments.instrument,
  musicians.musicianId,
  instruments.instrumentId,
  performers.performerId
FROM ensembles, musicians, ensemble_members, instruments, performers
WHERE ensembles.ensembleId = ensemble_members.ensembleId
AND  performers.performerId = ensemble_members.musicianId
AND performers.musicianId =  musicians.musicianId
AND performers.instrumentId = instruments.instrumentId
ORDER BY ensembles.ensembleId;

-- Представление: ensemble_performances
CREATE VIEW ensemble_performances AS SELECT ensembles.ensembleId, ensembles.name as name, musical_composition.name as compositianName
	FROM ensembles, music_performance, musical_composition
	where ensembles.ensembleId = music_performance.ensembleId AND 
	  musical_composition.compositionId = music_performance.compostionId
ORDER BY    ensembles.ensembleId;

-- Представление: full_records
CREATE VIEW full_records AS 
SELECT recordName, recordsCount, company.name as companyName,
		wholeSale_company.name as wholesalesCompany, wholeSale_company.adress,
		records.date AS recordDate, retailPrice, wholesalePrice,
		musical_composition.name as compositionName,
		ensembles.name as ansembleName,
		musicians.name as compositor,
		sales.soldCount 
FROM records, companies AS company, companies as wholeSale_company, price, 
	 performances_on_record, music_performance, musical_composition,
	 ensembles, musicians, sales
WHERE records.recordCompanyId = company.companyId
	  AND 	records.wholesaleCompanyId = wholeSale_company.companyId
	  AND records.recordId = price.recordId
	  AND performances_on_record.recordId =  records.recordId 
	  AND music_performance.performanceId = performances_on_record.performanceId
	  AND musical_composition.compositionId = music_performance.compostionId
	  AND ensembles.ensembleId = music_performance.ensembleId
	  AND musicians.musicianId = musical_composition.authorId
	  AND sales.recordId = records.recordId;

-- Представление: performance_count
CREATE VIEW performance_count AS SELECT COUNT(performanceId),
				ensembles.name FROM ensembles, music_performance 
				where ensembles.ensembleId = music_performance.ensembleId
				GROUP BY ensembles.name;

-- Представление: record_compositions
CREATE VIEW record_compositions AS SELECT records.recordId, 
   musical_composition.name as compositionName, 
   musicians.name as compositor,
   ensembles.name as ansembleName, 
   performances_on_record.performanceId,
   musical_composition.compositionId,
   ensembles.ensembleId,
   music_performance.directorId,
   musical_composition.authorId as compositor
FROM records, musical_composition,music_performance,ensembles, musicians, performances_on_record
WHERE performances_on_record.recordId =  records.recordId 
    AND music_performance.performanceId = performances_on_record.performanceId
    AND musical_composition.compositionId = music_performance.compostionId
    AND ensembles.ensembleId = music_performance.ensembleId
    AND musicians.musicianId = musical_composition.authorId
ORDER BY records.recordId;

-- Представление: record_ensemble
CREATE VIEW record_ensemble AS SELECT 
		    recordName, name FROM records, music_performance, ensembles, performances_on_record
			WHERE performances_on_record.recordId = records.recordId AND
			performances_on_record.performanceId = music_performance.performanceId AND
			ensembles.ensembleId = music_performance.ensembleId
			GROUP BY performances_on_record.performanceId;

-- Представление: simple_ensembles
CREATE VIEW simple_ensembles AS select ensembles.ensembleId, 
ensembles.name AS ensembleName,
 directors.name as director,
 ensembleType,
 ensembleTypeid
FROM ensembles, musicians as directors, ensemble_types
WHERE ensembles.directorId = directors.musicianId
	  AND ensembles.ensembeTypeId = ensemble_types.ensembleTypeId
	 ORDER BY  ensembles.ensembleId;

-- Представление: simple_records
CREATE VIEW simple_records AS SELECT recordId, 
    recordName,
    records.date AS recordDate,
    company.name AS companyName,
    wholeSale_company.adress	,
    recordsCount
FROM records, companies AS company, companies as wholeSale_company
WHERE records.recordCompanyId = company.companyId
        AND 	records.wholesaleCompanyId = wholeSale_company.companyId;

-- Представление: sold_records
CREATE VIEW sold_records AS SELECT 
recordName,
 sum(soldCount) as soldCount
from records,
  sales  
where 
records.recordId = sales.recordId 
and substr( sales.date, 1, 4 ) = strftime('%Y','now')
GROUP BY (recordName) 
ORDER BY  (soldCount) DESC;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

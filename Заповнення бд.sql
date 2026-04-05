USE VetMasterDb;
GO

-- 1. Очищення та скидання лічильників
TRUNCATE TABLE Vaccinations;
TRUNCATE TABLE Records;
DELETE FROM AnimalCards;
DBCC CHECKIDENT ('AnimalCards', RESEED, 0); 
GO

-- 2. Тварини
INSERT INTO AnimalCards (Name, Species, Breed, Age, Sex, OwnerName, OwnerPhone, MediaPath)
VALUES
(N'Мурчик', N'Кіт', N'Британець', 3, N'Самець', N'Іваненко Олег', '+380671234567', ''),
(N'Барсик', N'Кіт', N'Мейн-кун', 5, N'Самець', N'Петренко Наталя', '+380932345678', ''),
(N'Рекс', N'Пес', N'Німецька вівчарка', 4, N'Самець', N'Сидоренко Віктор', '+380503456789', ''),
(N'Лапа', N'Пес', N'Лабрадор', 2, N'Самиця', N'Коваль Марина', '+380674567890', ''),
(N'Пушок', N'Кролик', N'Ангорський', 1, N'Самець', N'Бондаренко Ірина', '+380935678901', ''),
(N'Кеша', N'Птах', N'Папуга', 6, N'Самець', N'Мельник Андрій', '+380506789012', ''),
(N'Зефір', N'Кіт', N'Персидський', 2, N'Самиця', N'Шевченко Оксана', '+380677890123', ''),
(N'Буля', N'Пес', N'Бульдог', 7, N'Самець', N'Лисенко Дмитро', '+380938901234', '');

-- 3. Записи хвороб 
INSERT INTO Records (AnimalCardId, Diagnosis, Complaints, VisitDate, TreatmentStart, TreatmentEnd, Recommendations)
VALUES
(1, N'Отит', N'Чухає вухо', DATEADD(day, -15, GETDATE()), DATEADD(day, -15, GETDATE()), DATEADD(day, -5, GETDATE()), N'Краплі у вуха 2р/день'),
(2, N'Дерматит', N'Свербіж', DATEADD(day, -10, GETDATE()), DATEADD(day, -10, GETDATE()), NULL, N'Зміна корму'),
(3, N'Гастрит', N'Блювота', DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), NULL, N'Дієта Rice & Chicken'),
(4, N'Алергія', N'Висипання', GETDATE(), GETDATE(), NULL, N'Антигістамінні препарати'),
(5, N'Плановий огляд', N'Профілактика', DATEADD(day, 5, GETDATE()), DATEADD(day, 5, GETDATE()), NULL, N'Загальний аналіз крові'),
(6, N'Контроль дзьоба', N'Після лікування', DATEADD(day, 12, GETDATE()), DATEADD(day, 12, GETDATE()), NULL, N'Огляд терапевтом'),
(7, N'Кон''юнктивіт', N'Сльозотеча', DATEADD(day, -18, GETDATE()), DATEADD(day, -18, GETDATE()), DATEADD(day, -10, GETDATE()), N'Промивання очей'),
(8, N'Артрит', N'Біль у суглобах', DATEADD(day, -5, GETDATE()), DATEADD(day, -5, GETDATE()), NULL, N'М’яка підстилка');

-- 4. Щеплення 
INSERT INTO Vaccinations (AnimalCardId, VaccineName, VaccinationDate)
VALUES
(1, N'Сказ (Nobivac Rabies)', DATEADD(day, -20, GETDATE())),
(2, N'Панлейкопенія', DATEADD(day, -12, GETDATE())),
(3, N'Комплексна DHPPi', DATEADD(day, -1, GETDATE())),
(4, N'Парвовірус', GETDATE()), -- Сьогодні
(5, N'Ревакцинація', DATEADD(day, 10, GETDATE())),
(7, N'Скад (Nobivac)', DATEADD(day, 15, GETDATE())), 
(8, N'Лептоспіроз', DATEADD(day, -8, GETDATE()));
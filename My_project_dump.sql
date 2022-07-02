use medical_db;
insert into patients values
('1','Javonte','Jakubowski','1974-02-07','38515893','89676723604'),
('2','Aurelia','Ratke','1980-03-15','38515895', '89339101296'),
('3','Jacey','Fritsch','1992-05-05','38515888','89802518644'),
('4','Whitney','Jerde','1991-09-05','38515856','89397268208'),
('5','Axel','Lynch','1979-07-07','38515867','89585747656'),
('6','Karlee','Kunde','1971-11-18','38515889','89125986482'),
('7','Ryann','Prosacco','1993-05-22','385158556','89334895548'),
('8','Ona','Schumm','2013-07-10', null,'89838377175'),
('9','Kennith','Gaylord','1971-11-18','38515857','89777246849'),
('10','Alexandre','Rowe','1970-12-22','38515897','89230775666');

insert into doctors values
('1','Jilke','Jams','1979-03-07','385178893','89689723604'),
('2','Auli','Rat','1965-03-25','388815895', '893391018996'),
('3','Jace','Frits','1993-05-05','39515888','89802518844'),
('4','Whitneui','Jerd','1996-09-07','38575856','89397968208'),
('5','Axe','Lyn','1979-08-07','38595867','89585747856'),
('6','Karl','Kun','1981-11-18','38585889','89185986482'),
('7','Ryan','Pros','1993-07-22','385158506','89334995548'),
('8','Onat','Schum','2018-07-10', null, null),
('9','Ken','Gayl','1981-12-18','38515957','89777786849'),
('10','Alex','Rod','1971-02-22','38575867','89230778666');

insert into speciality values
('1','cardiologist'),
('2','gastroenterologist'),
('3','therapist'),
('4','surgeon'),
('5','pulmonologist'),
('6','dietologist'),
('7','denist'),
('8','reflexotherapist'),
('9','general practice'),
('10','famili doctor');

insert into drugs values
('1', 'pantoprazol', 'headache'),
('2', 'teraflex', 'allergy'),
('3','mebeverin', 'headache'),
('4','panadol', 'no s/e'),
('5','geviskon', 'stomach ache'),
('6','trimedat', 'headache'),
('7','omeprazol', 'headache'),
('8','geptral', 'allergy, blood pressure'),
('9','pepsan', 'headache'),
('10','immudon', 'no s/e');


insert into deseases  values
('1','reflux'),
('2','gastritis'),
('3','iBS'),
('4','pancreatitis'),
('5','flue'),
('6','diabetics'),
('7','salpingit'),
('8','cold'),
('9','influenza'),
('10','crone desease');


insert into personel_speciality values
('1','3'),
('2','3'),
('3','6'),
('4','2'),
('5','7'),
('6','9'),
('7','9'),
('8','1'),
('9','5'),
('10','8');

insert into medical_procedures values
('1','colonoscopy', '10000'),
('2','gastroscopy', '7000'),
('3','mri stomach', '8000'),
('4','x-ray', '3000'),
('5','injections', '1500'),
('6','brain mri', '12000'),
('7','blood collection', '1200'),
('8','lung ct', '10000'),
('9','stomach ct', '10000'),
('10','echpgraphy', '2000');

insert into patient_procedures values
('1','2', '3', '2', '2022-06-12','patient' ),
('2','3', '5', '10', '2022-01-12','compulsory_insuarance' ),
('3','6', '7', '8', '2022-05-22','voluntary_insuarance' ),
('4','8', '1', '2', '2022-08-23','voluntary_insuarance' ),
('5','7', '3', '10', '2022-05-25','voluntary_insuarance' ),
('6','8', '7', '10', '2022-02-12','voluntary_insuarance' ),
('7','2', '4', '9', '2022-03-12','compulsory_insuarance' ),
('8','7', '6', '9', '2022-06-12','patient'),
('9','7', '3', '2', '2022-07-12','compulsory_insuarance' ),
('10','9', '3', '2', '2022-08-12','patient' );

insert into appointment values
('1','2', '3',  '2022-06-12' ),
('2','6', '5', '2022-01-12' ),
('3','7', '9',  '2022-05-22' ),
('4','8', '1', '2022-08-23' ),
('5','7', '3',  '2022-05-25' ),
('6','4', '9', '2022-02-12' ),
('7','1', '9',  '2022-03-12'),
('8','5', '6',  '2022-06-12'),
('9','2', '3', '2022-07-12' ),
('10','9', '3', '2022-08-12' );

insert into treatment values
('1','2', '3', 'kjlkjlkjlkj', 'asihiuhiuh', '1', '7', '2022-06-12' ),
('2','6', '5', 'kjlkjlkjlkj', 'asihiuhiuh', '2', '9','2022-01-12' ),
('3','7', '9',  'kjlkjlkjlkj', 'asihiuhiuh', '2', '5', '2022-05-22' ),
('4','8', '1', 'kjlkjlkjlkj', 'asihiuhiuh', '4', '1', '2022-08-23' ),
('5','7', '3',  'kjlkjlkjlkj', 'asihiuhiuh', '2', '3', '2022-05-25' ),
('6','4', '9', 'kjlkjlkjlkj', 'asihiuhiuh', '1', '9', '2022-02-12' ),
('7','1', '9', 'kjlkjlkjlkj', 'asihiuhiuh', '7', '6', '2022-03-12'),
('8','5', '6', 'kjlkjlkjlkj', 'asihiuhiuh', '8', '4', '2022-06-12'),
('9','2', '3', 'kjlkjlkjlkj', 'asihiuhiuh', '10', '2', '2022-07-12' ),
('10','9', '3', 'kjlkjlkjlkj', 'asihiuhiuh', '2', '3', '2022-08-12' );


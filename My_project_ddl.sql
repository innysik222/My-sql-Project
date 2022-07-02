-- Цель проекта - создание базы данных медицинского центра для  хранения, обработки и изучения информации о пациентах, их заболеваниях,
 -- о процессе лечения.
-- База данных состоит из 10 таблиц, которые включают в себя: 

-- 1. список лечащих врачей(фио, дата рождения, паспорт, телефон) - dostors 
-- 2. список пациентов (фио, дата рождения, паспорт, телефон) -patients
-- 3. список врачебных специальностей- speciality
-- 4. список лекарственных препаратов(название, побочные эффекты) - drugs
-- 5. список заболеваний - deseases
-- 6. список процедур медицинского центра(наименование, стоимость)-medical_procedures
-- 7. таблица специальностей врачей, в которой поля из списка врачебных специальностей сопоставляются с сотрудниками клиники из списка врачей
-- (связь с таблицами doctors, specialities осуществляется через внешние ключи doctors(id), specialities(id))  - personel_speciality
-- 8. таблица с процедурами, на которые записаны пациенты, которая связывается через внешние ключи с таблицами doctors, patiemts, procedures и 
-- содержит информацию о процедуре, пациенте, назначившем процедуру враче и времени процеуры - patient_procedures
-- 9. таблица со списком записей на прием к врачу (связь через внешние ключи с таблицами doctors, patients) - appointment
-- 10. таблица с назначенным лечением (информация о назначнных лекарствах, о болезни, о лечащем враче, связь через внешние ключи с таблицами doctors,
-- patients, drugs, deseases) - treatmen


drop database if exists medical_db;

create database medical_db;
use medical_db;
drop table  if exists doctors;

create table doctors  -- база докторов мед. центра
  (id int unsigned not null auto_increment primary key,
  firstname varchar(50),
  lastnme varchar(50),
  birthdate date,
  passport bigint unsigned unique,
  phone bigint unsigned unique
  );
drop table  if exists patients;
create table patients -- база пациентов
  (id bigint unsigned not null auto_increment primary key,
  firstname varchar(50),
  lastnme varchar(50),
  birthdate date,
  passport bigint unsigned unique,
  phone bigint unsigned unique
  );
  
drop table  if exists speciality;
create table speciality -- список врачебных специальностей 
  (id int unsigned not null auto_increment primary key,
  speciality_name varchar(50),
  INDEX speciality_name_idx(speciality_name)
  );
 drop table  if exists drugs;
create table drugs -- список лекарственных препаратов
  (id int unsigned not null auto_increment primary key,
  drug_name varchar(50),
  side_effects varchar(255),
  INDEX drug_name_idx(drug_name)
 );
drop table  if exists deseases;
create table deseases -- заболеваний
  (id int unsigned not null auto_increment primary key,
  deasese_name varchar(255),
  INDEX desease_name_idx(deasese_name)
  );
 drop table  if exists medical_procedures;
 create table medical_procedures -- медицинские процедуры
  (id int unsigned not null auto_increment primary key,
  medical_procedure varchar(50),
  price decimal(8,2),
   INDEX medical_procedure_idx(medical_procedure)
 );
 
drop table  if exists personel_speciality;
create table personel_speciality -- список врачей мед.центра с соотвествующими их профилю специальностями
  (doctor_id int unsigned not null,
  speciality_id int unsigned not null,
  -- PRIMARY KEY (doctor_id, speciality_id),
  foreign key (doctor_id) references doctors(id),
  foreign key (speciality_id) references speciality(id)
  );
  drop table  if exists patient_procedures;
 create table patient_procedures -- список пациентов, которым назначены проедуры
  (id int unsigned not null auto_increment primary key,
  medical_procedure_id int unsigned not null,
  patient_id bigint unsigned not null,
  doctor_id int unsigned not null,
  pr_date datetime default now(),
  source_of_payment ENUM('patient', 'compulsory_insuarance', 'voluntary_insuarance'),
  foreign key (doctor_id) references doctors(id),
  foreign key (patient_id) references patients(id),
  foreign key (medical_procedure_id) references medical_procedures(id)
 );
drop table  if exists appointment;
create table appointment -- список записей пациентов к врачу
  (id serial,
  patient_id bigint unsigned not null,
  doctor_id int unsigned not null,
  app_date datetime default now(),
  foreign key (doctor_id) references doctors(id),
  foreign key (patient_id) references patients(id)
  ); 
drop table  if exists treatment;
create table treatment -- выписанное лечение
 (id int unsigned not null auto_increment primary key,
  patient_id bigint unsigned not null,
  doctor_id int unsigned not null,
  complaints varchar(1000),
  prescription varchar(1000),
  diagnoses int unsigned not null,
  drugs_prescribed int unsigned not null,
  created_at datetime default now(),
  foreign key (doctor_id) references doctors(id),
  foreign key (patient_id) references patients(id),
  foreign key (drugs_prescribed) references drugs(id),
  foreign key (diagnoses) references deseases(id)
  );

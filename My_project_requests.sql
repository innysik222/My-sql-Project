use medical_db;

 -- 1.Скрипты характерных выборок (Join, group by)

  -- i вывести средний возраст пациентов, с гастритом
 select avg(timestampdiff(year,p.birthdate, now())) as av_gastritis_age from patients as p
 inner join treatment as t 
 on p.id=t.id
 inner join deseases as d 
 on d.id=t.diagnoses
 where d.deasese_name='gastritis';
 

 -- ii вывсети лекарство, которые выписывали чаще всего

select count(*), drug_name from treatment as t 
inner join drugs as d
on t.drugs_prescribed=d.id
group by drugs_prescribed 
order by count(*) desc limit 2;



 -- iii посчитать сумму, потраченную на сдачу крови

select sum(mp.price), mp.medical_procedure from medical_procedures as mp
inner join patient_procedures pp on mp.id=pp.medical_procedure_id 
group by mp.medical_procedure 
having  mp.medical_procedure ='blood collection';

-- 2. Представления


 -- i. вывести представление списка врачей, с суммарным количеством приемов (сортировка по убыванию)
CREATE or replace VIEW count_doctor__appointments
AS 
select count(*), concat(d.firstname, ' ', d.lastnme) from doctors as d
inner join appointment a on d.id=a.doctor_id 
group by a.doctor_id
order by count(*) desc;
 
select * from count_doctor__appointments limit 2;

-- ii вывести представление списка пациентов, которые самостоятельно опалчивали процедуры
CREATE or replace VIEW self_paid__patients
AS  
select concat(p.firstname, ' ', p.lastnme)  from patients as p
inner join patient_procedures as pp 
on p.id =pp.patient_id 
where pp.source_of_payment ='patient';

select * from self_paid__patients;

-- 3. Процедура/Функция

 -- i создать процедуру, которая выбирает список пациентов, которым можно рекомендовать лечение по программе "профилактика жкт болезней"
 -- 1. в диагнозе фигурирует коды болезней (1,2,3,4)
   -- 2. назначен прием к доктору, специальность которого 2
 -- 3.записаны на процедуры (1,2, 3, 9)

DROP PROCEDURE IF EXISTS medical_db.gastro_treatment_rec;

DELIMITER $$
$$
CREATE PROCEDURE medical_db.gastro_treatment_rec()
begin
	select distinct patient_id from treatment as t
	inner join deseases d 
	on t.diagnoses =d.id 
	where d.deasese_name in('reflux', 'gastritis','iBS', 'pancreatitis')
	union
	select distinct patient_id from appointment a
	inner join personel_speciality ps
	on a.doctor_id =ps.doctor_id 
	inner join speciality s
	on s.id =ps.speciality_id 
	where s.speciality_name ='gastroenterologist'
	
	union 
	
	select distinct patient_id from patient_procedures pp 
	inner join medical_procedures mp 
	    on pp.medical_procedure_id=mp.id 
	where mp.medical_procedure in ('colonoscopy', 'gastroscopy', 'mri stomach', 'stomach ct');
END$$
DELIMITER ;



call gastro_treatment_rec();

  -- ii создать функцию,  которая выводит долю затрат по источнику дмс на процедуры в общей доле затрат 

DROP FUNCTION IF EXISTS payment_source_percentage;

DELIMITER // 
CREATE FUNCTION payment_source_percentage()
RETURNS FLOAT READS SQL DATA
  BEGIN

    DECLARE total int;
    DECLARE v_costs int;
    -- DECLARE c_costs int;
    -- DECLARE p_costs int;
    DECLARE `v_result` FLOAT;
    -- DECLARE `c_result` FLOAT;
    -- DECLARE `p_result` FLOAT;
    
-- 
    SET total = (select sum(cnt)  from (select count(*) as cnt  from patient_procedures pp 

group by pp.source_of_payment) as t1);

    SET v_costs = (select cnt from (select count(*) as cnt  from patient_procedures pp 

group by pp.source_of_payment
having pp.source_of_payment='voluntary_insuarance') as t2);

     -- SET c_costs = (select cnt from (select count(*) as cnt  from patient_procedures pp 

-- group by pp.source_of_payment
-- having pp.source_of_payment='compulsory_insuarance') as t3);

    -- SET p_costs = (select cnt from (select count(*) as cnt  from patient_procedures pp 

-- group by pp.source_of_payment
-- having pp.source_of_payment='patient') as t4);   
    
    set `v_result`=v_costs/total;
    -- set `c_result`=c_costs/total;
    -- set `p_result`=p_costs/total;

-- 
	return `v_result`;
	
     -- return `c_result`;
    
     -- return `p_result`;

  END//
DELIMITER ;

select payment_source_percentage();




create table PLAN_DESCRIPTIONS (
   id INT NOT NULL,
   plan_id VARCHAR(30) NOT NULL PRIMARY KEY,   
   plan_name VARCHAR(30) NOT NULL,
   coverage_type VARCHAR(30) NOT NULL,
   estimated_premium double NOT NULL,
   annual_deductible_individual double NOT NULL,
   annual_deductible_family double NOT NULL,
   CONSTRAINT uc_PlanID UNIQUE (plan_Id)
);

insert into plan_descriptions values('P001', 'Bronze 6000/40%/HAS', 'Family', 962.00, 6000.00, 12000.00);
insert into plan_descriptions values('P002', 'Bronze 5000/50', 'Family', 1017.00, 5000.00, 10000.00);
insert into plan_descriptions values('P003', 'Bronze 4000/20', 'Family', 1045.67, 4000.00, 8000.00);

create table PLAN_COVERAGE (
   id INT NOT NULL,
   main_category varchar(100) NOT NULL,
   sub_category  varchar(500) NOT NULL,
   plan_id VARCHAR(30) NOT NULL,
   coverage_description VARCHAR(200) NOT NULL,
   coverage_amount double,
   is_percentage varchar(3),
   PRIMARY KEY(main_category, sub_category, plan_id),
   FOREIGN KEY (plan_id) REFERENCES PLAN_DESCRIPTIONS(plan_id)
);

insert into plan_coverage values('Preventive Care', 'ROUTINE PHYSICAL EXAM, MAMMOGRAMS, ETC.', 'P001', 'No Charge', 0.00, 'No');
insert into plan_coverage values('Preventive Care', 'ROUTINE PHYSICAL EXAM, MAMMOGRAMS, ETC.', 'P002', 'No Charge', 0.00, 'No');
insert into plan_coverage values('Preventive Care', 'ROUTINE PHYSICAL EXAM, MAMMOGRAMS, ETC.', 'P003', 'No Charge', 0.00, 'No');

insert into plan_coverage values('Outpatient Services', 'PRIMARY CARE OFFICE VISIT, X-RAYS, MRI, CT, PET, OUTPATIENT SURGERY', 'P001', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Outpatient Services', 'PRIMARY CARE OFFICE VISIT, X-RAYS, MRI, CT, PET, OUTPATIENT SURGERY', 'P002', '50% AFTER DEDUCTIBLE', 50, 'Yes');
insert into plan_coverage values('Outpatient Services', 'PRIMARY CARE OFFICE VISIT, X-RAYS, MRI, CT, PET, OUTPATIENT SURGERY', 'P003', '60% AFTER DEDUCTIBLE', 60, 'Yes');

insert into plan_coverage values('Outpatient Services', 'SPECIALTY CARE OFFICE VISIT', 'P001', '70% AFTER DEDUCTIBLE', 70, 'Yes');
insert into plan_coverage values('Outpatient Services', 'SPECIALTY CARE OFFICE VISIT', 'P002', '80% AFTER DEDUCTIBLE', 80, 'Yes');
insert into plan_coverage values('Outpatient Services', 'SPECIALTY CARE OFFICE VISIT', 'P003', '90% AFTER DEDUCTIBLE', 90, 'Yes');

insert into plan_coverage values('Outpatient Services', 'LAB TESTS', 'P001', '80% AFTER DEDUCTIBLE', 80, 'Yes');
insert into plan_coverage values('Outpatient Services', 'LAB TESTS', 'P002', '90% AFTER DEDUCTIBLE', 90, 'Yes');
insert into plan_coverage values('Outpatient Services', 'LAB TESTS', 'P003', '100% AFTER DEDUCTIBLE', 100, 'Yes');

insert into plan_coverage values('Outpatient Services', 'MENTAL HEALTH VISIT', 'P001', '60% AFTER DEDUCTIBLE', 60, 'Yes');
insert into plan_coverage values('Outpatient Services', 'MENTAL HEALTH VISIT', 'P002', '70% AFTER DEDUCTIBLE', 70, 'Yes');
insert into plan_coverage values('Outpatient Services', 'MENTAL HEALTH VISIT', 'P003', '80% AFTER DEDUCTIBLE', 80, 'Yes');

insert into plan_coverage values('Inpatient Hospital Care', 'ROOM AND BOARD, SURGERY, ANESTHESIA, X-RAYS, LAB TESTS, MEDICATIONS, MENTAL HEALTH CARE', 'P001', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Inpatient Hospital Care', 'ROOM AND BOARD, SURGERY, ANESTHESIA, X-RAYS, LAB TESTS, MEDICATIONS, MENTAL HEALTH CARE', 'P002', '50% AFTER DEDUCTIBLE', 50, 'Yes');
insert into plan_coverage values('Inpatient Hospital Care', 'ROOM AND BOARD, SURGERY, ANESTHESIA, X-RAYS, LAB TESTS, MEDICATIONS, MENTAL HEALTH CARE', 'P003', '60% AFTER DEDUCTIBLE', 60, 'Yes');

insert into plan_coverage values('Maternity', 'ROUTINE PRENATAL CARE VISIT, FIRST POSTPARTUM VISIT, DELIVERY AND INPATIENT WELL-BABY CARE', 'P001', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Maternity', 'ROUTINE PRENATAL CARE VISIT, FIRST POSTPARTUM VISIT, DELIVERY AND INPATIENT WELL-BABY CARE', 'P002', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Maternity', 'ROUTINE PRENATAL CARE VISIT, FIRST POSTPARTUM VISIT, DELIVERY AND INPATIENT WELL-BABY CARE', 'P003', '30% AFTER DEDUCTIBLE', 30, 'Yes');

insert into plan_coverage values('Emergency And Urgent Care', 'AMBULANCE SERVICES', 'P001', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Emergency And Urgent Care', 'AMBULANCE SERVICES', 'P002', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Emergency And Urgent Care', 'AMBULANCE SERVICES', 'P003', '30% AFTER DEDUCTIBLE', 30, 'Yes');

insert into plan_coverage values('Emergency And Urgent Care', 'EMERGENCY DEPARTMENT VISIT', 'P001', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Emergency And Urgent Care', 'EMERGENCY DEPARTMENT VISIT', 'P002', '50% AFTER DEDUCTIBLE', 50, 'Yes');
insert into plan_coverage values('Emergency And Urgent Care', 'EMERGENCY DEPARTMENT VISIT', 'P003', '60% AFTER DEDUCTIBLE', 60, 'Yes');

insert into plan_coverage values('Emergency And Urgent Care', 'URGENT CARE VISIT', 'P001', '40% AFTER DEDUCTIBLE', 40, 'Yes');
insert into plan_coverage values('Emergency And Urgent Care', 'URGENT CARE VISIT', 'P002', '$100', 100, 'No');
insert into plan_coverage values('Emergency And Urgent Care', 'URGENT CARE VISIT', 'P003', '$120', 120, 'No');

create table Policy (
   id INT NOT NULL,
   policy_id INT NOT NULL,
   policy_holder_id INT NOT NULL,
   first_name varchar(50) NOT NULL,
   last_name varchar(50) NOT NULL,
   plan_id varchar(30) NOT NULL,
   coverage_start_date date NOT NULL,
   coverage_end_date date,
   individual_accumulated double NOT NULL,
   family_accumulated double NOT NULL,
   PRIMARY KEY(policy_id, policy_holder_id),
   FOREIGN KEY (plan_id) REFERENCES PLAN_DESCRIPTIONS(plan_id)
); 

insert into policy values(100001, 1000011, 'Sam', 'Collins', 'P001', str_to_date('01/01/2004', '%m/%d/%Y'),null,0.00,0.00);
insert into policy values(100001, 1000012, 'Jina', 'Collins', 'P001', str_to_date('12/05/2008', '%m/%d/%Y'),null,0.00,0.00);
insert into policy values(100001, 1000013, 'Nancy', 'Collins', 'P001', str_to_date('5/6/2010', '%m/%d/%Y'),null,0.00,0.00);
insert into policy values(100001, 1000014, 'Jack', 'Collins', 'P001', str_to_date('7/8/2013', '%m/%d/%Y'),null,0.00,0.00);
insert into policy values(100002, 1000021, 'Daniel', 'Hayer', 'P002', str_to_date('1/1/2012', '%m/%d/%Y'),null,4000.00,4000.00);
insert into policy values(100003, 1000031, 'Sally', 'Adams', 'P001', str_to_date('1/1/2016', '%m/%d/%Y'),null,2500.00,2500.00);
insert into policy values(100004, 1000041, 'Jacke', 'Seegers', 'P003', str_to_date('1/1/2009', '%m/%d/%Y'),str_to_date('5/31/2016', '%m/%d/%Y'),5560.42,5560.42);
insert into policy values(100005, 1000051, 'Tom', 'Haskel', 'P001', str_to_date('1/1/2011', '%m/%d/%Y'),null,6712.34,6712.34);
insert into policy values(100006, 1000061, 'San', 'Milred', 'P001', str_to_date('1/5/2016', '%m/%d/%Y'),null,3250.61,3250.61);
insert into policy values(100007, 1000071, 'Mack', 'Lee', 'P003', str_to_date('12/6/2011', '%m/%d/%Y'),null,4460.82,4460.82);

create table Transactions_Processed (
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   policy_id INT NOT NULL,
   policy_holder_id INT NOT NULL,
   date_of_service date NOT NULL,
   main_category varchar(100) NOT NULL,
   sub_category  varchar(500) NOT NULL,   
   billed_amount_USD double NOT NULL,
   policy_holder_pays_USD double,
   plan_pays_USD double,
   coverage_description VARCHAR(200),
   individual_accumulated double,
   family_accumulated double,
   error_code varchar(10),
   error_message varchar(100),
   processing_message varchar(300)
);

























CREATE TABLE Employee (
  Emp_id int primary key,
  first_name varchar,
  last_name varchar,
  birth_date date,
  sex varchar(1),
  salary decimal,
  super_id int,
  branch_id int
);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (100, 'David', 'Wallace', '1967-11-17', 'M', 250000.00, NULL, 1);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000.00, 100, 1);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (102, 'Michael', 'Scott', '1964-03-15', 'M', 75000.00, 100, 2);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (103, 'Angela', 'Martin', '1971-06-25', 'F', 63000.00, 102, 2);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000.00, 102, 2);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000.00, 102, 2);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (106, 'Josh', 'Porter', '1969-09-05', 'M', 78000.00, 100, 3);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000.00, 106, 3);

INSERT INTO Employee (Emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000.00, 106, 3);


CREATE TABLE branch (
  branch_id INT primary key,
  super_id INT unique,
  branch_name VARCHAR,
  mgr_id INT,
  mgr_start_date DATE
);

INSERT INTO branch (branch_id, super_id, branch_name, mgr_id, mgr_start_date)
VALUES
  (1, 100, 'Corporate', 100, '2006-02-09'),
  (2, 102, 'Scranton', 102, '1992-04-06'),
  (3, 106, 'Stamford', 106, '1998-02-13');



  CREATE TABLE client (
  client_id INT unique,
  mgr_id INT primary key,
  client_name VARCHAR,
  branch_id INT
);

INSERT INTO client (client_id, mgr_id, client_name, branch_id)
VALUES
  (400, 100, 'Dunmore Highschool', 2),
  (401, 102, 'Lackawana Country', 2),
  (402, 103, 'FedEx', 3),
  (403, 104, 'John Daly Law, LLC', 3),
  (404, 105, 'Scranton Whitepages', 2),
  (405, 106, 'Times Newspaper', 3),
  (406, 107, 'FedEx', 2);



  CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales DECIMAL,
  primary key (emp_id, client_id)
);

INSERT INTO works_with (emp_id, client_id, total_sales)
VALUES
  (105, 400, 55000.00),
  (102, 401, 267000.00),
  (108, 402, 22500.00),
  (107, 403, 5000.00),
  (108, 403, 12000.00),
  (105, 404, 33000.00),
  (107, 405, 26000.00),
  (102, 406, 15000.00),
  (105, 406, 130000.00);



CREATE TABLE Branch_Supplier (
  branch_id INT primary key,
  supplier_name VARCHAR unique,
  supply_type VARCHAR
);

INSERT INTO Branch_Supplier (branch_id, supplier_name, supply_type)
VALUES
  (1, 'Hammer Mill', 'Paper'),
  (2, 'Uni-ball', 'Writing Utensils'),
  (3, 'Patriot Paper', 'Paper'),
  (4, 'J.T. Forms & Labels', 'Custom Forms'),
  (5, 'Uni-bal', 'Writing Utensils'),
  (6, 'Hammer Mil', 'Paper'),
  (7, 'Stamford Lables', 'Custom Forms');


ALTER TABLE Employee
ADD CONSTRAINT fk_super_id
FOREIGN KEY (super_id)
REFERENCES branch (super_id);

ALTER TABLE Employee
ADD CONSTRAINT fk_branch_id
FOREIGN KEY (branch_id)
REFERENCES branch (branch_id);

ALTER TABLE branch
ADD CONSTRAINT fk_mgr_id
FOREIGN KEY (mgr_id)
REFERENCES client (mgr_id);

ALTER TABLE client
ADD CONSTRAINT fk_branch_id
FOREIGN KEY (branch_id)
REFERENCES branch_supplier (branch_id);

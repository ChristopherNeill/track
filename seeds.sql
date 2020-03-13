INSERT INTO department (name)
VALUES ("Sales"), ("Accounting"), ("Security"), ("HR"), ("IT");

INSERT INTO role (title, salary, department_id)
VALUES ("Engineer", 90000, 5), ("Security", 75000, 3), ("IT Intern", 22000, 5), ("Project Manager", 120000, 5), ("Senior Accountant", 220000, 2), ("Junior Accountant", 75000, 2), ("Accountant Intern", 27000, 2), ("Sales Lead", 120000, 1), ("Sales Person", 75000, 1), ("Sales Intern", 12000, 1), ("HR Manager", 42000, 4);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Robin", "Banks", 3, null), ("Peter", "Pants", 1, 3), ("Barry", "Wine", 2, 3), ("Bud", "Wiser", 4, null), ("WiLL", "Power", 5, 4), ("Dan", "Druff", 6, 4), ("Gerry", "Atrik", 7, null), ("Ella", "Vator", 8, 7), ("Lynn", "Guini", 9, 7);

-- ### View all employees

SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name, role.salary
FROM ((department INNER JOIN role ON role.department_id = department.id) INNER JOIN employee ON employee.role_id = role.id);

-- ### View all employees by department

SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name, role.salary
FROM ((department INNER JOIN role ON role.department_id = department.id) INNER JOIN employee ON employee.role_id = role.id) WHERE department.name = "IT";

-- ### Return all employees in same department as new hire (by their role)
-- ##### 1. Get department name from role title 
SELECT role.department_id, department.name FROM role INNER JOIN department ON role.department_id = department.id WHERE (role.title = "Engineer");
-- ##### 2. Get employees from department name
SELECT employee.first_name, employee.last_name
FROM ((department INNER JOIN role ON role.department_id = department.id) INNER JOIN employee ON employee.role_id = role.id) WHERE department.name = "IT";
CREATE TABLE Hub_Students (
    student_id SERIAL PRIMARY KEY,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE Hub_Practicals (
    practical_id SERIAL PRIMARY KEY,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE Hub_Assignments (
    assignment_id SERIAL PRIMARY KEY,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE Link_Student_Assignment (
    student_id INT REFERENCES Hub_Students(student_id),
    assignment_id INT REFERENCES Hub_Assignments(assignment_id),
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(student_id, assignment_id)
);

CREATE TABLE Sat_Students (
    student_id INT REFERENCES Hub_Students(student_id),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Sat_Practicals (
    practical_id INT REFERENCES Hub_Practicals(practical_id),
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Sat_Assignments (
    assignment_id INT REFERENCES Hub_Assignments(assignment_id),
    practical_id INT REFERENCES Hub_Practicals(practical_id),
    due_date DATE NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Sat_Stages (
    stage_id SERIAL PRIMARY KEY,
    assignment_id INT REFERENCES Hub_Assignments(assignment_id),
    stage_name VARCHAR(50) NOT NULL CHECK (stage_name IN ('В процессе', 'Прикреплено для оценивания', 'Оценено')),
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Sat_Evaluations (
    evaluation_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Hub_Students(student_id),
    assignment_id INT REFERENCES Hub_Assignments(assignment_id),
    evaluation_date DATE NOT NULL,
    grade INTEGER CHECK (grade BETWEEN 0 AND 5),
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

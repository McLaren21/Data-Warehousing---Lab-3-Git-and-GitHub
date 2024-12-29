CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Practicals (
    practical_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE Assignments (
    assignment_id SERIAL PRIMARY KEY,
    practical_id INT REFERENCES Practicals(practical_id),
    due_date DATE NOT NULL
);
CREATE TABLE Stages (
    stage_id SERIAL PRIMARY KEY,
    assignment_id INT REFERENCES Assignments(assignment_id),
    stage_name VARCHAR(50) NOT NULL CHECK (stage_name IN ('В процессе', 'Прикреплено для оценивания', 'Оценено'))
);
CREATE TABLE Evaluations (
    evaluation_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    assignment_id INT REFERENCES Assignments(assignment_id),
    evaluation_date DATE NOT NULL,
    grade INTEGER CHECK (grade BETWEEN 0 AND 5)
);

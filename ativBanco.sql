
CREATE SCHEMA atividade10;

USE atividade10;

CREATE TABLE aluno(
aluno_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
curso VARCHAR(50) NOT NULL,
nivel VARCHAR(20) NOT NULL,
idade INT NOT NULL
);

CREATE TABLE turma(
turma_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nometurma VARCHAR(100) NOT NULL,
sala VARCHAR(100) NOT NULL,
horario VARCHAR(20) NOT NULL
);


CREATE TABLE matricula(
matricula_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
aluno_id INT NOT NULL,
turma_id INT NOT NULL,
nota_1 DOUBLE NOT NULL,
nota_2 DOUBLE NOT NULL,
nota_3 DOUBLE NOT NULL,
nota_final DOUBLE NOT NULL,
nr_faltas INT,
CONSTRAINT fk_aluno FOREIGN KEY (aluno_id) REFERENCES aluno(aluno_id) ON DELETE CASCADE,
CONSTRAINT fk_turma FOREIGN KEY (turma_id) REFERENCES turma(turma_id) ON DELETE CASCADE
);




INSERT INTO aluno (nome, curso, nivel, idade) VALUES
('PATOLINO', 'Engenharia', 'Graduação', 21),
('Maria Santos', 'Medicina', 'Graduação', 22),
('Pedro Oliveira', 'Direito', 'Graduação', 23),
('Ana Costa', 'Arquitetura', 'Graduação', 20),
('Aluno sem turma', 'Arquitetura', 'Graduação', 24),
('Carlos Pereira', 'Computação', 'Graduação', 19);

INSERT INTO turma (nometurma, sala, horario) VALUES
('Matemática Básica', 'Sala 101', '08:00 - 10:00'),
('Física Aplicada', 'Sala 102', '10:00 - 12:00'),
('História do Direito', 'Sala 103', '13:00 - 15:00'),
('Química Orgânica', 'Sala 104', '15:00 - 17:00'),
('Introdução à Programação', 'Sala 105', '17:00 - 19:00');

INSERT INTO matricula (aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, nr_faltas) VALUES
(1, 1, 8.5, 9.0, 7.0, 8.0, 2),
(2, 2, 7.5, 8.5, 9.0, 8.3, 1),
(3, 3, 9.0, 8.0, 9.5, 8.8, 0),
(4, 4, 6.0, 7.5, 8.0, 7.2, 3),
(5, 5, 8.0, 8.5, 9.0, 8.5, 1);


1. Listar nomes de todos os alunos:
SELECT nome FROM aluno;

2. Listar nomes e números das matrículas dos alunos:
SELECT nome,matricula_id FROM matricula INNER JOIN aluno ON aluno.aluno_id=matricula.aluno_id;

3. Listar alunos sem turma:
SELECT aluno.nome,turma.nometurma 
FROM aluno
LEFT JOIN matricula ON aluno.aluno_id = matricula.aluno_id
LEFT JOIN turma ON turma.turma_id = matricula.turma_id
WHERE matricula.aluno_id IS NULL
;

4. Listar alunos matriculados na turma número 4:
SELECT aluno.nome,aluno.aluno_id 
FROM aluno
INNER JOIN matricula ON aluno.aluno_id = matricula.aluno_id
INNER JOIN turma ON turma.turma_id = matricula.turma_id
WHERE matricula.turma_id=4
;

5. Determinar o horário da turma de 'PATOLINO':
SELECT aluno.nome,turma.horario
FROM aluno
INNER JOIN matricula ON aluno.aluno_id = matricula.aluno_id
INNER JOIN turma ON turma.turma_id = matricula.turma_id
WHERE aluno.nome='PATOLINO'
;


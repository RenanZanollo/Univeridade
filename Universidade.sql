USE universidade;

-- Criação da tabela Curso       
CREATE TABLE Curso (
  id_curso		int PRIMARY KEY auto_increment,
  nome_curso	varchar(50)
);

-- Criação da tabela Professores       
CREATE TABLE Professores (
  professor_id 		int PRIMARY KEY auto_increment,
  nome_professor	varchar(50),
  materia			varchar(50)
);

-- Criação da tabela Alunos   
CREATE TABLE Alunos (
  id_aluno			int PRIMARY KEY auto_increment,
  nome_aluno		varchar(60),
  cpf				varchar(60),
  email				varchar(60),
  
  fk_curso			varchar(60),
  foreign key (fk_curso) 	references curso(nome_curso)
);

-- Procedure para inserir um curso
DELIMITER $$
CREATE PROCEDURE InserirCurso(
    IN p_id_curso INT,
    IN p_nome_curso VARCHAR(50)
)
BEGIN
    INSERT INTO Curso (id_curso, nome_curso) VALUES (p_id_curso, p_nome_curso);
END $$
DELIMITER ;

-- Procedure para selecionar todos os cursos
DELIMITER $$
CREATE PROCEDURE SelecionarCursos()
BEGIN
    SELECT * FROM Curso;
END $$
DELIMITER ;

-- Procedure para inserir um aluno
DELIMITER $$
CREATE PROCEDURE InserirAluno(
     NomeAluno 	VARCHAR(60),
     CpfAluno 	VARCHAR(60),
     EmailAluno	VARCHAR(60),
     curso		VARCHAR(60)    
)
BEGIN
	set @curso_id = (select id from Curso where nome_curso = curso);
    SET @email = CONCAT(NomeAluno, '@gmail.com');
    INSERT INTO Alunos VALUES (null, NomeAluno, CpfAluno, @curso_id, @email );
END $$
DELIMITER ;

-- Chamando a procedure para inserir cursos
CALL InserirCurso(1, 'Engenharia da Computação');
CALL InserirCurso(2, 'ADS');
CALL InserirCurso(3, 'Engenharia Mecatrônica');

-- Inserindo dados na tabela Professores
INSERT INTO Professores (professor_id, nome_professor, materia)
VALUES 
    (1, 'Girafales', 'Calculo 1'),
    (2, 'Ohata', 'Banco de Dados'),
    (3, 'Nivaldo', 'Fenomenos Eletricos'),
    (4, 'Cleiton', 'Calculo 2'),
    (5, 'Evandro', 'Empreendedorismo');

-- Inserindo dados na tabela Alunos
CALL InserirAluno('Immanuel Kant', '351.736.230-12', 1, '');
CALL InserirAluno('Immanuel Kant', '922.452.700-02', 2, '');
CALL InserirAluno('Renan Zanollo', '769.019.790-61', 3, '');
CALL InserirAluno('Isabela Queiroz', '026.643.890-33', 3, '');
CALL InserirAluno('Daniel Ohata', '913.059.700-55', 2, '');
CALL InserirAluno('Ada Lovelace', '968.313.920-59', 1, '');
CALL InserirAluno('Claude Shannon', '820.820.720-96', 1, '');
CALL InserirAluno('Charles Darwin', '508.768.200-62', 2, '');
CALL InserirAluno('Marie Curie', '989.956.550-46', 3, '');
CALL InserirAluno('Carl Sagan', '185.925.000-95', 3, '');
CALL InserirAluno('Tim Berners-Lee', '271.055.040-72', 2, '');
CALL InserirAluno('Richard Feynman', '848.166.400-61', 2, '');

-- Procedure para selecionar um curso específico pelo ID
DELIMITER $$
CREATE PROCEDURE SelecionarCursoPorID(
    IN p_id_curso INT
)
BEGIN
    SELECT * FROM Curso WHERE id_curso = p_id_curso;
END $$
DELIMITER ;

-- Chamando a procedure para selecionar um curso específico pelo ID
CALL SelecionarCursoPorID(3);

-- Procedure para selecionar todos os alunos
DELIMITER $$
CREATE PROCEDURE SelecionarAlunos()
BEGIN
    SELECT * FROM Alunos;
END $$ 	 	
DELIMITER ;

-- Chamando a procedure para selecionar todos os alunos
CALL SelecionarAlunos();

select*from Curso;
select*from Professores;
select*from Alunos;

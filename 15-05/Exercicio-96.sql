DROP DATABASE ex96;
CREATE DATABASE ex96;
USE ex96;

CREATE TABLE Departamento(
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(70)
);

CREATE TABLE Empregado(
	Matricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(70),
	Endereco VARCHAR(90),
	Salario DECIMAL(10,2),
	Sexo VARCHAR(1),
	Dt_Nascimento DATE,
	idDepartamento INT,
	FOREIGN KEY (idDepartamento) REFERENCES Departamento(Codigo),
	idSupervisor INT,
	FOREIGN KEY (idSupervisor) REFERENCES Empregado(Matricula)
);

CREATE TABLE Dependente(
	idDependente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(70),
	Grau_Parentesco VARCHAR(2),
	Sexo VARCHAR(1),
	Dt_Dascimento DATE,
	idEmpregado INT,
	FOREIGN KEY (idEmpregado) REFERENCES Empregado(Matricula)
);

CREATE TABLE Beneficio_Social(
	idBeneficio INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Beneficicio_Depedente(
	idBeneficio INT,
	FOREIGN KEY (idBeneficio) REFERENCES Beneficio_Social(idBeneficio),
	idDependente INT,
	FOREIGN KEY (idDependente) REFERENCES Dependente(idDependente)
);


CREATE TABLE Projeto(
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(70),
	idDepartamento INT,
	FOREIGN KEY (idDepartamento) REFERENCES Departamento(Codigo)
);

CREATE TABLE Projeto_Empregado(
	idEmpregado INT,
	FOREIGN KEY (idEmpregado) REFERENCES Empregado(Matricula),
	idProjeto INT,
	FOREIGN KEY (idProjeto) REFERENCES Projeto(Codigo)
);

CREATE TABLE Cidade(
	idCidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(70)
);

CREATE TABLE Projeto_Alocado(
	idProjeto INT,
	FOREIGN KEY (idProjeto) REFERENCES Projeto(Codigo),
	idDepartamento INT,
	FOREIGN KEY (idDepartamento) REFERENCES Departamento(Codigo),
	idCidade INT,
	FOREIGN KEY (idCidade) REFERENCES Cidade(idCidade)
);

CREATE TABLE Empregado_Gerencia_Departamento(
	idDepartamento INT,
	FOREIGN KEY (idDepartamento) REFERENCES Departamento(Codigo),
	idEmpregado INT,
	FOREIGN KEY (idEmpregado) REFERENCES Empregado(Matricula),
	Data_Gerencia DATE
);

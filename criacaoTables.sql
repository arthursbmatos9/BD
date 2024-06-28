CREATE TABLE Loja(
	CNPJ CHAR(14) PRIMARY KEY,
	NomeFantasia VARCHAR(25),
	Logradouro VARCHAR(100)
);

CREATE TABLE Departamento(
	ID INT PRIMARY KEY,
	Nome VARCHAR(25),
	Loja_CNPJ CHAR(14),
	FOREIGN KEY (Loja_CNPJ) REFERENCES Loja(CNPJ)
);

CREATE TABLE Funcionario(
	ID INT PRIMARY KEY,
	Nome VARCHAR(40),
	Email VARCHAR(40),
	Telefone CHAR(11),
	Salario FLOAT,
	Departamento_ID INT,
	FOREIGN KEY (Departamento_ID) REFERENCES Departamento(ID)
);

CREATE TABLE Dependente(
	ID INT PRIMARY KEY,
	Nome VARCHAR(40),
	Parentesco VARCHAR(10),
	Funcionario_ID INT,
	FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(ID)
);

CREATE TABLE Veiculo(
	Placa CHAR(7) PRIMARY KEY,
	Marca VARCHAR(15),
	Modelo VARCHAR(30),
	Cor VARCHAR(10),
	Ano INT,
	PrecoDiaria FLOAT,
	Loja_CNPJ CHAR(14),
	FOREIGN KEY (Loja_CNPJ) REFERENCES Loja(CNPJ)
);

CREATE TABLE Cliente(
	CPF CHAR(11) PRIMARY KEY,
	Nome VARCHAR(40),
	Email VARCHAR(40),
	Telefone CHAR(11)
);

CREATE TABLE Aluguel(
	ID INT PRIMARY KEY,
	DataInicio DATETIME,
	DataFim DATETIME,
	Cliente_CPF CHAR(11),
	Veiculo_Placa CHAR(7),
	FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(CPF),
	FOREIGN KEY (Veiculo_Placa) REFERENCES Veiculo(Placa)
);

CREATE TABLE Pagamento(
	ID INT PRIMARY KEY,
	ValorTotal FLOAT,
	Tipo VARCHAR(20),
	Status VARCHAR(10),
	Data DATETIME,
	Loja_CNPJ CHAR(14),
	Cliente_CPF CHAR(11),
	FOREIGN KEY (Loja_CNPJ) REFERENCES Loja(CNPJ),
	FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(CPF)
);


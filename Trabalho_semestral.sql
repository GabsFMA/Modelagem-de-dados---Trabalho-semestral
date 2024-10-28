--CRIAÇÃO DAS TABELAS--

CREATE TABLE TB_CLIENTE (
    ID_CLIENTE         		INT           		NOT NULL,
    ID_USUARIO         		INT           		NOT NULL,
    PRIMEIRO_NOME     	    VARCHAR(50)   	    NOT NULL,
    ULTIMO_NOME        	    VARCHAR(50)   	    NOT NULL,
    CPF                		VARCHAR(11)      	NOT NULL,
    SEXO               		VARCHAR(1),
    DATA_NASCIMENTO    	    DATE,

    PRIMARY KEY (ID_CLIENTE)
);

CREATE TABLE TB_CARTOES (
    ID_CARTAO          		INT           		NOT NULL,
    ID_CLIENTE         		INT           		NOT NULL,
    NOME_TITULAR       	    VARCHAR(100)  	NOT NULL,
    VALIDADE           		DATE          		NOT NULL,
    CVV                		VARCHAR(3)       	NOT NULL,
    NUMERO_CARTAO      	    VARCHAR(16)      	NOT NULL,
    AGENCIA            		VARCHAR(4)       	NOT NULL,
    CONTA              		VARCHAR(10)      	NOT NULL,

    PRIMARY KEY (ID_CARTAO),
    FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE(ID_CLIENTE)
);

CREATE TABLE TB_SERVICO (
    ID_SERVICO         		INT           		NOT NULL,
    VALOR              		DECIMAL(10, 2) 	    NOT NULL,
    NOME_SERVICO       	    VARCHAR(100)  	    NOT NULL,
    DESCRICAO          	    VARCHAR(255),

    PRIMARY KEY (ID_SERVICO)
);

CREATE TABLE TB_PRODUTO_TIPO (
    ID_PRODUTO_TIPO    	INT           		NOT NULL,
    DESCRICAO          	VARCHAR(100),

    PRIMARY KEY (ID_PRODUTO_TIPO)
);

CREATE TABLE TB_PRODUTO (
    ID_PRODUTO         	INT           		NOT NULL,
    ID_PRODUTO_TIPO    	INT           		NOT NULL,
    VALOR              	DECIMAL(10, 2) 	    NOT NULL,
    NOME_PRODUTO       	VARCHAR(100)  	    NOT NULL,
    DESCRICAO          	VARCHAR(255),

    PRIMARY KEY (ID_PRODUTO),
    FOREIGN KEY (ID_PRODUTO_TIPO) REFERENCES TB_PRODUTO_TIPO(ID_PRODUTO_TIPO)
);

CREATE TABLE TB_PACOTE (
    ID_PACOTE          	INT           NOT NULL,
    ID_FORNECEDOR      	INT           NOT NULL,

    PRIMARY KEY (ID_PACOTE)
);

CREATE TABLE TB_PACOTE_PRODUTO (
    ID_PACOTE_PRODUTO  	INT           NOT NULL,
    ID_PRODUTO         	INT           NOT NULL,
    ID_PACOTE          	INT           NOT NULL,
    QUANTIDADE         	INT           NOT NULL,

    PRIMARY KEY (ID_PACOTE_PRODUTO),
    FOREIGN KEY (ID_PRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO),
    FOREIGN KEY (ID_PACOTE) REFERENCES TB_PACOTE(ID_PACOTE)
);

CREATE TABLE TB_CARRINHO (
    ID_CARRINHO        	INT           NOT NULL,
    ID_CLIENTE         	INT           NOT NULL,

    PRIMARY KEY (ID_CARRINHO)
);

CREATE TABLE TB_ENDERECO_TIPO (
    ID_ENDERECO_TIPO   	INT           NOT NULL,
    DESCRICAO          	VARCHAR(100),

    PRIMARY KEY (ID_ENDERECO_TIPO)
);

CREATE TABLE TB_FUNCIONARIO (
    ID_FUNCIONARIO     	INT           		NOT NULL,
    PRIMEIRO_NOME      	VARCHAR(50)   	    NOT NULL,
    ULTIMO_NOME        	VARCHAR(50)   	    NOT NULL,
    CPF                	VARCHAR(11)      	NOT NULL,

    PRIMARY KEY (ID_FUNCIONARIO)
);

CREATE TABLE TB_FORNECEDOR (
    ID_FORNECEDOR      	INT           		NOT NULL,
    ID_USUARIO         	INT           		NOT NULL,
    CNPJ               	VARCHAR(14)     	NOT NULL,
    NOME_EMPRESA       	VARCHAR(100),

    PRIMARY KEY (ID_FORNECEDOR)
);

CREATE TABLE TB_METODO_PAGAMENTO (
    ID_METODO          INT           		NOT NULL,
    NOME               VARCHAR(100),
    DESCRICAO          VARCHAR(255),

    PRIMARY KEY (ID_METODO)
);

CREATE TABLE TB_USUARIO (
    ID_USUARIO         	INT           		NOT NULL,
    EMAIL              	VARCHAR(100)  	    NOT NULL,
    SENHA              	VARCHAR(255)  	    NOT NULL,
    DATA_CRIACAO       	DATE          		NOT NULL,

    PRIMARY KEY (ID_USUARIO)
);

CREATE TABLE TB_ENDERECOS (
    ID_ENDERECO        	INT           		NOT NULL,
    ID_ENDERECO_TIPO   	INT           		NOT NULL,
    ID_USUARIO         	INT          		NOT NULL,
    NUMERO             	VARCHAR(10),
    RUA                	VARCHAR(100),
    LOGRADOURO         	VARCHAR(100),
    BAIRRO             	VARCHAR(100),
    CIDADE             	VARCHAR(100),

    PRIMARY KEY (ID_ENDERECO),
    FOREIGN KEY (ID_ENDERECO_TIPO) REFERENCES TB_ENDERECO_TIPO(ID_ENDERECO_TIPO),
    FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(ID_USUARIO)
);

CREATE TABLE TB_COMPRA (
    ID_COMPRA          	INT           		NOT NULL,
    ID_METODO          	INT           		NOT NULL,
    ID_CLIENTE         	INT           		NOT NULL,
    ID_ENDERECO        	INT           		NOT NULL,
    MOMENTO_ENTREGA    	TIMESTAMP    	    NOT NULL,
    MOMENTO_COMPRA     	TIMESTAMP     	    NOT NULL,
    VALOR_TOTAL        	DECIMAL(10, 2) 	    NOT NULL,

    PRIMARY KEY (ID_COMPRA),
    FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE(ID_CLIENTE),
    FOREIGN KEY (ID_METODO) REFERENCES TB_METODO_PAGAMENTO(ID_METODO),
    FOREIGN KEY (ID_ENDERECO) REFERENCES TB_ENDERECOS(ID_ENDERECO)
);

CREATE TABLE TB_PACOTE_COMPRA (
    ID_PACOTE_COMPRA   	INT           NOT NULL,
    ID_PACOTE          	INT           NOT NULL,
    ID_COMPRA          	INT           NOT NULL,

    PRIMARY KEY (ID_PACOTE_COMPRA),
    FOREIGN KEY (ID_COMPRA) REFERENCES TB_COMPRA(ID_COMPRA)
);

CREATE TABLE TB_CONTAS_BANCO (
    ID_CONTA           	INT           		NOT NULL,
    ID_FORNECEDOR      	INT           		NOT NULL,
    BANCO              	VARCHAR(100)  	    NOT NULL,
    AGENCIA            	VARCHAR(4)       	NOT NULL,
    NUM_CONTA          	VARCHAR(10)      	NOT NULL,

    PRIMARY KEY (ID_CONTA),
    FOREIGN KEY (ID_FORNECEDOR) REFERENCES TB_FORNECEDOR(ID_FORNECEDOR)
);

CREATE TABLE TB_CONTRATACAO_TIPO (
    ID_CONTRATO_TIPO   	INT           		NOT NULL,
    DESCRICAO          	VARCHAR(100),

    PRIMARY KEY (ID_CONTRATO_TIPO)
);

CREATE TABLE TB_CONTRATO (
    ID_CONTRATO        	INT           		NOT NULL,
    ID_COMPRA          	INT           		NOT NULL,
    TEXTO_CONTRATO     	VARCHAR2(500),

    PRIMARY KEY (ID_CONTRATO)
);

CREATE TABLE TB_PACOTE_SERVICO (
    ID_PACOTE_SERVICO  	INT           NOT NULL,
    ID_SERVICO         	INT           NOT NULL,
    ID_PACOTE          	INT           NOT NULL,
    QUANTIDADE         	INT           NOT NULL,

    PRIMARY KEY (ID_PACOTE_SERVICO),
    FOREIGN KEY (ID_PACOTE) REFERENCES TB_PACOTE(ID_PACOTE),
    FOREIGN KEY (ID_SERVICO) REFERENCES TB_SERVICO(ID_SERVICO)
);

CREATE TABLE TB_PACOTES_CARRINHO (
    ID_PACOTE_CARRINHO 			INT           	NOT NULL,
    ID_PACOTE          			INT           	NOT NULL,
    ID_CARRINHO        			INT           	NOT NULL,
    SELECIONADO_PARA_COMPRAR 	NUMBER(1),

    PRIMARY KEY (ID_PACOTE_CARRINHO),
    FOREIGN KEY (ID_CARRINHO) REFERENCES TB_CARRINHO(ID_CARRINHO),
    FOREIGN KEY (ID_PACOTE) REFERENCES TB_PACOTE(ID_PACOTE)
);

CREATE TABLE TB_FORNECEDOR_FUNCIONARIO (
    ID_FORNECEDOR      	INT           NOT NULL,
    ID_FUNCIONARIO     	INT           NOT NULL,
    ID_CONTRATO_TIPO   	INT           NOT NULL,

    PRIMARY KEY (ID_FORNECEDOR, ID_FUNCIONARIO, ID_CONTRATO_TIPO),
    FOREIGN KEY (ID_FUNCIONARIO) REFERENCES TB_FUNCIONARIO(ID_FUNCIONARIO),
    FOREIGN KEY (ID_FORNECEDOR) REFERENCES TB_FORNECEDOR(ID_FORNECEDOR)
);

CREATE TABLE TB_TELEFONES (
    ID_TELEFONE        	INT           		NOT NULL,
    ID_USUARIO         	INT           		NOT NULL,
    NUMERO_TELEFONE    	VARCHAR(15)   	    NOT NULL,
    DDD                	VARCHAR(2)       	NOT NULL,

    PRIMARY KEY (ID_TELEFONE),
    FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(ID_USUARIO)
);

-------------------------------------------------------------------

--CRIAÇÃO DAS SEQUENCES--

CREATE SEQUENCE SQ_CLIENTE;
CREATE SEQUENCE SQ_CARTOES;
CREATE SEQUENCE SQ_SERVICO;
CREATE SEQUENCE SQ_PRODUTO_TIPO;
CREATE SEQUENCE SQ_PRODUTO;
CREATE SEQUENCE SQ_PACOTE;
CREATE SEQUENCE SQ_PACOTE_PRODUTO;
CREATE SEQUENCE SQ_CARRINHO;
CREATE SEQUENCE SQ_ENDERECO_TIPO;
CREATE SEQUENCE SQ_FUNCIONARIO;
CREATE SEQUENCE SQ_FORNECEDOR;
CREATE SEQUENCE SQ_METODO_PAGAMENTO;
CREATE SEQUENCE SQ_USUARIO;
CREATE SEQUENCE SQ_ENDERECOS;
CREATE SEQUENCE SQ_COMPRA;
CREATE SEQUENCE SQ_PACOTE_COMPRA;
CREATE SEQUENCE SQ_CONTAS_BANCO;
CREATE SEQUENCE SQ_CONTRATACAO_TIPO;
CREATE SEQUENCE SQ_CONTRATO;
CREATE SEQUENCE SQ_PACOTE_SERVICO;
CREATE SEQUENCE SQ_PACOTES_CARRINHO;
CREATE SEQUENCE SQ_FORNECEDOR_FUNCIONARIO;
CREATE SEQUENCE SQ_TELEFONES;

-------------------------------------------------------------------

--POVOAMENTO DAS TABELAS--

--CLIENTE

INSERT INTO TB_USUARIO (ID_USUARIO, EMAIL, SENHA, DATA_CRIACAO) VALUES (SQ_USUARIO.nextval, 'cliente1@email.com', 'senha123', '01.01.2010');
INSERT INTO TB_USUARIO (ID_USUARIO, EMAIL, SENHA, DATA_CRIACAO) VALUES (SQ_USUARIO.nextval, 'cliente2@email.com', 'senha123', '02.01.2010');
INSERT INTO TB_USUARIO (ID_USUARIO, EMAIL, SENHA, DATA_CRIACAO) VALUES (SQ_USUARIO.nextval, 'cliente@email.com', 'senha123', '03.01.2010');

INSERT INTO TB_USUARIO (ID_USUARIO, EMAIL, SENHA, DATA_CRIACAO) VALUES (SQ_USUARIO.nextval, 'fornecedor1@email.com', 'senha123', '01.01.2000');
INSERT INTO TB_USUARIO (ID_USUARIO, EMAIL, SENHA, DATA_CRIACAO) VALUES (SQ_USUARIO.nextval, 'fornecedor2@email.com', 'senha123', '02.01.2000');
INSERT INTO TB_USUARIO (ID_USUARIO, EMAIL, SENHA, DATA_CRIACAO) VALUES (SQ_USUARIO.nextval, 'fornecedor3@email.com', 'senha123', '03.01.2000');

update TB_USUARIO set EMAIL = 'cliente3@email.com' where ID_USUARIO = 3; 
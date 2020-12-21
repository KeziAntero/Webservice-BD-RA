-- Banco de dados do Sistema Report Agllomeration;
CREATE DATABASE Report_Agllomeration;

-- Usando o banco de dados do Sistema Report Agllomeration;
USE Report_Agllomeration;

-- Tabela que armazena as informações sobre locais com aglomeraçõe enviada
-- pelo o usuário por meio do WebService Reporte_Consulta_Aglomeração;
CREATE TABLE Reportes
(
	report_id INT NOT NULL AUTO_INCREMENT,
    report_nome_local VARCHAR(50) NOT NULL,
    report_quantidade_pessoas INT NOT NULL,
    report_mascara VARCHAR(20) NOT NULL,
    report_distanciamento BOOLEAN NOT NULL,
    report_observacoes VARCHAR(255),
	report_data_hora DATETIME NOT NULL,
    report_latitude VARCHAR(100) NOT NULL,
	report_longitude VARCHAR(100) NOT NULL,
    PRIMARY KEY(report_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Tabela virtual para inserir, alterar, excluir e consultar na tabela real Reportes;
CREATE VIEW view_reportes as
	(SELECT * FROM Reportes);
    
-- Tabela virtual para consultar o nome do local e quantidade de pessoas 
-- em ordem decrescente de quantidade de pessoas;
CREATE VIEW view_top_reportes as
	(SELECT DISTINCT report_nome_local as nome, report_quantidade_pessoas as quantidade
    FROM view_reportes ORDER BY report_quantidade_pessoas DESC);

-- Tabela que armazena as informações de log do sistema;
CREATE TABLE RA_log
(
	log_id INT AUTO_INCREMENT,
    log_tipo_alteracao VARCHAR(20) NOT NULL,
    log_nome_tabela VARCHAR(20) NOT NULL,
    log_data DATE NOT NULL,
    log_usuario_BD VARCHAR(20) NOT NULL,
    PRIMARY KEY(log_id)
);

DELIMITER |
-- Gatilho que ativa após uma inserção de informações na tabela Reportes;
CREATE TRIGGER reportes_log_insert AFTER INSERT ON Reportes  
	FOR EACH ROW
	BEGIN
		INSERT INTO RA_log(log_tipo_alteracao,log_nome_tabela,log_data,log_usuario_BD)   
		VALUES('INSERT', 'Reportes', NOW(), USER());
    END;
|

-- Gatilho que ativa após uma alteração de informações na tabela Reportes;
CREATE TRIGGER reportes_log_update AFTER UPDATE ON Reportes  
	FOR EACH ROW
	BEGIN
		INSERT INTO RA_log(log_tipo_alteracao,log_nome_tabela,log_data,log_usuario_BD)   
		VALUES('UPDATE', 'Reportes', NOW(), USER());
    END;
|

-- Gatilho que ativa após uma exclusão de informações na tabela Reportes;
CREATE TRIGGER reportes_log_delete AFTER DELETE ON Reportes  
	FOR EACH ROW
	BEGIN
		INSERT INTO RA_log(log_tipo_alteracao,log_nome_tabela,log_data,log_usuario_BD)   
		VALUES('DELETE', 'Reportes', NOW(), USER());
    END;
|

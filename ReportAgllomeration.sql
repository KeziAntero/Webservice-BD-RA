CREATE DATABASE Report_Agllomeration;

USE Report_Agllomeration;

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

CREATE VIEW view_reportes as
	(SELECT * FROM Reportes);
    
CREATE VIEW view_top_data_reportes as
	(SELECT report_nome_local as nome, report_quantidade_pessoas as quantidade, report_data_hora
    FROM view_reportes ORDER BY report_data_hora DESC);

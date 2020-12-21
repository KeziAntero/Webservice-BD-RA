<?php

    class ConexaoController
    {
        static function conectar()
        {
            $localhost = "localhost";
            $meuBancoDeDados = "Report_Agllomeration";
            $username = "root";
            $password = "";
            $conn = null; 

            try {
                $conn = new PDO("mysql:host=$localhost;dbname=$meuBancoDeDados", $username, $password);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
              } catch(PDOException $e) {
                  echo 'ERROR: ' . $e->getMessage();
              }

            return $conn;  
        }
    }
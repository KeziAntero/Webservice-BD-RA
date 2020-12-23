<?php

require_once('./BDController.php');
require_once('./Reportes.php');
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers: content-type");
header('Content-type: application/json; charset="utf-8"', true );

if($_SERVER['REQUEST_METHOD'] === 'GET'){
    if(!empty($_GET['pesquisa'])){
        $pesq = $_GET['pesquisa'];
        switch($pesq){
            case "all":
                $jsonReportes = BDController::findAllReportes();
                echo $jsonReportes;
                break;
            case "top":
                $jsonReportes = BDController::findTopReportes();
                echo $jsonReportes;
                break; 
            default: 
                $msg = array('status' => 'ERRO','mensagem' => 'A opção que solicitou não existe!' );
                echo json_encode($msg);
        }
    }          
}

if($_SERVER['REQUEST_METHOD'] === 'POST'){
    if(!empty($_POST)){
        
        $reporte = new Reportes();

        $reporte->setNome_Local($_POST["nome"]);
        $reporte->setQuantPessoa($_POST["quantidade"]);

        if($_POST["opcoes"] === 0){
            $reporte->setMascara("Todas");
        }else if($_POST["opcoes"] === 1){
            $reporte->setMascara("Algumas");
        }else{
            $reporte->setMascara("Nenhuma");
        }
            
        $reporte->setDistanciamento($_POST["detachment"]);
        $reporte->setObs($_POST["note"]);
        $reporte->setDataHora(date("Y-m-d H:i:s",strtotime($_POST["hours"])));
        $reporte->setLatitude($_POST["lat"]);
        $reporte->setLongitude($_POST["lng"]);

        BDController::addReporte($reporte);
        $msg = array('status' => 'SUCCESS','mensagem' => 'O reporte da aglomeração foi registrado com sucesso!');
        echo json_encode($msg);
        header('Location: http://agglomeration.brazilsouth.cloudapp.azure.com/painel.php');
        exit();
    }else{
        $msg = array('status' => 'ERRO','mensagem' => 'Não foi registrado o reporte da aglomeração!');
        echo json_encode($msg);
        exit();
    }
    
}

?>
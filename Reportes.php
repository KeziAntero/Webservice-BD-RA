<?php

class Reportes
{
    private $nome_local, $dataHora, $mascara, $obs, $quantPessoa, $latitude, $longitude, $distanciamento;


    public function setNome_local($nome): void
    {
        $this->nome_local =  $nome;
    }

    public function getNome_local(): String
    {
        return $this->nome_local;
    }

    public function setQuantPessoa($quantidade): void
    {
        $this->quantPessoa = $quantidade;
    }

    public function getQuantPessoa(): int
    {
        return $this->quantPessoa;
    }

    public function setDataHora($dataHora): void
    {
        $this->dataHora = $dataHora;
    }

    public function getDataHora(): String
    {
        return $this->dataHora;
    }

    public function setDistanciamento($distanciamento): void
    {
        $this->distanciamento = $distanciamento;
    }

    public function getDistanciamento()
    {
        return $this->distanciamento;
    }

    public function setMascara($mascara): void
    {
        $this->mascara = $mascara;
    }

    public function getMascara(): String
    {
        return $this->mascara;
    }

    public function setObs($obs): void
    {
        $this->obs = $obs;
    }

    public function getObs(): String
    {
        return $this->obs;
    }

    public function setLatitude($lat)
    {
        $this->latitude = $lat;
    }

    public function getLatitude()
    {
        return $this->latitude;
    }

    public function setLongitude($lng)
    {
        $this->longitude = $lng; 
    }

    public function getLongitude()
    {
        return $this->longitude;
    }

}


?>

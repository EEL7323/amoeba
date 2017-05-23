<?php
// Routes

$app->post('/api/token', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];

    //Verificar login aqui
    $resp["status"] = "OK";
	$resp["token"] = "Bearer JSKLDNG9FA98Q0238NDNF238.asdfjaosjdf.12312";
    $resp["matricula"] = "13106428";
    $resp["tipo_usuario"] = "aluno";

    return $response->withJSON($resp);
});

$app->post('/api/saveLocalData', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];

    //Verificar login aqui
    $resp["nome"] = "Giovanni Cimolin da Silva";
	$resp["matricula"] = "13106428";
	$resp["imagem"] = "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120";


    return $response->withJSON($resp);
});

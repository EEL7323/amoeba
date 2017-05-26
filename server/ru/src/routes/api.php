<?php
// Routes

use \Firebase\JWT\JWT;

$app->post('/api/token', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];

    $matricula = "13106428";
    $tipo_usuario = "aluno";
    $loginStatus = "OK";

    //Se o login ocorreu corretamente
    $resp["status"] = $loginStatus;

    if($loginStatus == "OK"){
        $token = generateToken($matricula, $tipo_usuario);
        setcookie("token", $token, time() + (15*60), "/");
    	$resp["token"] = $token;
        $resp["matricula"] = $matricula;
        $resp["tipo_usuario"] = $tipo_usuario;
    }

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


function generateToken($matricula, $tipoUsuario)
{
    $now = new DateTime("now");
    $future = new DateTime("now +15 minutes");

    $secret = "your_secret_key";

    $payload = [
        "usr" => $matricula,
        "typ" => $tipo_usuario,
        "nbf" => $now->getTimeStamp(),
        "exp" => $future->getTimeStamp()
    ];

    $token = JWT::encode($payload, $secret, "HS256");
    return $token;
}

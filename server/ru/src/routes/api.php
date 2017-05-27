<?php
// Routes

use \Firebase\JWT\JWT;

//******************************************************************************
//******************************************************************************
//Geração de token de acesso
//******************************************************************************
//******************************************************************************
$app->post('/api/token', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");

    $resp = [];
    $post = $request->getParsedBody();

    $matricula = $post['matricula'];
    $senha = $post['senha'];

    $dadosUsuario = loginUsuario($app, $matricula, $senha);

    if($dadosUsuario==0)
    {
        $resp["status"] = "ERRO";
    }
    else
    {
        $resp["status"] = "OK";
    }

    //Se o login ocorreu corretamente
    if($resp["status"]  == "OK"){
        $token = generateToken($dadosUsuario['matricula'], $dadosUsuario['tipo_usuario']);
        setcookie("token", $token, time() + (15*60), "/");
    	$resp["token"] = $token;
        $resp["matricula"] = $dadosUsuario['matricula'];
        $resp["tipo_usuario"] = $dadosUsuario['tipo_usuario'];
    }

    return $response->withJSON($resp);
});

//******************************************************************************
//******************************************************************************
//Retorna dados para salvar interface de login
//******************************************************************************
//******************************************************************************
$app->post('/api/saveLocalData', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];

    $post = $request->getParsedBody();

    $matricula = $post['matricula'];
    $data = getUserSimpleData($app, $matricula);

    //Verificar login aqui
    $resp["nome"] = $data['nome'];
	$resp["matricula"] = $data['matricula'];
	$resp["imagem"] = "//ru.local/api/userImage/".$matricula;


    return $response->withJSON($resp);
});


//******************************************************************************
//******************************************************************************
//Retorna a imagem do usuário
//******************************************************************************
//******************************************************************************
$app->get('/api/userImage/{id}', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];

    $imagem = getUserImage($app, $args['id']);
    $response->write($imagem);

    return $response->withHeader("Content-type",  "image/jpg");
});


//******************************************************************************
//******************************************************************************
//FUNÇÕES AUXILIARES
//******************************************************************************
//******************************************************************************

function generateToken($matricula, $tipoUsuario)
{
    $now = new DateTime("now");
    $future = new DateTime("now +15 minutes");

    $secret = "your_secret_key";

    $payload = [
        "usr" => $matricula,
        "typ" => $tipoUsuario,
        "nbf" => $now->getTimeStamp(),
        "exp" => $future->getTimeStamp()
    ];

    $token = JWT::encode($payload, $secret, "HS256");
    return $token;
}

function loginUsuario($app, $matricula, $senha)
{
    $container = $app->getContainer();
    $db = $container['db'];
    $senhaHash = sha1($senha);

    $sql = "SELECT collegeid, name, usertype FROM users WHERE collegeid = :matricula AND password = :senhaHash";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->bindparam(":senhaHash", $senhaHash);
    $stmt->execute();


    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($users) <= 0)
    {
        return 0;
        exit;
    }

    $user = $users[0];

    $data['matricula'] = $user['collegeid'];
    $data['nome'] = $user['name'];
    $data['tipo_usuario'] = $user['usertype'];

    return $data;
}

function getUserSimpleData($app, $matricula)
{
    $container = $app->getContainer();
    $db = $container['db'];

    $sql = "SELECT name, collegeid FROM users WHERE collegeid = :matricula";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->execute();


    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($users) <= 0)
    {
        return 0;
    }

    $user = $users[0];

    $data['nome'] = $user['name'];
    $data["matricula"] = $user['collegeid'];

    return $data;
}

function getUserImage($app, $matricula)
{
    $container = $app->getContainer();
    $db = $container['db'];

    $sql = "SELECT userImage FROM users WHERE collegeid = :matricula";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->execute();

    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $user = $users[0];

    return $user['userImage'];
}

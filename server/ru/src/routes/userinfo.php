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
    $dispositivo = $post['dispositivo'];
    $expira = "NAO"; // $post['expira'];


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
        if ($expira=="NAO")
        {
            $token = generateToken($dadosUsuario['matricula'], $dadosUsuario['tipo_usuario'], $dadosUsuario['nome'], False);
            setcookie("token", $token, time() + (365*24*60*60), "/");
        }
        else
        {
            $token = generateToken($dadosUsuario['matricula'], $dadosUsuario['tipo_usuario'], $dadosUsuario['nome'], True);
            setcookie("token", $token, time() + (120*60), "/");
        }
    	$resp["token"] = $token;
        $resp["matricula"] = $dadosUsuario['matricula'];
        $resp["nome"] = $dadosUsuario['nome'];
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
	$resp["imagem"] = "api/userImage/".$matricula;


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
//Retorna o cardapio do dia
//******************************************************************************
//******************************************************************************

$app->get('/api/getCardapioDia', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");

    $cardapio = getCardapioDia($app);

    return $cardapio;
});


//******************************************************************************
//******************************************************************************
//FUNÇÕES AUXILIARES
//******************************************************************************
//******************************************************************************

function generateToken($matricula, $tipoUsuario, $nome, $expira = True)
{
    $now = new DateTime("now");
    if ($expira == True)
    {
        $future = new DateTime("now +2 hours");
    } else
    {
        $future = new DateTime("now +1 year");
    }

    $secret = "your_secret_key";

    $payload = [
        "usr" => $matricula,
        "typ" => $tipoUsuario,
        "nome" => $nome,
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

function getCardapioDia($app)
{
    $container = $app->getContainer();
    $db = $container['db'];

    $sql = "SELECT acompanhamento1,acompanhamento2,principal,complemento,salada,sobremesa FROM cardapio LIMIT 1";

    $stmt = $db->prepare($sql);
    $stmt->execute();

    $cardapios = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $cardapio = json_encode($cardapios[0]);

    return $cardapios[0];
}

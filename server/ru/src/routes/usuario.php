<?php
// Routes

$app->get('/', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'login.html', []);
});

$app->get('/usuario', function ($request, $response, $args) use ($app) {
    $this->logger->info("Rota: '/' route");
    $decoded = (array) $request->getAttribute("token");

    $data = getUserSimpleData($app, $decoded['usr']);

    $userData['matricula'] = $data['matricula'];
    $userData['nome'] = $data['nome'];
    $userData['imagemUsuario'] = "/api/userImage/".$userData['matricula'];
    $userData['tipo_usuario'] = $decoded['typ'];

    if ($userData['tipo_usuario']=="funcionario" or $userData['tipo_usuario']=="professor") {
        $userData['precoPasse'] = 2.90;
    } else if ($userData['tipo_usuario']=="aluno") {
        $userData['precoPasse'] = 1.50;
    } else {
        $userData['precoPasse'] = 6.10;
    }

    $userData['historico'] = getHistoricoUsuario($app, $userData['matricula']);

    $pageData['userData'] = $userData;
    $pageData['cardapio'] = getCardapioDia($app);

    return $this->view->render($response, 'usuario.html', $pageData);
});


$app->get('/api/numeroUsuariosNoRestaurante', function ($request, $response, $args) use ($app) {
    $this->logger->info("Rota: '/' route");

    $container = $app->getContainer();
    $db = $container['db'];

    $sql = "SELECT valor FROM variables WHERE parametro = 'numeroUsuariosNoRestaurante'";

    $stmt = $db->prepare($sql);
    $stmt->execute();

    $resp = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $valor = $resp[0];

    $numeroUsuarios['numUsuarios'] = $valor['valor'];

    return $response->withJSON($numeroUsuarios);
});

$app->post('/api/addPassesUsuario', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];
    $container = $app->getContainer();
    $db = $container['db'];
    $decoded = (array) $request->getAttribute("token");

    $post = $request->getParsedBody();

    $matricula = $decoded['usr'];
    $quantidade = $post['qtd_passes'];

    $sql = "INSERT INTO `credits` (`Timestamp`, `valor`, `processed`, `collegeid`)
            VALUES (NOW(), :quantidade, '0', :matricula);";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->bindparam(":quantidade", $quantidade);
    $stmt->execute();

    $resṕ['status'] = "OK";

    return $response->withJSON($resp);
});

function getHistoricoUsuario($app, $matricula)
{
    $container = $app->getContainer();
    $db = $container['db'];

    $sql = "SELECT * FROM credits WHERE collegeid = :matricula ORDER BY Timestamp DESC";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->execute();

    $historico = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $historico;
}

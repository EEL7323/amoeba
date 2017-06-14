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


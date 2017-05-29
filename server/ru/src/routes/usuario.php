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

    $pageData['userData'] = $userData;
    $pageData['cardapio'] = getCardapioDia($app);

    return $this->view->render($response, 'usuario.html', $pageData);
});


$app->get('/api/numeroUsuariosNoRestaurante', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");

    $resp['numUsuarios'] = (int) 500 + rand(-10,10);

    return $response->withStatus(200)
            ->withHeader('Content-Type', 'application/json')
            ->write(json_encode($resp));
});


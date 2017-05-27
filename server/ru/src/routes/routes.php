<?php
// Routes

$app->get('/', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'login.html', []);
});

$app->get('/aluno', function ($request, $response, $args) use ($app) {
    $this->logger->info("Rota: '/' route");
    $decoded = (array) $request->getAttribute("token");

    $data = getUserSimpleData($app, $decoded['usr']);

    $userData['matricula'] = $data['matricula'];
    $userData['nome'] = $data['nome'];
    $userData['imagemUsuario'] = "/api/userImage/".$userData['matricula'];

    return $this->view->render($response, 'aluno.html', $userData);
});

$app->get('/funcionario', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'funcionario.html', [
	'name' => $args['name']
    ]);
});

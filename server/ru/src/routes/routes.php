<?php
// Routes

$app->get('/', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'login.html', []);
});

$app->get('/aluno', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    $userData['matricula'] = "13106428";
    $userData['nome'] = "Giovanni Cimolin da Silva";
    $userData['imagemUsuario'] = "/api/userImage/".$userData['matricula'];

    return $this->view->render($response, 'aluno.html', $userData);
});

$app->get('/funcionario', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'funcionario.html', [
	'name' => $args['name']
    ]);
});

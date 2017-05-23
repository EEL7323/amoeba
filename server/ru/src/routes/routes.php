<?php
// Routes

$app->get('/', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'login.html', []);
});

$app->get('/aluno', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'aluno.html', [
	'name' => $args['name']
    ]);
});

$app->get('/funcionario', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'funcionario.html', [
	'name' => $args['name']
    ]);
});

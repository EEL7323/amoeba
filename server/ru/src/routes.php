<?php
// Routes

$app->get('/[{name}]', function ($request, $response, $args) {
    $this->logger->info("Rota: '/' route");
    return $this->view->render($response, 'login.html', [
	'name' => $args['name']
    ]);
});

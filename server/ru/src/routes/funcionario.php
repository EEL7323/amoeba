<?php

$app->get('/funcionario', function ($request, $response, $args) use ($app) {
    $this->logger->info("Rota: '/' route");
    $decoded = (array) $request->getAttribute("token");

    if ($decoded['typ'] !='funcionario')
    {
        return $response->withStatus(302)->withHeader('Location', '/usuario');
    }

    $data = getUserSimpleData($app, $decoded['usr']);

    $userData['matricula'] = $data['matricula'];
    $userData['nome'] = $data['nome'];
    $userData['imagemUsuario'] = "/api/userImage/".$userData['matricula'];
    $userData['tipo_usuario'] = $decoded['typ'];

    $pageData['userData'] = $userData;
    $pageData['cardapio'] = getCardapioDia($app);

    return $this->view->render($response, 'funcionario.html', $pageData);
});

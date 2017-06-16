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


$app->post('/api/adduser', function ($request, $response, $args) use ($app) {
    $this->logger->info("Rota: '/' route");
    $decoded = (array) $request->getAttribute("token");
    $container = $app->getContainer();
    $db = $container['db'];

    if ($decoded['typ'] !='funcionario')
    {
        return $response->withStatus(302)->withHeader('Location', '/usuario');
    }

    $post = $request->getParsedBody();
    $files = $request->getUploadedFiles();
    $img = $files['imagem']->file;

    $matricula      = $post['matricula'];
    $nome           = $post['nome'];
    $tipo_usuario   = $post['tipo'];
    $email          = $post['email'];
    $imagem         = file_get_contents($img);
    $senha          = sha1($post['senha']);

    $sql = "INSERT INTO `users` (`collegeid`, `usertype`, `name`, `email`, `password`, `userImage`)
            VALUES (:matricula, :tipo_usuario, :nome, :email, :senha, :imagem);";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->bindparam(":tipo_usuario", $tipo_usuario);
    $stmt->bindparam(":nome", $nome);
    $stmt->bindparam(":email", $email);
    $stmt->bindparam(":senha", $senha);
    $stmt->bindparam(":imagem", $imagem);
    $stmt->execute();

    $resṕ['status'] = "OK";

    return $response->withJSON($resp);
});

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

    $pageData['carteirinhasSemVinculo'] = getCarteirinhasSemVinculo($app);

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

$app->post('/api/addPassesFuncionario', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];
    $container = $app->getContainer();
    $db = $container['db'];
    $decoded = (array) $request->getAttribute("token");

    if ($decoded['typ'] !='funcionario')
    {
        return $response->withStatus(302)->withHeader('Location', '/usuario');
    }

    $post = $request->getParsedBody();

    $matricula = $post['matricula'];
    $quantidade = $post['qtd_passes'];

    $sql = "INSERT INTO `credits` (`Timestamp`, `valor`, `processed`, `collegeid`, `type`)
            VALUES (NOW(), :quantidade, '0', :matricula, 'Carteirinha');";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->bindparam(":quantidade", $quantidade);
    $stmt->execute();

    $resṕ['status'] = "OK";

    return $response->withJSON($resp);
});

$app->post('/api/vincularCarteirinha', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $resp = [];
    $container = $app->getContainer();
    $db = $container['db'];
    $decoded = (array) $request->getAttribute("token");

    if ($decoded['typ'] !='funcionario')
    {
        return $response->withStatus(302)->withHeader('Location', '/usuario');
    }

    $post = $request->getParsedBody();

    $matricula = $post['matricula'];
    $identifier = $post['identifier'];

    $sql = "UPDATE devices SET collegeid = :matricula WHERE identifier = :identifier";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":matricula", $matricula);
    $stmt->bindparam(":identifier", $identifier);
    $stmt->execute();

    $resṕ['status'] = "OK";

    return $response->withJSON($resp);
});


function getCarteirinhasSemVinculo($app)
{
    $container = $app->getContainer();
    $db = $container['db'];

    $sql = "SELECT * FROM devices WHERE collegeid IS NULL;";

    $stmt = $db->prepare($sql);
    $stmt->execute();

    $carteirinhasSemVinculo = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $carteirinhasSemVinculo;
}

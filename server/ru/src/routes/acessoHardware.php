<?php
// Routes

use \Firebase\JWT\JWT;

//******************************************************************************
//******************************************************************************
// Atualiza contador de usuários
//******************************************************************************
//******************************************************************************
$app->get('/api/setNumeroUsuariosRestaurante/{num}', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $decoded = (array) $request->getAttribute("token");

    if ($decoded['hw_code'] != 'senha_magica_da_placa')
    {
        return $response->withStatus(403);
    }

    if(!is_int($args['num']))
    {
        $resp['status'] = "ERRO";
        $resp['reason'] = "Not a valid number";
    } else {
        $container = $app->getContainer();
        $db = $container['db'];

        $sql = "UPDATE `variables` SET `valor` = :numero WHERE `idvariables` = '1'";

        $stmt = $db->prepare($sql);
        $stmt->bindparam(":numero", $args['num']);
        $stmt->execute();

        $resp['status'] = "OK";
    }

    return $response->withJSON($resp);
});

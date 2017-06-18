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

    $num = intval($args['num']);

    if(!is_int($num))
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


$app->get('/api/getCreditosCarteirinha/{identifier}', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $decoded = (array) $request->getAttribute("token");

    $container = $app->getContainer();
    $db = $container['db'];
    $exite = 0;

    $sql = "SELECT * FROM devices WHERE identifier = :identifier";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":identifier", $args['identifier']);
    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($rows)==1){
        $existe=1;
    } else {
        $sql = "INSERT INTO devices (tipo, identifier, added) VALUES ('carteirinha', :identifier, NOW());";

        $stmt = $db->prepare($sql);
        $stmt->bindparam(":identifier", $args['identifier']);
        $stmt->execute();

        $resp['status'] = "CARTEIRINHA_NOVA";
    }

    if ($existe==1)
    {
        $sql = "SELECT
                    *
                FROM
                    credits
                        INNER JOIN
                    devices ON credits.collegeid = devices.collegeid
                WHERE
                    identifier = :identifier
                        AND processed = 0;
                ";

        $stmt = $db->prepare($sql);
        $stmt->bindparam(":identifier", $args['identifier']);
        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $total_credits = 0;

        foreach ($rows as &$row) {
            $total_credits = $total_credits + $row['valor'];
        }
        $resp['status'] = "RECARGA_PENDENTE";
        $resp['credits'] = $total_credits;
    }

    return $response->withJSON($resp);
});

$app->get('/api/confirmaRecarga/{identifier}', function ($request, $response, $args) use ($app){
    $this->logger->info("Rota: '/' route");
    $decoded = (array) $request->getAttribute("token");

    $container = $app->getContainer();
    $db = $container['db'];

    $sql = "UPDATE
                credits
            INNER JOIN devices ON
                credits.collegeid = devices.collegeid
            SET
                processed = '1'
            WHERE
                identifier = :identifier";

    $stmt = $db->prepare($sql);
    $stmt->bindparam(":identifier", $args['identifier']);
    $stmt->execute();

    $resp['status'] = 'OK';

    return $response->withJSON($resp);
});

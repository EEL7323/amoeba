<?php
// Application middleware

// e.g: $app->add(new \Slim\Csrf\Guard);

$app->add(new \Slim\Middleware\JwtAuthentication([
    "path" => ["/api", "/aluno", "/funcionario"],
    "passthrough" => ["/api/token", "/api/userImage/"],
    "secret" => "your_secret_key",
    "secure" => false,
    "cookie" => "token",
    "error" => function ($request, $response, $arguments) {
        $data["status"] = "error";
        $data["message"] = $arguments["message"];
        return $response
            ->withHeader("Content-Type", "application/json")
            ->write(json_encode($data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));
    }
]));


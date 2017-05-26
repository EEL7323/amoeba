<?php
// Application middleware

// e.g: $app->add(new \Slim\Csrf\Guard);

$app->add(new \Slim\Middleware\JwtAuthentication([
    "path" => ["/api", "/aluno", "/funcionario"],
    "passthrough" => ["/api/token"],
    "secret" => "your_secret_key",
    "secure" => false,
    "cookie" => "token"
]));


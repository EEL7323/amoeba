<?php
// Application middleware

// e.g: $app->add(new \Slim\Csrf\Guard);
$app->add(new \Slim\Middleware\JwtAuthentication([
    "path" => ["/api", "/user"],
    "passthrough" => ["/api/token"],
    "secret" => "hue",
    "secure" => false,
    "cookie" => "token",
    "environment" => "HTTP_TOKEN",
    "header" => "token",
]));

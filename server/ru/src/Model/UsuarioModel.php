<?php

namespace App\Model;

require_once "db_config.php";
ini_set('display_errors', true);
error_reporting(E_ALL);

class UsuarioModel {
	$PDO = null;

	function __construct() {
	    $PDO = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8', DB_USER, DB_PASS);
    }

	function loginUsuario($matricula, $senha)
	{
		$senhaHash = make_hash($senha);

		$sql = "SELECT collegeid, name, usertype FROM users WHERE collegeid = :matricula AND password = :senhaHash";
		$stmt = $PDO->prepare($sql);

		$stmt->bindParam(':matricula', $matricula);
		$stmt->bindParam(':senhaHash', $senhaHash);

		$stmt->execute();

		$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

		if (count($users) <= 0)
		{
		    return 0;
		    exit;
		}

		$user = $users[0];

		$data['matricula'] = $user['collegeId'];
		$data['nome'] = $user['name'];
		$data['tipo_usuario'] = $user['usertype'];

		return $data;
	}


}


>

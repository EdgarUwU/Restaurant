<?php

require_once "conexion.php";


$username = ($_POST['username']);
$contrasena = ($_POST['contrasena']);


/*== Verificando campos obligatorios ==*/
if ($username == "" || $contrasena == "") {
    echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                No has llenado todos los campos que son obligatorios
            </div>
        ';
    exit();
}

/*== Verificando integridad de los datos ==*/
if (verificar_datos("[a-zA-Z0-9]{4,20}", $username)) {
    echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                El username no coincide con el formato solicitado
            </div>
        ';
    exit();
}

if (verificar_datos("[a-zA-Z0-9$@.-]{7,100}", $contrasena)) {
    echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                Las contraseñas no coinciden con el formato solicitado
            </div>
        ';
    exit();
}



$check_user = $conn;
$check_user = $check_user->query("SELECT * FROM cantantes WHERE username = '$username'");
if ($check_user->rowCount() == 1) {

    $check_user = $check_user->fetch();

    if ($check_user['username'] == $username && password_verify($contrasena, $check_user['contrasena'])) {
        session_name('USER');
        session_start();

        $_SESSION['id'] = $check_user['id'];
        $_SESSION['username'] = $check_user['username'];
        $_SESSION['name'] = $check_user['name'];
        $_SESSION['last_name'] = $check_user['last_name'];
        $_SESSION['info'] = $check_user['info'];

        if (headers_sent()) {
            echo "<script> window.location.href='index.php?vista=home'; </script>";
        }
        else {
            header("Location: index.php?vista=home");
        }

    } else {
        echo '
	            <div class="notification is-danger is-light">
	                <strong>¡Ocurrio un error inesperado!</strong><br>
	                Usuario o contraseña incorrectos
	            </div>
	        ';
    }
} else {
    echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                El usuario ingresado no existe
            </div>
        ';
}
$check_user = null;
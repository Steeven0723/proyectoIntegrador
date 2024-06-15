<?php

require_once '../model/login.php';
require_once '../model/usuarioModel.php';

class controlador
{
    private $modelo;
    private $usuarioModelo;

    public function __construct()
    {
        $this->modelo = new login();
        $this->usuarioModelo = new UsuarioModel();
    }

    public function login($usuario, $contraseña)
    {
        $datosUsuario = $this->modelo->login($usuario, $contraseña);

        if ($datosUsuario) {
            // Usuario autenticado
            session_start();
            $_SESSION['usuario'] = $datosUsuario;

            // Redirigir a la vista correspondiente según el tipo de usuario
            switch ($datosUsuario['ID_Rol']) {
                case '1':
                    header("Location: ../views/Student/index.html");
                    break;
                case '2':
                    header("Location: ../views/Teacher/tables.html");
                    break;

                case '3':
                    header("Location: ../views/Comite/index.html");
                    break;
                case '4':
                    header("Location: ../views/Admin/index.html");
                    break;


                default:
                    // Tipo de usuario desconocido, manejar de acuerdo a tus necesidades
                    break;
            }
        } else {
            // Usuario no autenticado, mostrar mensaje de error o redirigir a la página de inicio de sesión nuevamente
            header("Location: ../indexError.html");
        }
    }

    public function registrarUsuario($usuario, $nombres, $apellidos, $email, $contraseña, $confirmar_contraseña, $rol)
    {
        if ($contraseña !== $confirmar_contraseña) {
            echo "<script>alert('Las contraseñas no coinciden.'); window.history.back();</script>";
            exit;
        }

        $result = $this->usuarioModelo->registrarUsuario($usuario, $nombres, $apellidos, $email, $contraseña, $rol);

        if ($result) {
            echo "<script>alert('Usuario registrado con éxito.'); window.location.href = '../views/Admin/register.html';</script>";
        } else {
            echo "<script>alert('Error al registrar el usuario.'); window.history.back();</script>";
        }
    }
}

$controlador = new controlador();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["login"])) {
        $usuario = $_POST["usuario"];
        $contraseña = $_POST["contraseña"];
        $controlador->login($usuario, $contraseña);
    } elseif (isset($_POST["registrar"])) {
        $usuario = $_POST["usuario"];
        $nombres = $_POST["nombres"];
        $apellidos = $_POST["apellidos"];
        $email = $_POST["email"];
        $contraseña = $_POST["contraseña"];
        $confirmar_contraseña = $_POST["confirmar_contraseña"];
        $rol = $_POST["rol"];
        $controlador->registrarUsuario($usuario, $nombres, $apellidos, $email, $contraseña, $confirmar_contraseña, $rol);
    }
}

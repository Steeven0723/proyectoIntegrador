<?php
include_once('conectarBD.php');

class UsuarioModel {
    private $db;

    public function __construct() {
        $this->db = conectarBD::conexion();
    }

    public function registrarUsuario($usuario, $nombres, $apellidos, $email, $contraseña, $rol) {
        $hashed_password = password_hash($contraseña, PASSWORD_BCRYPT);

        $query = "INSERT INTO Usuarios (Nombre_Usuario, Contraseña, Email, ID_Rol) VALUES (?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->execute([$usuario, $hashed_password, $email, $rol]);

        if ($stmt->rowCount() > 0) {
            $usuario_id = $this->db->lastInsertId();

            switch ($rol) {
                case 1:
                    $query = "INSERT INTO Estudiantes (Nombre, Apellido, Correo, ID_Usuario) VALUES (?, ?, ?, ?)";
                    break;
                case 2:
                    $query = "INSERT INTO Docentes (Nombre, Apellido, Correo, ID_Usuario) VALUES (?, ?, ?, ?)";
                    break;
                case 3:
                    $query = "INSERT INTO Comité (Nombre, Apellido, Correo, ID_Usuario) VALUES (?, ?, ?, ?)";
                    break;
                default:
                    return false;
            }

            $stmt = $this->db->prepare($query);
            $stmt->execute([$nombres, $apellidos, $email, $usuario_id]);

            return $stmt->rowCount() > 0;
        }

        return false;
    }
}
?>

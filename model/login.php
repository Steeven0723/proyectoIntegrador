<?php

    class login {

        private $db;

        public function conexion(){
            include_once('conectarBD.php');
            $this->db = conectarBD:: conexion() ;
        }

        public function login($usuario, $contraseña) {
            $this->conexion();
            $sql = "SELECT * FROM usuarios WHERE Nombre_Usuario = '$usuario' AND Contraseña = '$contraseña'";
            $resultado =  $this->db->query($sql);
            return $resultado->fetch(PDO::FETCH_ASSOC);
        }
    }

?>
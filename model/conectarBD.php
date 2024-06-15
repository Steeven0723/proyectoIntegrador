<?php

class conectarBD {
    private static $conexion;

    public static function conexion() {
        try {
            self::$conexion = new PDO('mysql:host=localhost;dbname=bdproyecto', 'root', '');
            self::$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            self::$conexion->exec("SET CHARACTER SET UTF8");
        } catch(Exception $e) {
            die("Error en la conexión: " . $e->getMessage());
            echo "Línea del error: " . $e->getLine();
        }

        return self::$conexion;
    }
}
?>

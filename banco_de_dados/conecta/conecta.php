<?php
$conn = mysqli_connect("localhost", "root", "", "farmacia");
if (!$conn) {
    echo "Ocorreu um erro ao tentar se conectar com o banco de dados";
    die();
}

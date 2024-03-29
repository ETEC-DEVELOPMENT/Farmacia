<?php
    require "../../banco_de_dados/conecta/conecta.php";
    $nomeUsuario = $_POST['nomeUsuario'];
    $senha = $_POST['senha'];
    
    $sql = "SELECT NOME_DE_USUARIO, SENHA, NIVEL_USUARIO FROM usuario WHERE NOME_DE_USUARIO = '$nomeUsuario'";
    $usuarioList = mysqli_query($conn, $sql);
    if(mysqli_num_rows($usuarioList) > 0){
        while($usuario = mysqli_fetch_assoc($usuarioList)){
            if($senha == $usuario['SENHA']){
                $_SESSION['LOGADO'] = 1;
            }else{
                echo "Nome de usuário ou senha incorretas";
            }
        }
    }
?>
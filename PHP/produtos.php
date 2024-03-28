<!-- Página de Produtos - Será em PHP  -->
<!DOCTYPE html>
<html lang="pt_BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produtos</title>
</head>

<body>
    <?php
    require "../banco_de_dados/conecta/conecta.php";
    $sql = "SELECT * FROM produtos";
    $listadeProdutos = mysqli_query($conn, $sql);
    while ($produto = mysqli_fetch_assoc($listadeProdutos)) {
        echo "<div class='produto'> 
                <div class='fotoProduto'> 
                    Nula por enquanto
                </div> 
                <div class='nomeProduto'> " 
                    . $produto['NOME_PRODUTO'] . 
                "</div> <div class='precoProduto'>" 
                    . $produto['PRECO'] . 
                "</div>
            </div>";
    }
    ?>
</body>

</html>
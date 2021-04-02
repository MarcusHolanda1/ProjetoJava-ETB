<%-- 
    Document   : index
    Created on : 31/03/2021, 09:25:39
    Author     : guima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no", name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <%@include file="banner.jsp"%>
            <%@include file="menu.jsp" %>
            <h1>Cadastrar Perfil</h1>
            
            <form action="gerenciar_perfil.do" method="POST">
                <input type="hidden" name="idPerfil" value="${perfil.idPerfil}"/>
                <div clas="row">
                    <div clas="form-group col-sm-6">
                        <label for="perfil" class="control-label">Nome Perfil</label>
                        <input type="text" class="form-control" id="nome" name="nome" required="" value="${perfil.nome}" maxlenght="45"/>
                    </div>
                </div>
                <div class="row">
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_perfil.jsp" class="btn btn-warning">Voltar</a>
                </div>
            </form>
            
        </div>
    </body>
</html>

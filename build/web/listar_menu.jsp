<%-- 
    Document   : index
    Created on : 31/03/2021, 09:25:39
    Author     : guima
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no", name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <title>JSP Page</title>
        <script type="text/javascript">
           function confirmarExclusao(id,nome){
               if(confirm('Deseja realmente excluir o menu?'+nome+'?')){
                   location.href='gerenciar_menu.do?acao=deletar&idMenu='+id;
               }
           }    
        </script>
    </head>
    <body>
        <div class="container">
            <%@include file="banner.jsp"%>
            <%@include file="menu.jsp" %>
            <h1>Lista de Menus</h1>
            
            <a href="form_menu.jsp" class="btn btn-primary">Novo Cadastro</a>
            
            <table class="table table-hove table-striped tab-bordered display" id="listarMenu">
                
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome Menu</th>
                    <th>Link</th>
                    <th>Ícone</th>
                    <th>Exibir</th>
                    <th>Opções</th>
                </tr>
                </thead>
                
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Nome Menu</th>
                    <th>Link</th>
                    <th>Ícone</th>
                    <th>Exibir</th>
                    <th>Opções</th>
                </tr>
                </tfoot>
                
                  <jsp:useBean class="model.MenuDAO" id="mDAO"/>
                  <tbody>               
                <c:forEach var="m" items="${mDAO.lista}">
                
                <tr>
                    <td>${m.idMenu}</td>
                    <td>${m.nome}</td>
                    <td>${m.link}</td>
                    <td>${m.icone}</td>
                    <td>${m.exibir}</td>
                    <td>
                        <a class="btn btn-primary" href="gerenciar_menu.do?acao=alterar&idPerfil=${m.idMenu}">
                            <i class="glyphicon glyphicon-pencil"></i> 
                        </a>
                        <button class="btn btn-danger" onclick="confirmarExclusao(${m.idMenu},'${m.nome}')">
                            <i class="glyphicon glyphicon-trash"></i>
                        </button>
                    </td>
                </tr>
                </c:forEach>
                 </tbody>
            </table>
             
                  
                  <script type="text/javascript" src="datatables/jquery.js"></script>
                  <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                  <script type="text/javascript">
                       $("#listarMenu").dataTable({
                "bJQueryUI": true,
                "oLanguage": {
                    "sProcessing":   "Processando...",
                    "sLengthMenu":   "Mostrar _MENU_ registros",
                    "sZeroRecords":  "Não foram encontrados resultados",
                    "sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty":    "Mostrando de 0 até 0 de 0 registros",
                    "sInfoFiltered": "",
                    "sInfoPostFix":  "",
                    "sSearch":       "Buscar:",
                    "sUrl":          "",
                    "oPaginate": {
                        "sFirst":    "Primeiro",
                        "sPrevious": "Anterior",
                        "sNext":     "Seguinte",
                        "sLast":     "Último"
                    }
                }
            });
            
        </script>
            
        </div>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
<link rel="stylesheet" href="resources/css/cadastro.css">
<link rel="stylesheet" href="resources/css/table.css">

<meta charset="ISO-8859-1">
<title>Cadastro de Uusuário</title>

</head>
<body>

	<div class="main-block">
		<h1>Cadastro</h1>
		
		<h3 style="color: red;">${msg}</h3> <!-- msg do jsp que o usuario retorna por atributo se der false e tiver o msm login ja cadastrado -->
		
		<form action="salvarUsuario" method="post" id="formUser">
			<hr>
			<!-- para não editar o id readonly="readonly"  -->
			<label id="icon" for="name"><i class="far fa-id-badge"></i></label> 
				<input type="text" id="id" readonly="readonly" name="id" placeholder="Código Automático" value="${user.id}" placeholder="id" /> 
				
				<label id="icon" for="name"><i class="far fa-clipboard"></i></label>
				 <input type="text" id="nome" name="nome" value="${user.nome}" placeholder="Nome" required /> 
				 
				 <label id="icon" for="name"><i class="fas fa-phone-square"></i></label> 
				<input type="text" id="fone" name="fone" value="${user.fone}" placeholder="Fone" required />
				
				<label id="icon" for="name"><i class="fas fa-user"></i></label>
				 <input	type="text" id="login" name="login" value="${user.login}"placeholder="Login" required />
				
				 <label id="icon" for="name"><i class="fas fa-unlock-alt"></i></label> 
				<input type="password" id="password" name="password" value="${user.password}" placeholder="Password" required />
				
				
				
				
			<hr>

			<div class="btn-block">
				<button type="submit">Salvar</button>
				<!-- vai transforma o salvarusuario a action do button  que é pra salvar pro acao reset -->
				<button type="submit" onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'">Cancelar</button>
			</div>
		</form>


	</div>


	<div class="container">
		<table class="responsive-table" >
			<caption>Usuários cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Login</th>
				<th>Nome</th>
				<th>Fone</th> 
				<th>Delete</th>
				<th>Editar</th>
			</tr>
		
			<!-- vai mostrar os dados da tabela de usuarios -->
			<c:forEach items="${usuarios}" var="user">
				<tr>	
					<td><c:out value="${user.id}">
						</c:out></td>

					<td><c:out value="${user.login}">
						</c:out></td>

					<td><c:out value="${user.nome}">
						</c:out></td>
						
						<td><c:out value="${user.fone}">	</c:out></td>
					
					<!-- <td><c:out value="${user.password}"></c:out></td> -->

					<!-- método de excluir um usuario pelo seu id -->
					<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px"> </a></td>
					<!-- método de editar um usuario pelo seu id -->
					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							alt="Editar" title="Editar" src="resources/img/editar.png"
							width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>



</body>
</html>
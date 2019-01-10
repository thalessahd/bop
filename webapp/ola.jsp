<%@page contentType="text/html" import="java.util.*, java.text.*" 
pageEncoding="ISO-8859-1"%>
<html>
	<head>
	 <meta http-equiv="Content-Type" content="text/html; 
        charset=ISO-8859-1">
		<title> Pagina JSP Ola Mundo </title>
	</head>
	<body>
		<h1>
			<%
				out.println("Ola Mundo");
				   
				out.println(pegaFraseGOT());
			%>
			
		<!--Está faltando gerar o jar jarTarefa4, utilizar o jar no
		jsp ola, referenciar corretamente o jar para poder utilizar
		o metodo pegaFraseGOT() . O "executável" é o html que contém
		o javascript e este usa o jsp.
		-->
		</h1>
	</body>
</html>
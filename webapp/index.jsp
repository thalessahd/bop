<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*,java.util.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>

<html>
	<head>
		<title>Meu JSP</title>
	</head>
	<% SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy"); %>
	<body>
		<h1>Welcome to Tomcat! Today is <%= sdf.format(new Date()) %></h1>
		<%
		Connection conn = null;

		try{ 
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thalessa?useTimezone=true&serverTimezone=UTC","root","");
			if(conn!=null){
				out.print("CONEXÃO COM DATABASE DEU CERTO"+"</br></br>");
			}
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from Livros");
			
			out.print("--Dados tabela: livros--"+"</br>");
			%>
			
			<table style="border: 1px solid black; border-collapse: collapse;">
			<tr>
				<th>ID</th>
				<th>TITULO</th> 
			</tr>
			
			<%
			while (rs.next()) {
			String nome = rs.getString("titulo");
			int id = rs.getInt("id");
			out.print("<tr>");
				out.print("<td>"+id+"</td>");
				out.print("<td>"+nome+"</td>");
			}
			out.print("</tr>");
			out.print("</table>");
			
		}catch(Exception e){
			out.println("NAO CONECTOU NO DATABASE"+"</br>"); e.printStackTrace();
		}
					
		%>
		<%--==========================Tarefa 3===================================--%>
		
		<%
			try {
            Class[] cArg = new Class[2]; 
            cArg[0] = String.class;
            cArg[1] = String.class;
            
            Class cla = Class.forName("meujar.MeuJar"); 
            Object obj = cla.newInstance(); 
            Method pegaGit = cla.getMethod("pegaGit",cArg); 

            Scanner sc = new Scanner(System.in);
            System.out.print("Digite o usuário: ");
            String user = sc.nextLine();
            System.out.print("Digite a palavra para buscar: ");
            String palavra = sc.nextLine();
            
            out.print("Usuário: "+user);
			out.print("</br>Palavra: "+palavra+"</br>");
            
			out.print("Resultado = "+pegaGit.invoke(obj,user,palavra));
            
			}catch (ClassNotFoundException | InstantiationException | IllegalAccessException | 
			NoSuchMethodException | SecurityException | IllegalArgumentException | InvocationTargetException ex){
					out.print("ERRO NO JAR");
			}
		%>
	</body>
</html>
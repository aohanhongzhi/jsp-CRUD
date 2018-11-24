<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据库jsp连接测试</title>
</head>
<body>
<form action="insert.jsp" methon = post>
	<table>
		<p>插入到数据库：</p>
		<tr><td>Name:</td><td> <input type="text" size=20 name = "name"></td></tr>
		<tr><td>Number:</td><td> <input type="text" size=20 name = "number"></td></tr>
		<tr><td>Gender:</td><td> <input type="text" size=20 name = "gender"></td></tr>
		<tr><td>School:</td><td> <input type="text" size=20 name = "school"></td></tr>
		<tr><td><input type = submit value ="提交"></td></tr>
	</table>

</form>

<form action="update.jsp" methon = post>
	<table>
		<p>修改数据库：</p>	
			<tr><td>请输入id:</td><td> <input type="text" size=20 name = "id"></td></tr>
			<tr><td>Name:</td><td> <input type="text" size=20 name = "name"></td></tr>
			<tr><td>Number:</td><td> <input type="text" size=20 name = "number"></td></tr>
			<tr><td>Gender:</td><td> <input type="text" size=20 name = "gender"></td></tr>
			<tr><td>School:</td><td> <input type="text" size=20 name = "school"></td></tr>
			<tr><td><input type = submit value ="提交"></td></tr>
	
	</table>

</form>

<form action ="delete.jsp" methon=post>
	<table>
		<tr>
			<td>请输入删除数据的id：</td>
			<td><input type="text" size=20 name = "id"></td> 
			  
		</tr>
		<tr><td><input type = submit value ="提交"></td></tr>
	</table>
</form>






<%
Connection conn = null;
Statement stmt = null;
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url ="jdbc:mysql://localhost:3306/testdb";
		  conn = DriverManager.getConnection(url,"root","newpass");
		stmt = conn.createStatement();
        String sql;
        sql = "SELECT * FROM STUDENTS";
        ResultSet rs = stmt.executeQuery(sql);
    
        // 展开结果集数据库
        out.print("<p>数据库查询结果</p><table  border='1'><tr><td>id</td><td>name</td><td>number</td><td>gender</td><td>school</td></tr>");
        
        while(rs.next()){
            // 通过字段检索
            int id  = rs.getInt("id");
            String name = rs.getString("name");
            String number = rs.getString("number");
            String gender = rs.getString("gender");
            String school = rs.getString("school");
            // 输出数据
            System.out.print("ID: " + id);
            System.out.print("\t name: " + name);
            System.out.print("\t number: " + number);
            System.out.println("");
            out.print("<tr><td>"+id+"</td><td>"+name+"</td><td>"+number+"</td><td>"+gender+"</td><td>"+school+"</td></tr>");
        }
        out.print("</table>");
        // 完成后关闭
        rs.close();
        stmt.close();
        conn.close();
		
	  }catch(SQLException se){
        // 处理 JDBC 错误
        se.printStackTrace();
    }catch(Exception e){
        // 处理 Class.forName 错误
        e.printStackTrace();
    }finally{
        // 关闭资源
        try{
            if(stmt!=null) stmt.close();
        }catch(SQLException se2){
        }// 什么都不做
        try{
            if(conn!=null) conn.close();
        }catch(SQLException se){
            se.printStackTrace();
        }
    }

%>

</body>
</html>
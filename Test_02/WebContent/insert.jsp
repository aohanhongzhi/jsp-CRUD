<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
	try{
		String name = request.getParameter("name");
		String number =request.getParameter("number");
		String gender = request.getParameter("gender");
		String school = request.getParameter("school");
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url ="jdbc:mysql://localhost:3306/testdb";
		  conn = DriverManager.getConnection(url,"root","newpass");
	
        String sql;
        sql = "insert into students(name,number,gender,school)values('"+name+"','"+number+"','"+gender+"','"+school+"')";
    	stmt = conn.createStatement();
    	stmt.executeUpdate(sql);
    	
    

        // 完成后关闭
     //   rs.close();
        stmt.close();
        conn.close();
        out.print("<a href='index.jsp'>插入完成！点击返回</a>");
        
		
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

<a href="index.jsp"></a>




</body>
</html>
<%@ page import="java.sql.*" %>
    <html>

    <head>
        <title>
            Student Management System By Ishan Vaghela
        </title>
        <style>
            * {
                font-size: 30px;
            }
            
            body {
                background-color: lightcoral;
            }
            
            h1 {
                background-color: black;
                color: white;
            }
            
            a {
                text-decoration: none;
                color: black;
            }
        </style>
    </head>

    <body>
        <center>
            <h1>View Student details</h1>

            <button>
            <a href = "index.jsp">
              Back
            </a>
        </button>
            <br/>
            <br/> <br/>


            <% 
              ResultSet rs=null;
              Statement st=null;
            
             try
             {
                 DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                 String url="jdbc:mysql://localhost:3306/sms";
                 String un="root";
                 String pw="";
                 Connection con = DriverManager.getConnection(url,un,pw);
                
                 String sql="select * from stud";
                 PreparedStatement pst = con.prepareStatement(sql);
                  rs=pst.executeQuery();
                 
                 
                 while(rs.next()){
                    out.println("Rno : " + rs.getDouble(1)+ "<br/>");
                    out.println("name : " + rs.getString(2)+ "<br/>");
                    out.println("Mark1 : " + rs.getDouble(3)+ "<br/>");
                    out.println("Mark2 : " + rs.getDouble(4)+ "<br/>");
                    out.println("Mark3 : " + rs.getDouble(5)+ "<br/>");
                    out.println("<br/>");
                 }
                
             }
             catch(SQLException e)
             {
                 out.println("issues" + e);
             }
          
         %>

        </center>
    </body>

    </html>
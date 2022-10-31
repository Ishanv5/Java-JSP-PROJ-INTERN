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
            <h1>Add Student details</h1>
            <form>
                <input type="number" placeholder="Enter Rno" name="rn" />
                <br/><br/>

                <input type="submit" name="btn" value="Delete" />
                <br/><br/>
                <button>
            <a href = "index.jsp">
              Back
            </a>
        </button>
                <br/>
            </form>


            <% 
          if(request.getParameter("btn") != null)
          {
             double rno=Double.parseDouble(request.getParameter("rn"));
            
             try
             {
                 DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                 String url="jdbc:mysql://localhost:3306/sms";
                 String un="root";
                 String pw="";
                 Connection con = DriverManager.getConnection(url,un,pw);
                 String sql="delete from stud where rno='"+rno+"'";
                 PreparedStatement pst = con.prepareStatement(sql);
                 pst.executeUpdate();
                 out.println(" Ur Record has been Deleted");
             }
             catch(SQLException e)
             {
                 out.println("issues" + e);
             }
          }
         %>

        </center>
    </body>

    </html>
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
        <script>
            function validateForm() {
                let x = document.forms["myForm"]["na"].value;
                if (x.match(/^[A-Za-z]+$/)) {
                    alert("Name can be allowed");
                    return false;
                }
                alert("Please  enter valid name");
                return false;
            }
        </script>
    </head>

    <body>
        <center>
            <h1>Add Student details</h1>
            <form name="myForm" onsubmit="return validateForm()">
                <input type="number" placeholder="Enter Rno" name="rn" min="0" required />
                <br/><br/>
                <input type="text" placeholder="Enter Name" name="na" required/>
                <br/><br/>
                <input type="number" placeholder="Enter subject 1 marks" name="s1" required />
                <br/><br/>
                <input type="number" placeholder="Enter subject 2 marks" name="s2" required/>
                <br/><br/>
                <input type="number" placeholder="Enter subject 3 marks" name="s3" required/>
                <br/><br/>
                <input type="submit" name="btn" />
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
             String name=request.getParameter("na");
             double m1=Double.parseDouble(request.getParameter("s1"));
             double m2=Double.parseDouble(request.getParameter("s2"));
             double m3=Double.parseDouble(request.getParameter("s3"));
             try
             {
                 DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                 String url="jdbc:mysql://localhost:3306/sms";
                 String un="root";
                 String pw="";
                 Connection con = DriverManager.getConnection(url,un,pw);
                 String sql="insert into stud values(?,?,?,?,?)";
                 PreparedStatement pst = con.prepareStatement(sql);
                 pst.setDouble(1,rno);
                 pst.setString(2,name);
                 pst.setDouble(3,m1);
                 pst.setDouble(4,m2);
                 pst.setDouble(5,m3);
                 pst.executeUpdate();
                 out.println("Thank U... Ur Record has been inserted..");
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
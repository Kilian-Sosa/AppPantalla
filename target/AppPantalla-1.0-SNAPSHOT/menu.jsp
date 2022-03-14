<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador de la Pantalla</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <!-- JAVA -->
        <%  
            int rol = -1;
            String url = "", url2 = "";
            if(session.getAttribute("email") == null){
                session.setAttribute("flag", false);
                response.sendRedirect("index.jsp");
                
            } else {
                rol = Integer.parseInt(session.getAttribute("rol").toString());
                String mail = session.getAttribute("email").toString();
                url = "https://avatars.dicebear.com/api/initials/" + mail + ".svg?size=70&r=50";
                url2 = "https://avatars.dicebear.com/api/identicon/" + mail + ".svg?b=white&size=70&r=50";
            }
        %>
        
        <div class="container-fluid">
            <!-- HEADER -->
            <div class="row py-3">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                    <div class="float-end col-2">
                        <img class="mx-auto d-block" src=<%= url2%>>
                        <p class="fs-5 py-3 font-monospace text-center"><%= session.getAttribute("email")%></p>
                    </div>
                </div>
                
                <div class="col-12">
                    <p class="fs-1 text-center font-monospace">Men� Principal</p>
                </div>
            </div>
            
            <!-- MENU -->
            <div class="row">
                <!-- USERS BUTTON-->
                <%if(rol == 1){%>
                    <div class="py-3 col-12">
                        <form method="POST" action="users.jsp">
                            <div class="col-6 mx-auto d-grid gap-2">
                                <input type="submit" value="Usuarios" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                <%}%>    
                
                <!-- NEWS BUTTON--> 
                <div class="py-3 col-12">
                    <form method="POST" action="news.jsp">
                        <div class="col-6 mx-auto d-grid gap-2">
                            <input type="submit" value="Noticias" class="btn btn-primary">
                        </div>
                    </form>
                </div>
                
                <!-- HOLIDAYS BUTTON--> 
                <div class="py-3 col-12">
                    <form method="POST" action="holidays.jsp">
                        <div class="col-6 mx-auto d-grid gap-2">
                            <input type="submit" value="Festivos" class="btn btn-primary">
                        </div>
                    </form>
                </div>
                
                <!-- ABSENCE BUTTON -->
                <div class="py-3 col-12">
                    <form method="POST" action="absence.jsp">
                        <div class="col-6 mx-auto d-grid gap-2">
                            <input type="submit" value="Ausencias" class="btn btn-primary">
                        </div>
                    </form>
                </div>
                
                <!-- LOG BUTTON -->
                <%if(rol == 1){%>
                <div class="py-3 col-12">
                    <form method="GET" action="log.jsp">
                        <div class="col-6 mx-auto d-grid gap-2">
                            <input type="submit" value="Log" class="btn btn-primary">
                        </div>
                    </form>
                </div>
                <%}%>    
            </div>
            
            <!-- LOG OUT BUTTON -->
            <div class="row py-5">
                <form method="POST" action="index.jsp">
                    <div class="col-2 mx-auto d-grid gap-2">
                        <input type="submit" value="Cerrar Sesi�n" class="btn btn-secondary">
                    </div>
                </form>
            </div>
        </div> <!-- END CONTAINER -->
        
    </body>
</html>

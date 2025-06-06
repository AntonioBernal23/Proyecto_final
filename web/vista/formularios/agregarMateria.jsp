<%@page import="modelo.Usuario"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String mensaje = (String) session.getAttribute("mensaje");
    if (mensaje != null) {
%>

<script>
    alert('<%= mensaje%>');
</script>

<%
        session.removeAttribute("mensaje");
    }
    String roleAdmin = request.getParameter("roleAdmin");

    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !roleAdmin.equals("administrador")) {
        response.sendRedirect("/index.jsp");
        return;
    }

    String nombre = usuario.getNombre();
    String rol = usuario.getRol();
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Agregar Materia</title>
        <link rel="stylesheet" href="/vista/css/formularios.css?v=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <div class="calendar-container">
            <!-- Área principal -->
            <div class="calendar">
                <div class="calendar-header">
                    <h2><i class="fa-solid fa-book-medical"></i> Agregar Materia</h2>
                    <p class="subtitulo">Completa los datos para registrar una nueva materia</p>
                </div>
                <div class="calendar-table-container">
                    <div class="form-card">
                        <form action="/RegistroMateria" method="post" class="form">
                            <div class="field-group">
                                <label>Nombre de la materia</label>
                                <input type="text" name="nombre" placeholder="Ej. Matemáticas" required>
                            </div>
                            <div class="field-group">
                                <label>Código</label>
                                <input type="text" name="codigo" placeholder="Ej. MAT101" required>
                            </div>
                            <div class="field-group">
                                <label>Cupos</label>
                                <input type="number" name="cupos" min="1" max="20" placeholder="Máx. 20" required>
                            </div>
                            <div class="field-group">
                                <label>Descripción</label>
                                <textarea name="descripcion" placeholder="Detalle breve..." required></textarea>
                            </div>
                            <div class="field-group">
                                <label>Día</label>
                                <select name="dia" required>
                                    <option value="">Selecciona...</option>
                                    <option>lunes</option>
                                    <option>martes</option>
                                    <option>miércoles</option>
                                    <option>jueves</option>
                                    <option>viernes</option>
                                </select>
                            </div>
                            <div class="field-row">
                                <div class="field-group">
                                    <label for="hora_comienzo">Hora comienzo:</label>
                                    <select id="hora_comienzo" name="hora_comienzo" required>
                                        <%
                                            String[] horas = {"08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00" };
                                            String horaComienzo = request.getParameter("hora_comienzo");
                                            for (String hora : horas) {
                                        %>
                                        <option value="<%= hora%>" <%= hora.equals(horaComienzo) ? "selected" : ""%>><%= hora%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="field-group">
                                    <label for="hora_fin">Hora fin:</label>
                                    <select id="hora_fin" name="hora_fin" required>
                                        <%
                                            String horaFin = request.getParameter("hora_fin");
                                            for (String hora : horas) {
                                        %>
                                        <option value="<%= hora%>" <%= hora.equals(horaFin) ? "selected" : ""%>><%= hora%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn submit-btn">
                                <i class="fa-solid fa-check"></i> Registrar
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
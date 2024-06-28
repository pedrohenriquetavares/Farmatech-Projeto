<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.andersonprojeto.Prescription" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmatech</title>
    <link rel="icon" type="image/png" href="logoFarmatech.png">
    <link rel="stylesheet" href="farmaciainterface.css">
</head>
<body>
<header>
    <h1>Acesso a prescricao de farmaceutico</h1>
</header>
<main>
    <section class="search-section">
        <input type="text" id="search-input" placeholder="Pesquisar prescrições">
        <button id="search-button">Pesquisar</button>
    </section>
    <section class="prescription-list">
        <%
            List<Prescription> prescriptions = (List<Prescription>) request.getAttribute("prescriptions");
            if (prescriptions != null && !prescriptions.isEmpty()) {
        %>
        <table>
            <thead>
            <tr>
                <th>Nome do paciente</th>
                <th>Medico</th>
                <th>Prescricao</th>
                <th>Data</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Prescription prescription : prescriptions) {
            %>
            <tr>
                <td><%= prescription.getPatientName() %></td>
                <td><%= prescription.getDoctorName() %></td>
                <td>
                    <strong>Medicamento:</strong> <%= prescription.getMedicineName() %><br>
                    <strong>Descricao:</strong> <%= prescription.getDescription() %><br>
                    <strong>Dosagem:</strong> <%= prescription.getDosage() %><br>
                    <strong>Quantidade:</strong> <%= prescription.getAmount() %><br>
                    <strong>Administracao:</strong> <%= prescription.getAdmin() %><br>
                    <strong>Observacoes:</strong> <%= prescription.getObs() %>
                </td>
                <td><%= prescription.getCreatedAt() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Nenhuma prescricao encontrada.</p>
        <% } %>
    </section>
</main>
</body>
</html>

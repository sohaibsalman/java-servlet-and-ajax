<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script src="https://code.jquery.com/jquery-1.10.2.js"
            type="text/javascript"></script>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<button id="btn-get">GeT data</button>

<table border="1px solid black">
    <thead>
    <tr>
        <th>Name</th>
        <th>Genre</th>
        <th>Year</th>
    </tr>
    </thead>
    <tbody id="subjects-table">
    </tbody>

</table>


<script>
    const btn = document.getElementById("btn-get");
    btn.addEventListener('click', function () {
        fetchData();
    })

    function fetchData() {
        $.ajax({
            url: 'test',
            success: function (response) {
                populateTable(response);
            },
            error: function (xhr, status, message) {
            //   Error
            },
        })
    }

    function populateTable(response) {
        console.log(response)
        const body = document.getElementById("subjects-table");

        for(let i = 0; i < response.length; i++)
        {
            const row = body.insertRow();
            let col1 = row.insertCell(0);
            let col2 = row.insertCell(1);
            let col3 = row.insertCell(2);
            col1.innerHTML = response[i].name;
            col2.innerHTML = response[i].genre;
            col3.innerHTML = response[i].year;
        }
    }
</script>


</body>
</html>
<!-- search_patient.tpl -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Search Results for "{{ search_query }}"</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Diagnosis</th>
                </tr>
            </thead>
            <tbody>
                % for patient in search_results:
                    <tr>
                        <td>{{ patient[0] }}</td>
                        <td>{{ patient[1] }}</td>
                        <td>
                            % if patient[2]:
                                {{ patient[2] }}
                            % else:
                                No diagnosis available
                            % endif
                        </td>
                    </tr>
                % end
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

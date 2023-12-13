<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Patient</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Update Patient</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{ patient[0] }}</td>
                    <td>{{ patient[1] }}</td>
                    <td>
                        <div class="btn-group">
                            <a href="/Update_patient/{{ patient[0] }}" class="btn btn-sm btn-outline-primary">Update</a>
                            <a href="/delete_patient/{{ patient[0] }}" class="btn btn-sm btn-outline-danger">Delete</a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <h2 class="mt-4">Update Patient Details</h2>
        <form action="/Update_patient/{{ patient[0] }}" method="post">
            <div class="form-group">
                <label for="name">Patient Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="{{ patient[1] }}" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>






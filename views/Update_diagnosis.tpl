<!DOCTYPE html>
<html>
<head>
    <title>Update Diagnosis</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Update Diagnosis</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Patient</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{ diagnosis[0] }}</td>
                    <td>{{ diagnosis[1] }}</td>
                    <td>{{ diagnosis[2] }}</td>
                    <td>
                        <div class="btn-group">
                            <a href="/Update_diagnosis/{{ diagnosis[0] }}" class="btn btn-sm btn-outline-primary">Update</a>
                            <a href="/delete_diagnosis/{{ diagnosis[0] }}" class="btn btn-sm btn-outline-danger">Delete</a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <h2 class="mt-4">Update Diagnosis Details</h2>
        <form action="/Update_diagnosis/{{ diagnosis[0] }}" method="post">
            <div class="form-group">
                <label for="title">Diagnosis Title:</label>
                <input type="text" class="form-control" id="title" name="title" value="{{ diagnosis[1] }}" required>
            </div>
            <div class="form-group">
                <label for="patient_id">Patient:</label>
                <select class="form-control" id="patient_id" name="patient_id" required>
                    % for patient in patients:
                        <option value="{{ patient[0] }}" {% if patient[0] == diagnosis[3] %}selected{% endif %}>{{ patient[1] }}</option>
                    % end
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
</body>
</html>

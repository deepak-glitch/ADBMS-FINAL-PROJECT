<!DOCTYPE html>
<html>
<head>
    <title>Web Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Search Patient</h1>
        <form action="/search_patient" method="get">
            <div class="form-group">
                <label for="search">Patient Name:</label>
                <input type="text" class="form-control" id="search" name="search" placeholder="Enter patient name">
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
        <h1>Patients</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                % for patient in patients:
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
                % end
            </tbody>
        </table>

        <h1 class="mt-4">Diagnoses</h1>
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
                % for diagnosis in diagnoses:
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
                % end
            </tbody>
        </table>

        <h2 class="mt-4">Add Patient</h2>
        <form action="/add_patient" method="post">
            <div class="form-group">
                <label for="name">Patient Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Patient</button>
        </form>

        <h2 class="mt-4">Add Diagnosis</h2>
        <form action="/add_diagnosis" method="post">
            <div class="form-group">
                <label for="title">Diagnosis Title:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="patient_id">Patient:</label>
                <select class="form-control" id="patient_id" name="patient_id" required>
                    % for patient in patients:
                        <option value="{{ patient[0] }}">{{ patient[1] }}</option>
                    % end
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Add Diagnosis</button>
        </form>
    </div>

</body>
</html>

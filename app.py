from bottle import Bottle, request, template
from database import Database

app = Bottle()

# SQLite database setup
db = Database('records.db')

# Routes
@app.route('/')
def index():
    search_query = request.query.get('search', '').strip()

    if search_query:
        search_results = db.search_patients(search_query)
    else:
        search_results = None

    patients = db.get_all_patients()
    diagnoses = db.get_all_diagnoses()

    return template('index', patients=patients, diagnoses=diagnoses, search_results=search_results)

@app.route('/search_patient')
def search_patient():
    search_query = request.query.get('search', '').strip()
    search_results = db.search_patients(search_query)
    return template('search_patient', search_results=search_results, search_query=search_query)

@app.route('/add_patient', method='POST')
def add_patient():
    name = request.forms.get('name')
    db.add_patient(name)
    return index()

@app.route('/add_diagnosis', method='POST')
def add_diagnosis():
    title = request.forms.get('title')
    patient_id = request.forms.get('patient_id')
    db.add_diagnosis(title, patient_id)
    return index()

@app.route('/Update_patient/<patient_id:int>', method=['GET', 'POST'])
def Update_patient(patient_id):
    if request.method == 'POST':
        new_name = request.forms.get('name')
        db.Update_patient(patient_id, new_name)
        return index()
    else:
        patient = db.get_patient_by_id(patient_id)
        return template('Update_patient', patient=patient)

@app.route('/Update_diagnosis/<diagnosis_id:int>', method=['GET', 'POST'])
def Update_diagnosis(diagnosis_id):
    if request.method == 'POST':
        new_title = request.forms.get('title')
        new_patient_id = request.forms.get('patient_id')
        db.Update_diagnosis(diagnosis_id, new_title, new_patient_id)
        return index()
    else:
        diagnosis = db.get_diagnosis_by_id(diagnosis_id)
        patients = db.get_all_patients()
        return template('Update_diagnosis', diagnosis=diagnosis, patients=patients)

@app.route('/delete_patient/<patient_id:int>')
def delete_patient(patient_id):
    db.delete_patient(patient_id)
    return index()

@app.route('/delete_diagnosis/<diagnosis_id:int>')
def delete_diagnosis(diagnosis_id):
    db.delete_diagnosis(diagnosis_id)
    return index()

if __name__ == '__main__':
    app.run(debug=True)

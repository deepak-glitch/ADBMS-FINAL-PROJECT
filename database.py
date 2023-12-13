import sqlite3

class Database:
    def __init__(self, db_file):
        self.conn = sqlite3.connect(db_file)
        self.cursor = self.conn.cursor()
        self.create_tables()

    def create_tables(self):
        self.cursor.execute('''
            CREATE TABLE IF NOT EXISTS patients (
                name TEXT NOT NULL UNIQUE
            )
        ''')
        self.cursor.execute('''
            CREATE TABLE IF NOT EXISTS diagnoses (
                title TEXT NOT NULL,
                patient_id INTEGER NOT NULL,
                FOREIGN KEY (patient_id) REFERENCES patients (rowid)
            )
        ''')
        self.conn.commit()

    def add_patient(self, name):
        self.cursor.execute('INSERT INTO patients (name) VALUES (?)', (name,))
        self.conn.commit()

    def add_diagnosis(self, title, patient_id):
        self.cursor.execute('INSERT INTO diagnoses (title, patient_id) VALUES (?, ?)', (title, patient_id))
        self.conn.commit()

    def Update_patient(self, patient_id, new_name):
        self.cursor.execute('UPDATE patients SET name=? WHERE rowid=?', (new_name, patient_id))
        self.conn.commit()

    def Update_diagnosis(self, diagnosis_id, new_title, new_patient_id):
        self.cursor.execute('UPDATE diagnoses SET title=?, patient_id=? WHERE rowid=?', (new_title, new_patient_id, diagnosis_id))
        self.conn.commit()

    def delete_patient(self, patient_id):
        
        self.cursor.execute('DELETE FROM diagnoses WHERE patient_id=?', (patient_id,))
        self.cursor.execute('DELETE FROM patients WHERE rowid=?', (patient_id,))
        self.conn.commit()

    def delete_diagnosis(self, diagnosis_id):
        self.cursor.execute('DELETE FROM diagnoses WHERE rowid=?', (diagnosis_id,))
        self.conn.commit()

    def get_all_patients(self):
        self.cursor.execute('SELECT rowid, name FROM patients')
        return self.cursor.fetchall()

    def get_all_diagnoses(self):
        self.cursor.execute('SELECT rowid, title, patient_id FROM diagnoses')
        return self.cursor.fetchall()

    def search_patients(self, search_query):
        self.cursor.execute('''
            SELECT patients.rowid, patients.name, GROUP_CONCAT(diagnoses.title, ', ') AS diagnosis_titles
            FROM patients
            LEFT JOIN diagnoses ON patients.rowid = diagnoses.patient_id
            WHERE patients.name LIKE ?
            GROUP BY patients.rowid
        ''', ('%' + search_query + '%',))
        return self.cursor.fetchall()

    def get_patient_by_id(self, patient_id):
        self.cursor.execute('SELECT rowid, name FROM patients WHERE rowid=?', (patient_id,))
        return self.cursor.fetchone()

    def get_diagnosis_by_id(self, diagnosis_id):
        self.cursor.execute('SELECT rowid, title, patient_id FROM diagnoses WHERE rowid=?', (diagnosis_id,))
        return self.cursor.fetchone()

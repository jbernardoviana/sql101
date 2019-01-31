# SQL

# Vocabulary
# A schema is composed of tables
# Each table has a set of columns
# When inserting data in a table, you create a record in a new row

SELECT column_name1, column_name2
FROM table_name
WHERE column_name2 = value LIKE "%value%"

# SELECT * FROM doctors WHERE specialty LIKE 'Surgery%'
# SELECT * FROM patients ORDER BY age ASC

# Cities & Inhabitants
# 1:n relation (one to many)
# An inhabitant belongs to one city (or has one city)
# QUESTION: GIVE ME ALL THE INHABITANTS FROM PARIS
SELECT * FROM inhabitants
JOIN cities ON cities.id = inhabitants.city_id
WHERE cities.name = "Paris";

# GIVE ME ALL THE ADULTS LIVING IN PARIS
SELECT * FROM inhabitants
JOIN cities ON cities.id = inhabitants.city_id
WHERE cities.name = "Paris"
AND inhabitants.age > 18
ORDER BY inhabitants.age DESC

# Doctors & Consultations & Patients
# n:n relation (many to many)
# A patient has many doctors and a doctor has many patients - consultations -

# QUESTION: FOR EACH CONSULTATION, GIVE ME ITS DATE,
# PATIENT AND DOCTOR NAMES

SELECT patients.f_name, patients.l_name, doctors.f_name, doctors.l_name, consultations.created_at
FROM consultations
JOIN patients ON patients.id = consultations.patient_id
JOIN doctors ON doctors.id = consultations.doctor_id

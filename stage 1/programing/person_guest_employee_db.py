import random
from faker import Faker
import psycopg2

# יצירת אובייקט Faker
fake = Faker()

# התחברות למסד הנתונים
conn = psycopg2.connect(
    dbname='mydatabase',
    user='myuser',
    password='mypassword',
    host='localhost',
    port='5432'
)
cursor = conn.cursor()


# פונקציה להוספת נתונים ל- Person
def insert_person(n=400):
    for _ in range(n):
        pname = fake.name()
        email = fake.email()
        phone = fake.phone_number()[:20]  # גזירת המספר לאורך 20 תווים
        cursor.execute(
            "INSERT INTO Person (PName, Email, Phone) VALUES (%s, %s, %s) RETURNING PID;",
            (pname, email, phone)
        )
    conn.commit()



# פונקציה להוספת נתונים ל- Employee
def insert_employee():
    cursor.execute("SELECT PID FROM Person ORDER BY RANDOM() LIMIT 400;")
    person_ids = [row[0] for row in cursor.fetchall()]

    for pid in person_ids:
        tenure = random.randint(1, 30)
        salary = round(random.uniform(30000, 120000), 2)
        role = random.choice(['Manager', 'Receptionist', 'Housekeeping', 'Chef', 'Security'])
        cursor.execute("INSERT INTO Employee (PID, Tenure, Salary, Role) VALUES (%s, %s, %s, %s);",
                       (pid, tenure, salary, role))
    conn.commit()


# פונקציה להוספת נתונים ל- Guest
def insert_guest():
    cursor.execute("SELECT PID FROM Person ORDER BY RANDOM() LIMIT 400;")
    guest_ids = [row[0] for row in cursor.fetchall()]

    for pid in guest_ids:
        cursor.execute("INSERT INTO Guest (PID) VALUES (%s);", (pid,))
    conn.commit()


# הרצת הפונקציות
insert_person()
insert_employee()
insert_guest()

# סגירת החיבור למסד הנתונים
cursor.close()
conn.close()

print("✅ הנתונים הוזנו בהצלחה!")

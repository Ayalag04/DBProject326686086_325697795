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

# פונקציה להוספת נתונים ל- Room
def insert_rooms(n=400):
    cursor.execute("SELECT HotelID FROM Hotel;")  # שליפת רשימת מלונות קיימים
    hotel_ids = [row[0] for row in cursor.fetchall()]

    if not hotel_ids:
        print("❌ אין מלונות במערכת. יש להוסיף מלונות תחילה.")
        return

    room_types = ['Single', 'Double', 'Suite', 'Deluxe', 'Penthouse']
    statuses = ['Available', 'Occupied', 'UnderMaintenance']

    for _ in range(n):
        room_type = random.choice(room_types)
        cost_per_night = round(random.uniform(50, 500), 2)
        num_of_beds = random.randint(1, 5)
        status = random.choice(statuses)
        hotel_id = random.choice(hotel_ids)

        cursor.execute(
            "INSERT INTO Room (Type, CostPerNight, NumOfBeds, RoonStatus, HotelID) VALUES (%s, %s, %s, %s, %s);",
            (room_type, cost_per_night, num_of_beds, status, hotel_id)
        )

    conn.commit()
    print("✅ הוזנו 400 חדרים בהצלחה!")

# קריאה לפונקציה
insert_rooms()

# סגירת החיבור למסד הנתונים
cursor.close()
conn.close()

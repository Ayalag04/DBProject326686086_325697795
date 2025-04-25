import random
from faker import Faker
import psycopg2
from datetime import timedelta

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

# פונקציה להוספת נתונים ל- Reservation
def insert_reservations(n=400):
    cursor.execute("SELECT PID FROM Guest;")  # שליפת רשימת אורחים קיימים
    guest_ids = [row[0] for row in cursor.fetchall()]

    if not guest_ids:
        print("❌ אין אורחים במערכת. יש להוסיף אורחים תחילה.")
        return

    statuses = ['Confirmed', 'Pending', 'Cancelled', 'Checked-in', 'Checked-out']

    for _ in range(n):
        booking_date = fake.date_between(start_date='-1y', end_date='today')  # הזמנות מהשנה האחרונה
        checkin_date = fake.date_between(start_date=booking_date, end_date='+3M')
        checkout_date = checkin_date + timedelta(days=random.randint(1, 14))  # שהייה של 1 עד 14 ימים
        status = random.choice(statuses)
        guest_id = random.choice(guest_ids)

        cursor.execute(
            "INSERT INTO Reservation (BookingDate, CheckinDate, CheckoutDate, Rstatus, GuestID) VALUES (%s, %s, %s, %s, %s);",
            (booking_date, checkin_date, checkout_date, status, guest_id)
        )

    conn.commit()
    print("✅ הוזנו 400 הזמנות בהצלחה!")

# קריאה לפונקציה
insert_reservations()

# סגירת החיבור למסד הנתונים
cursor.close()
conn.close()
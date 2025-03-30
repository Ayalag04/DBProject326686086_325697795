import random

# רשימת השאילתות
insert_statements = []

# לקשר כל הזמנה ל-3 חדרים רנדומליים
for rid in range(1, 401):  # RID מ-1 עד 400
    # בוחרים 3 חדרים רנדומליים בין 1 ל-400
    selected_rooms = random.sample(range(1, 401), 3)

    for room_id in selected_rooms:
        insert_statements.append(f"INSERT INTO Includes (RID, RoomID) VALUES ({rid}, {room_id});")

# הדפסת השאילתות
for statement in insert_statements:
    print(statement)

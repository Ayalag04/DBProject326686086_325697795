const express = require("express");
const app = express();
const cors = require("cors");
const db = require("./backend/db"); // הנחה: מחובר נכון ל-PG Pool

app.use(cors());
app.use(express.json());
app.use(express.static("public"));
app.use(express.static("frontend"));

// --- CRUD עבור טבלת visitor ---
// שים לב: visitor.pid הוא FK ל-person.pid - צריך לוודא שה-person קיים לפני הכנסת visitor
app.get("/api/visitors", async (req, res) => {
  try {
    const result = await db.query(`
      SELECT v.pid, p.firstname, p.lastname, p.email, p.phone, v.ishotelguest
      FROM visitor v
      JOIN person p ON v.pid = p.pid
    `);
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.post("/api/visitors", async (req, res) => {
  try {
    const { pid, ishotelguest } = req.body; // pid חייב להיות קיים בטבלת person
    const result = await db.query(
      "INSERT INTO visitor (pid, ishotelguest) VALUES ($1, $2) RETURNING *",
      [pid, ishotelguest]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.put("/api/visitors/:pid", async (req, res) => {
  try {
    const pid = req.params.pid;
    const { ishotelguest } = req.body;
    const result = await db.query(
      "UPDATE visitor SET ishotelguest=$1 WHERE pid=$2 RETURNING *",
      [ishotelguest, pid]
    );
    if (result.rowCount === 0)
      return res.status(404).json({ error: "Visitor not found" });
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.delete("/api/visitors/:pid", async (req, res) => {
  try {
    const pid = req.params.pid;
    const result = await db.query("DELETE FROM visitor WHERE pid=$1", [pid]);
    if (result.rowCount === 0)
      return res.status(404).json({ error: "Visitor not found" });
    res.json({ message: "Visitor deleted" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// שליפת כל האנשים
app.get("/api/persons", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM person ORDER BY pid");
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// הוספת אדם חדש
app.post("/api/persons", async (req, res) => {
  try {
    const { firstname, lastname, email, phone } = req.body;
    const result = await db.query(
      `INSERT INTO person (firstname, lastname, email, phone)
       VALUES ($1, $2, $3, $4) RETURNING *`,
      [firstname, lastname, email, phone]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);

    res.status(500).json({ error: err.message });
  }
});

// עדכון פרטי אדם לפי מזהה (pid)
app.put("/api/persons/:pid", async (req, res) => {
  try {
    const pid = req.params.pid;
    const { firstname, lastname, email, phone } = req.body;
    const result = await db.query(
      `UPDATE person
       SET firstname = $1, lastname = $2, email = $3, phone = $4
       WHERE pid = $5 RETURNING *`,
      [firstname, lastname, email, phone, pid]
    );
    if (result.rowCount === 0)
      return res.status(404).json({ error: "Person not found" });
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// מחיקת אדם לפי מזהה (כולל מחיקת visitor קודם)
app.delete("/api/persons/:pid", async (req, res) => {
  try {
    const pid = req.params.pid;

    // מחיקת רשומה מהטבלה visitor אם קיימת
    await db.query("DELETE FROM visitor WHERE pid = $1", [pid]);

    // מחיקת האדם מהטבלה person
    const result = await db.query("DELETE FROM person WHERE pid = $1", [pid]);

    if (result.rowCount === 0)
      return res.status(404).json({ error: "Person not found" });

    res.json({ message: "Person deleted" });
  } catch (err) {
    console.error(err); // להדפסה בשרת
    res.status(500).json({ error: err.message });
  }
});

// --- CRUD עבור טבלת room ---

app.get("/api/rooms", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM room ORDER BY roomid");
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.post("/api/rooms", async (req, res) => {
  try {
    const { type, costpernight, numofbeds, roonstatus, hotelid } = req.body;
    const result = await db.query(
      `INSERT INTO room (type, costpernight, numofbeds, roonstatus, hotelid)
       VALUES ($1, $2, $3, $4, $5) RETURNING *`,
      [type, costpernight, numofbeds, roonstatus, hotelid]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.put("/api/rooms/:roomid", async (req, res) => {
  try {
    const roomid = req.params.roomid;
    const { type, costpernight, numofbeds, roonstatus, hotelid } = req.body;
    const result = await db.query(
      `UPDATE room SET type=$1, costpernight=$2, numofbeds=$3, roonstatus=$4, hotelid=$5
       WHERE roomid=$6 RETURNING *`,
      [type, costpernight, numofbeds, roonstatus, hotelid, roomid]
    );
    if (result.rowCount === 0)
      return res.status(404).json({ error: "Room not found" });
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.delete("/api/rooms/:roomid", async (req, res) => {
  try {
    const roomid = req.params.roomid;
    const result = await db.query("DELETE FROM room WHERE roomid=$1", [roomid]);
    if (result.rowCount === 0)
      return res.status(404).json({ error: "Room not found" });

    res.json({ message: "Room deleted" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// --- CRUD עבור טבלת reservation ---

app.get("/api/reservations", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM reservation ORDER BY rid");
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.post("/api/reservations", async (req, res) => {
  try {
    const {
      bookingdate,
      checkindate,
      checkoutdate,
      rstatus,
      visitorid,
      tid,
      activityid,
      paymentid,
    } = req.body;
    const result = await db.query(
      `INSERT INTO reservation (bookingdate, checkindate, checkoutdate, rstatus, visitorid, tid, activityid, paymentid)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING *`,
      [
        bookingdate,
        checkindate,
        checkoutdate,
        rstatus,
        visitorid,
        tid,
        activityid,
        paymentid,
      ]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.put("/api/reservations/:rid", async (req, res) => {
  try {
    const rid = req.params.rid;
    const {
      bookingdate,
      checkindate,
      checkoutdate,
      rstatus,
      visitorid,
      tid,
      activityid,
      paymentid,
    } = req.body;
    const result = await db.query(
      `UPDATE reservation SET bookingdate=$1, checkindate=$2, checkoutdate=$3, rstatus=$4, visitorid=$5, tid=$6, activityid=$7, paymentid=$8
       WHERE rid=$9 RETURNING *`,
      [
        bookingdate,
        checkindate,
        checkoutdate,
        rstatus,
        visitorid,
        tid,
        activityid,
        paymentid,
        rid,
      ]
    );
    if (result.rowCount === 0)
      return res.status(404).json({ error: "Reservation not found" });
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.delete("/api/reservations/:rid", async (req, res) => {
  try {
    const rid = req.params.rid;
    const result = await db.query("DELETE FROM reservation WHERE rid=$1", [
      rid,
    ]);
    if (result.rowCount === 0)
      return res.status(404).json({ error: "Reservation not found" });
    res.json({ message: "Reservation deleted" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// --- פרוצדורות ופונקציות ושאילתות מיוחדות ---

// 1. פרוצדורה: expire_old_reservations (אין פרמטרים)
app.post("/api/procedure/expire_old_reservations", async (req, res) => {
  try {
    await db.query("CALL expire_old_reservations()");
    res.json({ message: "הסטטוסים עודכנו בהצלחה" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 2. פרוצדורה: print_total_payment(visitorid)
app.get("/api/procedure/print_total_payment/:payid", async (req, res) => {
  try {
    const payid = req.params.payid;

    const result = await db.query(
      "SELECT get_payment_amount($1) AS total_payment",
      [payid]
    );

    if (result.rows.length === 0) {
      return res.json({ message: "לא נמצא תשלום עם מזהה זה" });
    }

    res.json({ message: `התשלום הכולל: ${result.rows[0].total_payment}` });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 3. פונקציה: get_available_activities
app.get("/api/function/get_available_activities", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM get_available_activities()");
    res.json(result.rows);
  } catch (err) {
    console.error("שגיאה בבקשת הפעילויות:", err);

    res.status(500).json({ error: err.message });
  }
});

// 4. פונקציה: check_person_type(pid)
app.get("/api/function/check_person_type/:pid", async (req, res) => {
  try {
    const pid = req.params.pid;
    const result = await db.query(
      "SELECT check_person_type($1) AS type_description",
      [pid]
    );

    if (result.rows.length === 0) {
      res.json({ message: "לא נמצא אדם עם מזהה זה" });
    } else {
      res.json({ message: result.rows[0].type_description });
    }
  } catch (err) {
    console.log(err.message);
    console.log(result.rows);
    res.status(500).json({ error: err.message });
  }
});

// 5. שאילתה: אורחים שהזמינו במאי
app.get("/api/query/guests_may", async (req, res) => {
  try {
    // דוגמה לשאילתה מורכבת להצגת אורחים שהזמינו במאי
    const query = `
      SELECT v.pid AS guestid,
             CONCAT(p.firstname, ' ', p.lastname) AS guestname,
             r.checkindate,
             r.checkoutdate,
             h.hotelname,
             rm.type AS roomtype,
             rm.costpernight
      FROM visitor v
      JOIN person p ON v.pid = p.pid
      JOIN reservation r ON v.pid = r.visitorid
      JOIN room rm ON r.tid = rm.roomid  -- אם tid הוא סוג חדר, יתכן שצריך התאמה
      JOIN hotel h ON rm.hotelid = h.hotelid
      WHERE EXTRACT(MONTH FROM r.bookingdate) = 5
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (err) {
    console.error("שגיאה בבקשת הפעילויות:", err);
    res.status(500).json({ error: err.message });
  }
});

// 6. שאילתה: עדכון מחיר חדרים (למי שיש לו יותר מ-3 הזמנות)
app.post("/api/query/update_room_prices", async (req, res) => {
  try {
    // דוגמה לעדכון מחירי חדרים (הגיוני שתעדכני לפי הצורך)
    const query = `
      WITH frequent_visitors AS (
        SELECT visitorid
        FROM reservation
        GROUP BY visitorid
        HAVING COUNT(*) > 3
      )
      UPDATE room rm
      SET costpernight = costpernight * 1.1
      WHERE EXISTS (
        SELECT 1 FROM reservation r
        WHERE r.visitorid IN (SELECT visitorid FROM frequent_visitors)
          AND r.tid = rm.roomid
      )
    `;
    await db.query(query);
    res.json({ message: "מחירי החדרים עודכנו בהצלחה" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// הפעלת השרת
app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});

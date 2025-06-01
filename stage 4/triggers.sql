
-- טריגר 1: בעת הוספת תשלום – ודא שסכום מעל 0

CREATE OR REPLACE FUNCTION trg_check_positive_payment()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.totalpay <= 0 THEN
        RAISE EXCEPTION 'Payment must be positive';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_payment_positive
BEFORE INSERT ON payment
FOR EACH ROW
EXECUTE FUNCTION trg_check_positive_payment();



-- טריגר 2: בעת שינוי מצב חדר לעדכן הודעה בלוג (ניצור טבלת לוגים)

CREATE TABLE IF NOT EXISTS roomstatus_log (
    logid SERIAL PRIMARY KEY,
    roomid INT,
    old_status VARCHAR,
    new_status VARCHAR,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION trg_log_room_status_change()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.roonstatus <> NEW.roonstatus THEN
        INSERT INTO roomstatus_log(roomid, old_status, new_status)
        VALUES (OLD.roomid, OLD.roonstatus, NEW.roonstatus);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_room_status_log
AFTER UPDATE ON room
FOR EACH ROW
EXECUTE FUNCTION trg_log_room_status_change();


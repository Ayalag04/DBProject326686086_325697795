
-- תוכנית ראשית 1: מציגה את כל הפעילויות הפנויות ואז מעדכנת מחיר של פעילות

DO $$
DECLARE
    rec RECORD;
BEGIN
    RAISE NOTICE 'Available Activities:';
    FOR rec IN SELECT * FROM get_available_activities() LOOP
        RAISE NOTICE 'Activity: %, Capacity: %', rec.name, rec.capacity;
    END LOOP;

    PERFORM update_activity_price(1, 300);
END;
$$;


-- תוכנית ראשית 2: מקבלת תשלום לפי מזהה ומפעילה ניקוי הזמנות ישנות

DO $$
DECLARE
    total NUMERIC;
BEGIN
    total := get_payment_amount(1);
    RAISE NOTICE 'Total payment for ID 1: %', total;

    CALL expire_old_reservations();
END;
$$;

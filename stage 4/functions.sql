-- פונקציה 1: החזרת רשימת פעילויות עם מקומות פנויים בלבד
CREATE OR REPLACE FUNCTION get_available_activities()
RETURNS TABLE(activityid INT, name VARCHAR, capacity NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT a.activityid, a.name, a.capacity
    FROM activity a
    WHERE a.capacity > (
        SELECT COUNT(*) FROM reservation r WHERE r.activityid = a.activityid
    );
END;
$$ LANGUAGE plpgsql;

-- פונקציה 2: חישוב סה"כ תשלום לפי מזהה תשלום
CREATE OR REPLACE FUNCTION get_payment_amount(p_payid INT)
RETURNS NUMERIC AS $$
DECLARE
    amount NUMERIC;
BEGIN
    SELECT totalpay INTO amount 
    FROM payment 
    WHERE payid = p_payid;
    
    IF amount IS NULL THEN
        RAISE EXCEPTION 'Payment ID % not found', p_payid;
    END IF;

    RETURN amount;
END;
$$ LANGUAGE plpgsql;

 -- פונקציה שמחזירה רשימת פעילויות דרך REFCURSOR פונקציה 3:
CREATE OR REPLACE FUNCTION get_activities_cursor()
RETURNS REFCURSOR AS $$
DECLARE
    cur REFCURSOR;
BEGIN
    OPEN cur FOR
    SELECT activityid, name, capacity FROM activity;
    RETURN cur;
END;
$$ LANGUAGE plpgsql;

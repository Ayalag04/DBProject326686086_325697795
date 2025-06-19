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


-- FUNCTION: public.check_person_type(integer)

-- DROP FUNCTION IF EXISTS public.check_person_type(integer);

CREATE OR REPLACE FUNCTION public.check_person_type(
  p_id integer)
RETURNS TEXT
LANGUAGE plpgsql
AS $BODY$
DECLARE
  is_employee BOOLEAN;
  is_visitor BOOLEAN;
  result_text TEXT;
BEGIN
  SELECT EXISTS (SELECT 1 FROM employee WHERE pid = p_id) INTO is_employee;
  SELECT EXISTS (SELECT 1 FROM visitor WHERE pid = p_id) INTO is_visitor;

  IF is_employee AND is_visitor THEN
    result_text := 'Person ' || p_id || ' is both Employee and Visitor.';
  ELSIF is_employee THEN
    result_text := 'Person ' || p_id || ' is an Employee.';
  ELSIF is_visitor THEN
    result_text := 'Person ' || p_id || ' is a Visitor.';
  ELSE
    result_text := 'Person ' || p_id || ' not found as Employee or Visitor.';
  END IF;

  RETURN result_text;
END;
$BODY$;

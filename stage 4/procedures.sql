
-- פרוצדורה 1: עדכון מחיר פעילות לפי מזהה פעילות

CREATE OR REPLACE PROCEDURE update_activity_price(actid INT, newprice INT)
AS $$
BEGIN
    UPDATE activity SET price = newprice WHERE activityid = actid;
    IF NOT FOUND THEN
        RAISE NOTICE 'Activity ID % not found', actid;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- פרוצדורה 2: עדכון סטטוס הזמנה לפקיעה אם תאריך עזיבה עבר

CREATE OR REPLACE PROCEDURE expire_old_reservations()
AS $$ 
BEGIN
    UPDATE reservation
    SET rstatus = 'Expired'
    WHERE checkoutdate < CURRENT_DATE AND rstatus <> 'Expired';
END;
$$ LANGUAGE plpgsql;









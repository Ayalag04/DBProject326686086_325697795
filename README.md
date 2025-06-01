# DBProject326686086_325697795
מגישות: אילה גלבר ואיילת פרידמן

שם המערכת: מערכת לניהול בתי מלון

היחידה הנבחרת: ניהול הזמנות ותשלומים

דוח שלב א' - מערכת לניהול בתי מלון

**תוכן עניינים:**

1.מבוא

2.תיאור המערכת

3.הישויות במערכת

4.פונקציונליות עיקרית

**מבוא**

מערכת ניהול בתי מלון מיועדת לניהול מידע על רשת מלונות, חדרים, אורחים, הזמנות ותשלומים. המערכת מאפשרת לכל בית מלון לכלול מספר חדרים, ולכל חדר להיות מוזמן על ידי אורחים שונים. כמו כן, אורחים יכולים לבצע הזמנות למספר חדרים שונים במסגרת שהותם. לכל הזמנה מתבצע תשלום מתאים.

המערכת מיועדת לייעול תהליך ניהול ההזמנות, מעקב אחר סטטוס החדרים, שמירת מידע על אורחים ותשלומים, וניהול כוח אדם בבית המלון. המידע נשמר בבסיס נתונים ומאפשר שליפה קלה ומהירה לביצוע פעולות שונות.

**תיאור המערכת:**

המערכת בנויה ממספר ישויות מרכזיות:

בית מלון (Hotel): כל בית מלון כולל מזהה ייחודי, שם, מיקום ודירוג כוכבים.

חדר (Room): לכל חדר יש מזהה ייחודי, סוג, עלות ללילה מספר מיטות וסטטוס זמינות.

הזמנה (Reservation): כל הזמנה כוללת תאריכי צ'ק-אין וצ'ק-אאוט, סטטוס הזמנה, ואורח מבצע ההזמנה.

תשלום (Payment): עבור כל הזמנה מתבצע תשלום הכולל סכום לתשלום ושיטת התשלום.

בן אדם (Person): ישות כללית שממנה נגזרות שתי ישויות נוספות:

אורח (Guest): מבצע הזמנה של חדרים ומשלם עליהם.

עובד (Employee): אחראי על תפעול בתי המלון וכולל פרטי תפקיד, שכר, וותק.

פונקציונליות עיקרית

המערכת מאפשרת לבצע את הפעולות הבאות:

ניהול מלונות – הוספת בתי מלון חדשים, עדכון פרטים וצפייה במידע קיים.

ניהול חדרים – שיוך חדרים לבתי מלון, עדכון פרטי חדר וזמינותם.

ניהול אורחים – הוספת אורחים חדשים, צפייה בפרטיהם וניהול הזמנות קיימות.

ביצוע הזמנות – אורחים יכולים להזמין חדרים ולצפות בפרטי ההזמנה שלהם.

ניהול תשלומים – תיעוד תשלומים שבוצעו לכל הזמנה כולל אמצעי תשלום וסכום.

ניהול עובדים – הוספת עובדים חדשים ועדכון פרטיהם.

שיוך חדרים לעובדים – קביעת האחריות של כל עובד על חדרים מסוימים וניהול חלוקת האחריות בין העובדים.

דיאגרמת ERD:![image](https://github.com/user-attachments/assets/45af8a3e-ce38-49cd-b88d-d66a0379bdbf)

תרשים DSD
![צילום מסך 2025-03-31 124531](https://github.com/user-attachments/assets/66e5b00a-e30c-48ee-abc6-92e67106b7ec)


3 השיטות להכנסת נתונים:

1. ישירות מקוד בפייתון:

![צילום מסך 2025-03-31 131839](https://github.com/user-attachments/assets/f5f41f6d-505e-42cf-8c76-032ec07c4998)

2. יצירת השאילתות דרך קוד בפייתון:

![image](https://github.com/user-attachments/assets/0e13578e-ae1f-4092-bcb6-5a41e62d0449)
   הפלט:

![image](https://github.com/user-attachments/assets/88b0ca55-c490-4667-811f-bd1533fbaa0b)

3. יצירת קובץ CSV מאתר mockaroo:

![image](https://github.com/user-attachments/assets/3304039d-edd1-4f23-8e3e-859c435d4d9c)
הקובץ שנוצר:

![image](https://github.com/user-attachments/assets/dead27bc-8981-4338-a40a-3eebb6d385a0)




גיבוי ושחזור:
![צילום מסך 2025-03-31 094651](https://github.com/user-attachments/assets/52d194db-032c-48e0-8424-c85d994f1ddb)

![צילום מסך 2025-03-31 094736](https://github.com/user-attachments/assets/f96a3af4-f775-4433-be15-a03e7bd1125f)

דוח שלב ב'- שאילתות ואילוצים:

שאילתות select:
1. מציגה את רשימת האורחים שביצעו check-in במהלך חודש מאי - כולל מידע על המלון, סוג החדר ומחיר ללילה
![image](https://github.com/user-attachments/assets/17992c13-19e2-4994-8e34-2905b54e7f73)
![image (1)](https://github.com/user-attachments/assets/376cff59-54c5-4a31-9f57-d859f86991e5)

2. כל החדרים שלא משויכים לאף הזמנה
![unnamed](https://github.com/user-attachments/assets/ee465b26-7df4-428c-8f3c-346195db1d91)
![unnamed](https://github.com/user-attachments/assets/a5f4b070-4e93-4e48-8c39-282ea7b2d14c)

3. מציגה עבור כל מלון את הכנסותיו הכלליות עבור כל ההזמנות שבוצעו אצלו
![unnamed](https://github.com/user-attachments/assets/be97de61-6bdf-4bae-a11f-0f172db0da94)
![unnamed](https://github.com/user-attachments/assets/59748df3-a58f-4c1e-b9cf-eed1f2da1fb8)

4. מציגה את כל ההזמנות שבוצעו השנה עם מספר הזמנה, שם האורח ותאריכים
![unnamed](https://github.com/user-attachments/assets/dd0735a3-6f70-4559-bd7f-49c4863335cf)
![unnamed](https://github.com/user-attachments/assets/7e91af33-5a50-4f2a-8972-6cfa18bc4353)

5. מציגה מחיר ממוצע ללילה לפי סוג החדר
![unnamed](https://github.com/user-attachments/assets/719e83ef-a864-4676-812d-68fd0372c418)

6. מציגה עובדים שאחראים על יותר מ2 חדרים
![unnamed](https://github.com/user-attachments/assets/d2c96191-edc6-4843-ab01-3d65b478d03e)
![unnamed](https://github.com/user-attachments/assets/6b8f5d32-342a-4b54-98c4-07767272c9ce)

7. מציגה את החדרים שיש בהם אורחים ברגע זה ואת שמות האורחים
![unnamed](https://github.com/user-attachments/assets/18fb9574-3dcd-4ddd-9460-1d125a75cced)
![unnamed](https://github.com/user-attachments/assets/2a6acd1a-1522-424d-8057-2d090381008f)

8. מציגה פירוט מלא של הזמנה - שם האורח, פרטי תשלום, סוג חדר, ותאריכי כניסה ויציאה
![unnamed](https://github.com/user-attachments/assets/1327944e-8779-4560-8755-d77a2c35f7bd)
![unnamed](https://github.com/user-attachments/assets/39a77cb0-c231-488a-827e-2fcb6c396b2a)


שאילתות delete:

1.מחיקת כל ההזמנות שבוצעו בשנה הקודמת ושכבר הסתיימו

לפני הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/ad36a2bc-8e1b-4d4f-b84a-7c0a8f27f831)
השאילתה-
![unnamed](https://github.com/user-attachments/assets/16882624-df73-42eb-b786-75b1bec15fcf)
לאחר הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/e215543e-f5ba-4a48-a578-7372220f627e)


2. מחיקת כל החדרים שאף אחד לא הזמין אותם ואף עובד לא אחראי עליהם

לפני הרצת השאילתה, ניתן לראות שיש 1000 שורות-
![unnamed](https://github.com/user-attachments/assets/72d9a4bc-b2fc-4799-b34b-e092efeace12)

השאילתה ומצב בסיס הנתונים לאחר הרצתה, ניתן לראות שיש 400 שורות-
 ![unnamed](https://github.com/user-attachments/assets/63a34a3a-bdc6-4c0a-aae2-d5ca4a60c757)


3.מחיקת כל האורחים שמעולם לא ביצעו הזמנה

לפני הרצת השאילתה, ניתן לראות שיש 400 שורות-
![unnamed](https://github.com/user-attachments/assets/f72d8b58-d28c-4569-82c3-2e5912b7c09a)

השאילתה ומצב בסיס הנתונים לאחר הרצתה, ניתן לראות שיש 316 שורות-
![unnamed](https://github.com/user-attachments/assets/6829742d-aa5c-4060-a1b6-665d555829d1)


שאילתות update:

1. העלאת מחיר חדר ב5% אם הוזמן יותר מ3 פעמים

לפני הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/48506536-7d31-42b5-ab5c-bccc6b142294)

השאילתה- 
![unnamed](https://github.com/user-attachments/assets/02d6f249-6b35-4f43-8a9d-8ee196514b7e)

לאחר הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/29b0a969-c06a-40e9-94f5-19a9bcb6e02c)


2. עדכון סטטוס הזמנות שהסתיימו ל "completed" והזמנות שתאריך ההגעה שלהן ביום למחרת ל "upcoming"

לפני הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/6dcef830-7877-4c1c-a24e-29574fb18c3c)

השאילתה-
![unnamed](https://github.com/user-attachments/assets/5d7d0750-26f2-4af7-b8d9-6014882ee36f)

לאחר הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/1747fd09-efa6-4ef0-8381-0e6c5dbc94d1)


3. העלאת משכורת עובד לפי ותק

לפני הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/d1f70f8a-63b3-4a45-a439-f8b740f1e702)

השאילתה-

![unnamed](https://github.com/user-attachments/assets/3846ff92-c963-4e39-a6b1-a30a609e5093)

לאחר הרצת השאילתה-
![unnamed](https://github.com/user-attachments/assets/7cb85b68-0cca-4a77-90e6-c9f903f4e357)



פעולת rollback:

מצב בסיס הנתונים לאחר עדכון - ניתן לראות שכל תאריכי היציאה הם ב2025 בגלל פעולת המחיקה הראשונה
![unnamed](https://github.com/user-attachments/assets/7efad103-e147-463f-be85-aa45f8b88460)
מצב בסיס הנתונים לאחר הrollback - ניתן לראות שהמצב חזר לקדמותו (גם לפי מספר השורות שגדל)
![unnamed](https://github.com/user-attachments/assets/4da1dc66-80bb-4001-83b0-5fb76f95fd1b)

פעולת commit:

לאחר הפעלת שאילתת המחיקה, כתבנו commit ולכן גם אחר ביצוע פעולת הrollback המצב נשאר אותו דבר 
![unnamed](https://github.com/user-attachments/assets/a54f3bf9-bca6-4996-98b9-452ecf239457)


אילוצים:

1. שם מלון לא יכול להיות NULL

ניסיון הכנסה שיוצר סתירה- 
![unnamed](https://github.com/user-attachments/assets/23d7b95e-dc51-411d-9db3-f2adbda0923b)


2. משכורת של עובד לא יכולה להיות שלילית או אפס

ניסיון הכנסה שיוצר סתירה- 
![image](https://github.com/user-attachments/assets/b5e32ada-996e-4de6-9c10-e37ebdb1672b)



3. סטטוס של הזמנה יהיה ברירת מחדל "pending"
![image](https://github.com/user-attachments/assets/f217b48e-9c08-4951-bec8-4f830805b875)


דוח שלב 3- אינטגרציה ומבטים:
DSD של הקבוצה השניה :
![image](https://github.com/user-attachments/assets/84d86528-36f3-4a83-ae7a-027884f48658)

ERD של הקבוצה השניה:
![image](https://github.com/user-attachments/assets/e7f56d56-9e7a-4483-9a8b-32962c33c9e5)

סדר עבודה :
התחלנו בליצור את ה DSD לפי הטבלאות שקיבלנו בגיבוי ולאחר מכן יצרנו ERD בהתאמה כולל מפתחות זרים וקשרים מתאימים 
שמנו קשר של יחד לרבים בין facility ל activity כך שב activity יש מפתח זר של facilitiyid מכיוון שראינו בטבלה של activitiy מופיעה תכונה זו כנל לגבי employee.
שמנו קשר של אחד לרבים בין reservation ל Person Activity and Payment מכיוון שיש בזהמנה את המפתחות של שלושתם כמפתחות זרים.
בנוסף יש ירושה מperson ל visitor and employee ראינו זאת מכיוון שהם מקבלים את המפתח שלו והם גם סוג של אנשים.

עכשיו אנו רוצות ליצור שילוב של ה ERD החדש עם ה ERD שלנו, לקחנו את ה ERD החדש ועליו אנו מוסיפות לפי הצורך 
תחילה הוספו את 2 ההישויות hotel ו room שלא היו קיימות ב ERD החדש
היישות Person - נמצאת בשתי ה ERD אך ב ERD החדש התכונה name מחולקת ל2 firstname,lastname לעומת ה ERD הקודם שכתוב רק name אנחנו בשילוב בחרנו את החלוקה ל2.
היישות Employee - נמצאת בשתי ה ERD אך ב ERD החדש התכונות salary וtenure לא היו ולכן הוספנו אותם והגדרנו אותם nullable
היישות Visitor - שקיימת ב ERD החדש אצלנו מופיעה כיישות בשם Guest אבל עם אותה משמעות בחרנו את השם visitor שלו ב ERD החדש היתה תכונה של isHotelGuest ואותה השארנו והגדרנו nullable(ל Guest לא היו תכונות אלא רק המפתח שעבר בירושה שעובר גם פה) 
היישות Reservation -  נמצאת בשתי ה ERD אבל בכל אחד יש לה משמעות שונה בERD החדש המשמעות היא-הזמנה של פעילות ובERD שלנו המשמעות היא -הזמנה של חדר במלון,לכן ראינו צורך ביישות חדשה resType.
היישות resType-שלה יש 2 תכונות,תכונה אחת TId-שהיא 1 עבור מלון ו2 עבור פעילות ותכונה נוספת TypeOf שבה יהיה מלון או פעילות,קישרנו יישות זאת ליישות של הזמנה עי קשר (Of) של אחד לרבים כך שכל הזמנה יהיה TId על מנת שנוכל לדעת באיזה סוג הזמנה מדובר.
בנוסף ביישות הזמנה היו 2 תכונות זהות של תאריך הזמנה וid של הזמנה (בחדש נקרא : reservationid ו reservationDate ואצלנו RID ו BookingDate) ולנו היו תכונות נוספות ולכן נוסיף אותם ונגדיר אותם כ nullable.

ה ERD החדש:

![image (5)](https://github.com/user-attachments/assets/59b428f0-f43f-4b56-ab8a-1dd4e644858f)

הDSD החדש:

![image](https://github.com/user-attachments/assets/217a50d1-49c5-48ae-85e2-cec3af5aaee6)


מבט ראשון:


מנקודת המבט שלהם, הוא מרכז את כל המידע הרלוונטי על מבקרים, הפעילות שהוזמנה, המתקן שבו היא מתקיימת, ומידע על התשלום (אם קיים)

שליפת נתונים עם select:
![Screenshot 2025-05-18 193041](https://github.com/user-attachments/assets/15a7f86d-ce29-41b1-b1e3-631ee1b268cc)


שאילתות על המבט הראשון:

שאילתה ראשונה:

ממוצע תשלום לפי סוג פעילות, רק למי שהוא אורח במלון

![image](https://github.com/user-attachments/assets/11798c11-0265-4076-b4be-31fc4c1e3d7f)

שאילתה שניה:

רשימה של 5 הפעילויות שהוזמנו הכי הרבה שהם הכי פופלריות

![image](https://github.com/user-attachments/assets/3d93a678-f3e7-4b55-b20a-783523ee4476)



מבט שני:


מנקודת המבט שלנו,מרכז את כל המידע הרלוונטי על האורחים, ההזמנות שלהם, החדרים שהוזמנו, ומידע בסיסי על המלון

שליפת נתונים עם select:

![Screenshot 2025-05-18 192618](https://github.com/user-attachments/assets/03e0af34-ac78-427f-a265-d03705e03535)


שאילתות על המבט השני :

שאילתה ראשונה :

כמה הזמנות היו בכל מיקום (עיר), מה ההכנסה הכוללת ממלונות שם ומה התשלום הממוצע להזמנה

![image](https://github.com/user-attachments/assets/72fc5f72-67ce-400d-9146-05f2350a05d7)

שאילתה שניה :

רשימת אורחים שחזרו וביצעו מספר הזמנות, עם כמה הזמנות כל אחד ביצע

![image](https://github.com/user-attachments/assets/94996bb2-06e8-4477-8106-0868c11c3109)




דוח שלב ד'- תכנות PL/pgSQL:

פונקציות:
פונקציה 1: החזרת רשימת פעילויות עם מקומות פנויים בלבד
![image](https://github.com/user-attachments/assets/7be82de6-f2a8-4b77-8118-94b6dc9bcccc)

בדיקה שהפונקציה עובדת:
![image](https://github.com/user-attachments/assets/cb853bdc-8147-497c-852d-3d9dbad11bca)

פונקציה 2: חישוב סה"כ תשלום לפי מזהה תשלום
![image](https://github.com/user-attachments/assets/ace02f61-2510-478b-b6d6-410383187d68)

בדיקה שהפונקציה עובדת:
![image](https://github.com/user-attachments/assets/1b2dbc72-09cc-47b8-94d5-baf4abcbe90f)



פונקציה 3: פונקציה שמחזירה רשימת פעילויות דרך REFCURSOR
![image](https://github.com/user-attachments/assets/2f65ac67-fb42-401f-bb93-677c70d924d0)

בדיקה שהפונקציה עובדת:
![image](https://github.com/user-attachments/assets/224c30c6-3002-4b07-bc86-7fc38f2f903e)


פרוצדורות:
פרוצדורה 1: עדכון מחיר פעילות לפי מזהה פעילות
![image](https://github.com/user-attachments/assets/21597595-7187-47f1-ba30-986f40057de7)

הפעלת הפרוצדורה:
![image](https://github.com/user-attachments/assets/522355d2-80b5-4bdc-8988-83e51254c2de)

השינוי בבסיס הנתונים:
![image](https://github.com/user-attachments/assets/3c66ef96-35f7-4bc0-a45f-1fa66fb6345f)


פרוצדורה 2: עדכון סטטוס הזמנה לפקיעה אם תאריך עזיבה עבר
![image](https://github.com/user-attachments/assets/56119bd0-f71d-4d96-b128-7031491dcae9)

הפעלת הפרוצדורה:
![image](https://github.com/user-attachments/assets/d6f16387-5f17-4beb-aa61-e253289cc114)

השינוי בבסיס הנתונים:
![image](https://github.com/user-attachments/assets/3ea7b87f-0743-48da-8b8f-f9b39a07528b)



טריגרים:

טריגר 1: בעת הוספת תשלום – ודא שסכום מעל 0
![image](https://github.com/user-attachments/assets/45d50e0a-2c5a-476d-a6d3-043aba89b554)

בדיקה על ידי שאילתה שזורקת חריגה:
![image](https://github.com/user-attachments/assets/7013dbec-71ae-4cce-aced-dbbc88c7d86a)


טריגר 2: בעת שינוי מצב חדר לעדכן הודעה בלוג (ניצור טבלת לוגים)
![image](https://github.com/user-attachments/assets/443ac715-7bd0-4a28-9598-7bdef209b27e)

הפעלת הטריגר:
![image](https://github.com/user-attachments/assets/da5b4759-41ff-4efd-86e3-b8a2a52bed83)

הוכחה שהטריגר עובד על ידי הסתכלות בלוג בנוצר:
![image](https://github.com/user-attachments/assets/46bfa7e3-7e20-4132-91de-9a1edb426b4c)


תוכניות ראשיות:

תוכנית ראשית 1: מציגה את כל הפעילויות הפנויות ואז מעדכנת מחיר של פעילות
![image](https://github.com/user-attachments/assets/3db6d8ac-e8d4-401c-97f6-a51f1e3c3138)

תוכנית ראשית 2: מקבלת תשלום לפי מזהה ומפעילה ניקוי הזמנות ישנות
![image](https://github.com/user-attachments/assets/8bb29b23-2690-46f8-ab75-36e478f45671)





















# 🍯 דבש — מדריך הקמת דף הנחיתה

מדריך צעד-אחר-צעד להקמת דף הנחיתה של דבש. בסוף — האתר חי, אוסף אימיילים, וזמין בכתובת `dvash.vercel.app`.

**זמן משוער: 20–30 דקות.**

---

## 📋 מה נצטרך

לפני שמתחילים — תפתחי **שני חשבונות חינמיים**:

1. **Supabase** — מסד הנתונים (לאחסון המיילים) — [supabase.com](https://supabase.com)
2. **Vercel** — אחסון האתר עצמו — [vercel.com](https://vercel.com)

ב-2 השירותים — תוכלי להירשם עם **חשבון Google** במהירות.

---

## שלב 1: הקמת מסד הנתונים ב-Supabase

### 1.1 יצירת פרויקט

1. כנסי ל-[supabase.com](https://supabase.com) ולחצי **"New project"**.
2. תני שם: `dvash-landing`
3. בחרי סיסמה חזקה למסד הנתונים (שמרי אותה — לא תצטרכי אותה לעתים קרובות, אבל טוב לשמור).
4. אזור (Region): **Frankfurt** (קרוב לישראל = מהיר יותר).
5. לחצי **"Create new project"**.

⏳ ממתינים ~2 דקות עד שהפרויקט מוכן.

### 1.2 יצירת טבלת ה-Waitlist

1. בתפריט השמאלי, לחצי על **SQL Editor**.
2. לחצי **"New query"**.
3. פתחי את הקובץ `supabase-schema.sql` (בתיקיית הפרויקט שלך), העתיקי את **כל התוכן**, והדביקי בעורך ה-SQL.
4. לחצי **"Run"** (פינה ימנית למטה).
5. ✅ אמורה להופיע הודעה ירוקה: "Success. No rows returned."

### 1.3 קבלת המפתחות

1. בתפריט השמאלי, לחצי על **Settings** ⚙️
2. לחצי על **API**.
3. תראי שני ערכים חשובים — **שמרי אותם**:
   - **Project URL** — נראה כמו: `https://xxxxx.supabase.co`
   - **anon / public key** — מחרוזת ארוכה שמתחילה ב-`eyJhbG...`

---

## שלב 2: עדכון האתר עם המפתחות

1. פתחי את הקובץ `index.html` בעורך טקסט (Notepad / VS Code / כל עורך).
2. חפשי: `YOUR_SUPABASE_URL_HERE`
3. החליפי את **שני הערכים**:
   ```javascript
   const SUPABASE_URL = 'https://xxxxx.supabase.co';  // ה-URL שלך
   const SUPABASE_ANON_KEY = 'eyJhbG...';              // ה-anon key שלך
   ```
4. שמרי את הקובץ.

✅ **בדיקה מקומית:** פתחי את `index.html` בדפדפן, נסי להירשם, ובדקי ב-Supabase תחת **Table Editor → waitlist** שהאימייל נשמר.

---

## שלב 3: העלאה ל-Vercel

### האופציה הכי קלה (Drag & Drop):

1. כנסי ל-[vercel.com](https://vercel.com) והתחברי.
2. לחצי **"Add New..."** → **"Project"**.
3. בחרי **"Browse all templates"** או "Import" אם יש לך GitHub.

### האופציה הקלה ביותר — אם אין לך GitHub:

1. ב-Vercel, לחצי **"Add New..."** → **"Project"** → **"Deploy"**.
2. ברר מסך **"Import Git Repository"** — בתחתית יש כפתור **"Continue with another tool"** או **"Deploy your project"**.
3. **אופציה אחרת — דרך CLI:**
   - פתחי terminal/PowerShell בתיקייה `dvash-landing`.
   - הריצי: `npx vercel`
   - תיכנסי עם המייל שלך, ועני "Y" לכל שאלה.
   - תוך דקה — האתר חי בכתובת `dvash-xxxxx.vercel.app`.

### לקבלת הכתובת `dvash.vercel.app`:

1. ב-Vercel, לחצי על הפרויקט.
2. **Settings** → **Domains**.
3. שני את שם הפרויקט ל-`dvash` (אם פנוי).
4. הכתובת תהיה `dvash.vercel.app` 🎉

---

## שלב 4: בדיקה סופית

1. פתחי את הכתובת באינטרנט.
2. נסי להירשם דרך אחד מהטפסים.
3. בדקי ב-Supabase שהאימייל נשמר.
4. ✅ מוכן!

---

## 📊 איך לראות מי נרשם

1. כנסי ל-Supabase.
2. **Table Editor** → **waitlist**.
3. תראי את כל ההרשמות לפי תאריך.

**מידע שנשמר על כל הרשמה:**
- `email` — האימייל
- `source` — איפה בדף נרשמו (hero / inline-cta / final)
- `created_at` — מתי
- `user_agent` — איזה דפדפן/מכשיר

---

## 🆘 בעיות נפוצות

**"הטופס לא מגיב כשאני לוחצת על הצטרפו"**
→ בדקי שהמפתחות ב-`index.html` נכונים (URL ו-anon key).
→ פתחי את ה-Console בדפדפן (F12) ובדקי אם יש שגיאות.

**"אימייל כבר רשום"**
→ זה תקין — מערכת מונעת כפילויות. המשתמש לא יראה הודעת שגיאה, יחווה את ה"הצלחה" הרגילה.

**"הצבעים נראים ענקיים במובייל"**
→ ודאי שיש בקובץ `<meta name="viewport" content="width=device-width, initial-scale=1.0">` בראש (יש שם בקובץ הקיים).

---

## 🚀 הצעדים הבאים

אחרי שהאתר חי:
1. **שתפי את הקישור** בקבוצות הפייסבוק/וואטסאפ שלך.
2. **תוסיפי Google Analytics** או **PostHog** לראות מאיפה אנשים מגיעים.
3. **תרכשי דומיין** (dvash.app / getdvash.com) ותחברי ל-Vercel.
4. **תתחילי לבנות את האפליקציה** עצמה (פרויקט נפרד שיתחבר לאותו Supabase).

🍯 **בהצלחה!**

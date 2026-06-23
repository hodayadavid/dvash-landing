# 🍯 דבש — דף נחיתה

דף הנחיתה הרשמי של אפליקציית "דבש" — מטפל זוגי דיגיטלי לזוגות שומרי נידה.

## 🚀 התחלה מהירה

**הקובץ הראשי:** [`index.html`](./index.html) — דף נחיתה מלא, RTL, רספונסיבי.

**מדריך הקמה:** ראי [`SETUP.md`](./SETUP.md) — צעד-אחר-צעד מהקמת Supabase ועד פרסום ב-Vercel.

## 📁 מבנה הפרויקט

```
dvash-landing/
├── index.html              ← דף הנחיתה (HTML+CSS+JS - הכל בקובץ אחד)
├── supabase-schema.sql     ← SQL ליצירת טבלת ה-waitlist
├── vercel.json             ← הגדרות אבטחה ל-Vercel
├── SETUP.md                ← מדריך הקמה (חובה לקרוא!)
└── README.md               ← הקובץ הזה
```

## ✨ מה הדף כולל

- **6 הזדמנויות הרשמה** לרשימת המתנה (Hero, 4 CTA banners, Final)
- **Sticky bar תחתון** אדפטיבי
- **Age verification** של 18+ בכל טופס (חובה לפני App Store)
- **Supabase integration** — כל הרשמה נשמרת אוטומטית
- **רספונסיבי מלא** — נראה מצוין במובייל ובדסקטופ
- **אנימציות עדינות** — particles, shimmer, parallax
- **טעינה מהירה** — קובץ HTML יחיד, אין build process

## 🎨 עיצוב

הדף מבוסס על מערכת העיצוב המלאה של דבש (`DESIGN.md` בפרויקט הראשי), עם:
- **פלטה דרמטית סוערת** לדף הנחיתה (שונה מהאפליקציה שמתחלפת אלגנטי↔סוער)
- **פונטים:** Suez One (כותרות), Frank Ruhl Libre (איטליק זהוב), Assistant (גוף)
- **גרדיאנט זהב** למוטיב המרכזי, וריאציות יין-בורגונדי לרקעים

## 📊 איסוף נתונים

כל הרשמה נשמרת ב-Supabase עם:
- `email`
- `source` (hero / inline-cta / final)
- `age_confirmed: true`
- `user_agent`
- `created_at`

ראי את הנתונים ב-Supabase תחת **Table Editor → waitlist**.

## 🔒 פרטיות

- **אין ניתוח חיצוני** מובנה (אפשר להוסיף PostHog/GA אחר כך)
- **Headers אבטחה** מוגדרים ב-`vercel.json`
- **RLS מופעל** ב-Supabase — רק admin רואה את הרשימה

---

🍯 **דבש** · נבנה עם אהבה

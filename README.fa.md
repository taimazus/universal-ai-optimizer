# 🚀 بسته جامع بهینه‌سازی و آدیت ایجنت‌های هوش مصنوعی (Universal AI Optimizer & Audit)

> **ابرسیستم ۲-در-۱ برای توسعه‌دهندگان و تیم‌ها: ترکیب موتور بهینه‌ساز توکن XERJ با پلتفرم بازرسی و امنیت Universal AI Audit.**

[English Documentation](README.md)

---

## 🎯 چرا این بسته همه‌چیز-تمام است؟

این پروژه دوتا از قدرتمندترین ابزارهای توسعه هوش مصنوعی را در قالب **یک اسکریپت نصب ۱-کلیکه** ترکیب کرده است:

1. **موتور XERJ (کاهش ۴۰ برابری توکن و جستجوی معنایی):**  
   - جستجوی هایبرید فوق‌سریع در کدهای پروژه، داکیومنت‌ها، لاگ‌ها و PDFها.
   - حذف کامل دستورات سنگین و هدردهنده توکن مثل `grep`.
   - ایجاد حافظه بین‌چتی (Memory Graph) تا تنظیمات شما در هیچ چتی فراموش نشود.

2. **پلتفرم [Universal AI Audit](https://github.com/taimazus/universal-ai-audit) (توسعه‌داده‌شده توسط Taimazus):**  
   - تجهیز تمام ایجنت‌ها به بیش از **۲۰ مهارت اینترپرایز** (شامل `security-audit`, `pr-review`, `test-gap-analysis`, `enterprise-audit` و ...).
   - اسکن خودکار و عیب‌یابی امنیتی و ساختاری در پروژه‌ها.
   - اعمال استاندارد بدون خطای خاموش (Silent Failure Ban).

---

## ⚡ نحوه نصب سراسری برای خودتان و همکاران (۱ کلیک)

در ویندوز، **PowerShell (Run as Administrator)** را باز کنید و دستور زیر را اجرا کنید:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; irm https://raw.githubusercontent.com/taimazus/universal-ai-optimizer/main/setup-ai-optimizer.ps1 | iex
```

با این یک خط، هر دو ابزار دانلود، کامپایل، در تمام IDEها ثبت و فعال می‌شوند.

---

## 🧩 محیط‌های پشتیبانی‌شده
- **Google Antigravity IDE**
- **Cursor IDE**
- **Claude Code & Claude Desktop**
- **VS Code (افزونه‌های Cline / Roo Code / Continue)**

---

## 👨‍💻 سازنده
طراحی و توسعه توسط **[Taimazus](https://github.com/taimazus)**  
- ریپازیتوری بهینه‌ساز: [taimazus/universal-ai-optimizer](https://github.com/taimazus/universal-ai-optimizer)  
- ریپازیتوری بازرس امنیتی: [taimazus/universal-ai-audit](https://github.com/taimazus/universal-ai-audit)

### ⚠️ رفع خطای دسترسی یا مسدودیت اسکریپت در ویندوز
در صورتی که ویندوز خطای عدم دسترسی یا ExecutionPolicy داد، کافی است پنجره PowerShell را به صورت **Run as Administrator** باز کنید. عبارت Set-ExecutionPolicy Bypass ابتدای دستور، تمام موانع را برای این سشن به صورت خودکار باز می‌کند.

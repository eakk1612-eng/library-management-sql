# 📚 ระบบจัดการห้องสมุด (Library Management System)

โปรเจกต์ตัวอย่างสำหรับพอร์ตฝึกงาน แสดงทักษะการออกแบบฐานข้อมูล เขียน SQL query
และนำข้อมูลไปแสดงผลผ่าน dashboard — ใช้ **SQLite** เป็นฐานข้อมูล

---

## 🎯 โจทย์ของระบบ

ห้องสมุดต้องการระบบติดตาม:
- หนังสือในคลัง และจำนวนคงเหลือ
- สมาชิกที่ยืม-คืนหนังสือ
- รายการค้างคืน และค่าปรับ

---

## 🗂️ ER Diagram

```
Categories                Books                    Members
+--------------+          +-------------------+    +--------------+
| category_id  |<---+     | book_id           |    | member_id    |
| category_name|    |     | title             |    | full_name    |
+--------------+    +-----| author            |    | email        |
                          | category_id (FK)  |    | join_date    |
                          | total_copies      |    +--------------+
                          | available_copies  |            |
                          +-------------------+            |
                                    |                       |
                                    |     Borrows           |
                                    |   +-------------------+---+
                                    +---| book_id (FK)          |
                                        | member_id (FK)  <------+
                                        | borrow_id (PK)         |
                                        | borrow_date            |
                                        | due_date               |
                                        | return_date             |
                                        | status                  |
                                        +-------------------------+
                                                    |
                                                    |
                                              Fines |
                                        +-----------+--------+
                                        | fine_id            |
                                        | borrow_id (FK)     |
                                        | amount             |
                                        | paid               |
                                        +--------------------+
```

**ความสัมพันธ์:**
- `Categories` 1 --- N `Books`
- `Books` N --- N `Members` ผ่านตารางเชื่อม `Borrows`
- `Borrows` 1 --- N `Fines` (การยืม 1 ครั้งอาจมีค่าปรับได้)

---

## 📁 โครงสร้างไฟล์

| ไฟล์ | รายละเอียด |
|---|---|
| `schema.sql` | คำสั่ง `CREATE TABLE` ทั้งหมด พร้อม foreign key และ index |
| `sample_data.sql` | ข้อมูลตัวอย่าง (หนังสือ 18 เล่ม, สมาชิก 12 คน, ประวัติยืม-คืน 40 รายการ) |
| `queries.sql` | Query ตัวอย่าง 10 ข้อ ตั้งแต่ JOIN พื้นฐานถึง subquery |
| `library.db` | ไฟล์ฐานข้อมูล SQLite ที่พร้อมใช้งาน (สร้างจาก schema + sample data) |
| `dashboard.html` | หน้า dashboard แสดงข้อมูลจริงจากฐานข้อมูล เปิดในเบราว์เซอร์ได้ทันที |
| `build_db.py` | สคริปต์ Python ที่ใช้สร้าง `library.db` และ `sample_data.sql` |

---

## ▶️ วิธีใช้งาน

### ดู Dashboard
เปิดไฟล์ `dashboard.html` ด้วยเบราว์เซอร์ได้เลย (ดับเบิลคลิก) — ไม่ต้องติดตั้งอะไร
หน้านี้โหลดฐานข้อมูล SQLite ทั้งไฟล์เข้าไปรันในเบราว์เซอร์ผ่าน **sql.js (WebAssembly)**
จึงต้องมีอินเทอร์เน็ตตอนเปิดครั้งแรก (เพื่อโหลดไลบรารีจาก CDN) แต่ไม่ต้องมี backend server

### รัน Query เอง
1. ไปที่เว็บ [sqliteonline.com](https://sqliteonline.com) หรือใช้โปรแกรม DB Browser for SQLite
2. อัปโหลดไฟล์ `library.db`
3. ลองรัน query จากไฟล์ `queries.sql`

### สร้างฐานข้อมูลใหม่จากศูนย์
```bash
python3 build_db.py
```
จะได้ `library.db` และ `sample_data.sql` ใหม่ (ใช้ `random.seed(42)` ผลลัพธ์เดิมทุกครั้ง)

---

## 🧠 Query เด่นที่ใช้อธิบายตอนสัมภาษณ์

1. **Top 5 หนังสือยอดนิยม** — `JOIN` + `GROUP BY` + `COUNT` + `ORDER BY` + `LIMIT`
2. **รายการค้างคืน พร้อมนับจำนวนวันที่เกิน** — `JOIN` สามตาราง + ฟังก์ชันวันที่ `julianday()`
3. **ค่าปรับที่ยังไม่จ่าย แยกตามสมาชิก** — `JOIN` สามตาราง + `HAVING`
4. **อัตราการคืนช้าของแต่ละสมาชิก (%)** — `CASE WHEN` + การคำนวณเปอร์เซ็นต์
5. **หนังสือที่ไม่เคยถูกยืมเลย** — `LEFT JOIN` + `IS NULL` (หา unmatched rows)

รายละเอียดทั้งหมดพร้อมคอมเมนต์อยู่ใน `queries.sql`

---

## 💡 ต่อยอดได้ถ้ามีเวลา

- เพิ่มหน้า "ยืมหนังสือ" ที่เขียนกลับเข้าฐานข้อมูลจริง (ตอนนี้เป็น read-only dashboard)
- ทำระบบ login แยกสิทธิ์บรรณารักษ์ / สมาชิก
- Deploy เป็นเว็บแอปจริงด้วย Flask/FastAPI + PostgreSQL แทน SQLite
- เพิ่ม query แจ้งเตือนหนังสือที่ใกล้หมด (available_copies = 0)

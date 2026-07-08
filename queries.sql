-- ============================================
-- Library Management System - Example Queries
-- ============================================
-- รวม query ที่ใช้แสดงทักษะ SQL ตั้งแต่พื้นฐานถึงระดับกลาง
-- ============================================

-- 1) หนังสือทั้งหมด พร้อมชื่อหมวดหมู่ (JOIN พื้นฐาน)
SELECT b.title, b.author, c.category_name, b.available_copies, b.total_copies
FROM Books b
JOIN Categories c ON b.category_id = c.category_id
ORDER BY b.title;


-- 2) Top 5 หนังสือที่ถูกยืมบ่อยที่สุด (JOIN + GROUP BY + COUNT)
SELECT b.title, b.author, COUNT(br.borrow_id) AS times_borrowed
FROM Borrows br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.book_id
ORDER BY times_borrowed DESC
LIMIT 5;


-- 3) รายการที่ค้างคืน (overdue) พร้อมชื่อสมาชิกและชื่อหนังสือ
SELECT m.full_name, b.title, br.due_date,
       CAST(julianday('now') - julianday(br.due_date) AS INTEGER) AS days_overdue
FROM Borrows br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b   ON br.book_id = b.book_id
WHERE br.status = 'overdue'
ORDER BY days_overdue DESC;


-- 4) จำนวนหนังสือคงเหลือ แยกตามหมวดหมู่ (GROUP BY + SUM)
SELECT c.category_name,
       SUM(b.available_copies) AS available,
       SUM(b.total_copies) AS total
FROM Books b
JOIN Categories c ON b.category_id = c.category_id
GROUP BY c.category_id
ORDER BY available ASC;


-- 5) สมาชิกที่ยืมหนังสือเยอะที่สุด (Top borrower)
SELECT m.full_name, COUNT(br.borrow_id) AS total_borrows
FROM Members m
JOIN Borrows br ON m.member_id = br.member_id
GROUP BY m.member_id
ORDER BY total_borrows DESC
LIMIT 5;


-- 6) ค่าปรับรวมที่ยังไม่ได้จ่าย แยกตามสมาชิก (JOIN สามตาราง + WHERE)
SELECT m.full_name, SUM(f.amount) AS unpaid_fine
FROM Fines f
JOIN Borrows br ON f.borrow_id = br.borrow_id
JOIN Members m  ON br.member_id = m.member_id
WHERE f.paid = 0
GROUP BY m.member_id
HAVING unpaid_fine > 0
ORDER BY unpaid_fine DESC;


-- 7) จำนวนการยืมต่อเดือน (สำหรับกราฟแนวโน้ม)
SELECT strftime('%Y-%m', borrow_date) AS month, COUNT(*) AS borrow_count
FROM Borrows
GROUP BY month
ORDER BY month;


-- 8) หนังสือที่ไม่เคยถูกยืมเลย (LEFT JOIN + IS NULL)
SELECT b.title, b.author
FROM Books b
LEFT JOIN Borrows br ON b.book_id = br.book_id
WHERE br.borrow_id IS NULL;


-- 9) อัตราการคืนช้า (%) ของแต่ละสมาชิก (Subquery)
SELECT m.full_name,
       COUNT(br.borrow_id) AS total_borrows,
       SUM(CASE WHEN br.status = 'overdue' THEN 1 ELSE 0 END) AS overdue_count,
       ROUND(100.0 * SUM(CASE WHEN br.status = 'overdue' THEN 1 ELSE 0 END) / COUNT(br.borrow_id), 1) AS overdue_rate_pct
FROM Members m
JOIN Borrows br ON m.member_id = br.member_id
GROUP BY m.member_id
ORDER BY overdue_rate_pct DESC;


-- 10) สรุปภาพรวมห้องสมุด (Dashboard summary card)
SELECT
    (SELECT COUNT(*) FROM Books) AS total_books,
    (SELECT SUM(total_copies) FROM Books) AS total_copies,
    (SELECT COUNT(*) FROM Borrows WHERE status != 'returned') AS currently_borrowed,
    (SELECT COUNT(*) FROM Borrows WHERE status = 'overdue') AS overdue_count,
    (SELECT COUNT(*) FROM Members) AS total_members;

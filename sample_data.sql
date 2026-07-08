-- ============================================
-- Library Management System - Sample Data
-- ============================================

-- Categories
INSERT INTO Categories (category_id, category_name) VALUES (1, 'นวนิยาย');
INSERT INTO Categories (category_id, category_name) VALUES (2, 'วิทยาศาสตร์');
INSERT INTO Categories (category_id, category_name) VALUES (3, 'ประวัติศาสตร์');
INSERT INTO Categories (category_id, category_name) VALUES (4, 'คอมพิวเตอร์');
INSERT INTO Categories (category_id, category_name) VALUES (5, 'การ์ตูน/มังงะ');
INSERT INTO Categories (category_id, category_name) VALUES (6, 'จิตวิทยา');

-- Books
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (1, 'แฮร์รี่ พอตเตอร์ กับศิลาอาถรรพ์', 'J.K. Rowling', 1, 4, 3);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (2, 'นอร์วีเจียนวูด', 'Haruki Murakami', 1, 3, 2);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (3, 'เศรษฐศาสตร์แบบเข้าใจง่าย', 'สมชาย ใจดี', 1, 2, -2);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (4, 'A Brief History of Time', 'Stephen Hawking', 2, 3, 3);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (5, 'Cosmos', 'Carl Sagan', 2, 2, 2);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (6, 'สรุปประวัติศาสตร์โลก', 'อาจารย์วิชัย', 3, 3, 2);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (7, 'ราชวงศ์ไทยในอดีต', 'สุนทร พงษ์ไทย', 3, 2, 1);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (8, 'Clean Code', 'Robert C. Martin', 4, 4, 1);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (9, 'Introduction to SQL', 'John Doe', 4, 5, 5);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (10, 'Python Crash Course', 'Eric Matthes', 4, 4, 3);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (11, 'Design Patterns', 'Gang of Four', 4, 2, 1);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (12, 'One Piece เล่ม 1', 'Eiichiro Oda', 5, 5, 4);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (13, 'Naruto เล่ม 1', 'Masashi Kishimoto', 5, 4, 3);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (14, 'Attack on Titan เล่ม 1', 'Hajime Isayama', 5, 3, 2);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (15, 'Thinking, Fast and Slow', 'Daniel Kahneman', 6, 3, 2);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (16, 'จิตวิทยาความสัมพันธ์', 'ดร.ปัทมา สายใจ', 6, 2, 1);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (17, 'Atomic Habits', 'James Clear', 6, 4, 2);
INSERT INTO Books (book_id, title, author, category_id, total_copies, available_copies) VALUES (18, '1984', 'George Orwell', 1, 3, 1);

-- Members
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (1, 'สมชาย ใจดี', 'สมชาย0@email.com', '2025-11-04');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (2, 'สมหญิง รักเรียน', 'สมหญิง1@email.com', '2025-01-24');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (3, 'วิชัย สายบัว', 'วิชัย2@email.com', '2025-05-08');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (4, 'มานี แสงทอง', 'มานี3@email.com', '2025-04-05');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (5, 'สุดา ทองมี', 'สุดา4@email.com', '2025-12-04');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (6, 'ประยุทธ ศรีสุข', 'ประยุทธ5@email.com', '2025-11-24');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (7, 'อรุณี บุญเลิศ', 'อรุณี6@email.com', '2025-09-03');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (8, 'กมล วงศ์ไทย', 'กมล7@email.com', '2025-10-14');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (9, 'นภา ใจดี', 'นภา8@email.com', '2025-01-01');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (10, 'ธนกร รักเรียน', 'ธนกร9@email.com', '2025-02-07');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (11, 'ปิยะ สายบัว', 'ปิยะ10@email.com', '2025-04-17');
INSERT INTO Members (member_id, full_name, email, join_date) VALUES (12, 'ศิริพร แสงทอง', 'ศิริพร11@email.com', '2025-10-01');

-- Borrows
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (1, 18, 4, '2026-05-22', '2026-07-16', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (2, 14, 4, '2026-06-08', '2026-07-08', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (3, 6, 12, '2026-06-09', '2026-06-23', '2026-06-22', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (4, 7, 6, '2026-06-30', '2026-07-14', '2026-07-11', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (5, 12, 6, '2026-05-29', '2026-06-12', '2026-06-09', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (6, 15, 9, '2026-06-29', '2026-06-24', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (7, 3, 9, '2026-06-18', '2026-06-17', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (8, 12, 10, '2026-06-24', '2026-07-08', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (9, 2, 11, '2026-06-22', '2026-07-09', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (10, 8, 2, '2026-06-12', '2026-06-26', '2026-06-26', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (11, 6, 6, '2026-06-14', '2026-06-28', '2026-06-28', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (12, 3, 10, '2026-05-27', '2026-06-10', '2026-06-09', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (13, 6, 8, '2026-06-12', '2026-06-26', '2026-06-28', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (14, 8, 11, '2026-06-16', '2026-07-05', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (15, 8, 1, '2026-05-16', '2026-05-30', '2026-05-30', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (16, 3, 4, '2026-05-09', '2026-06-26', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (17, 7, 11, '2026-06-05', '2026-06-19', '2026-06-19', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (18, 5, 5, '2026-06-28', '2026-07-12', '2026-07-14', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (19, 18, 5, '2026-05-20', '2026-07-17', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (20, 13, 6, '2026-06-22', '2026-07-02', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (21, 17, 8, '2026-07-01', '2026-07-15', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (22, 4, 3, '2026-05-27', '2026-06-10', '2026-06-10', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (23, 3, 7, '2026-06-12', '2026-07-15', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (24, 17, 5, '2026-06-01', '2026-07-06', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (25, 4, 11, '2026-05-11', '2026-05-25', '2026-05-25', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (26, 11, 2, '2026-06-18', '2026-07-02', '2026-07-02', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (27, 1, 12, '2026-05-11', '2026-07-16', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (28, 6, 9, '2026-05-09', '2026-05-23', '2026-05-23', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (29, 17, 10, '2026-06-24', '2026-07-08', '2026-07-07', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (30, 18, 9, '2026-05-09', '2026-05-23', '2026-05-23', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (31, 16, 1, '2026-06-29', '2026-06-27', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (32, 8, 1, '2026-06-21', '2026-07-04', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (33, 3, 12, '2026-06-05', '2026-06-19', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (34, 5, 3, '2026-05-25', '2026-06-08', '2026-06-10', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (35, 6, 5, '2026-06-03', '2026-06-23', NULL, 'overdue');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (36, 7, 9, '2026-05-19', '2026-07-11', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (37, 10, 7, '2026-05-25', '2026-07-15', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (38, 17, 8, '2026-06-29', '2026-07-13', '2026-07-10', 'returned');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (39, 11, 1, '2026-05-30', '2026-07-17', NULL, 'borrowed');
INSERT INTO Borrows (borrow_id, book_id, member_id, borrow_date, due_date, return_date, status) VALUES (40, 8, 1, '2026-07-02', '2026-07-16', NULL, 'borrowed');

-- Fines
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (1, 6, 65.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (2, 7, 100.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (3, 13, 10.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (4, 14, 10.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (5, 16, 55.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (6, 18, 10.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (7, 20, 25.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (8, 24, 5.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (9, 31, 50.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (10, 32, 15.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (11, 33, 90.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (12, 34, 10.0, 0);
INSERT INTO Fines (fine_id, borrow_id, amount, paid) VALUES (13, 35, 70.0, 0);


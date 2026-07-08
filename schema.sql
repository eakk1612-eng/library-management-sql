-- ============================================
-- Library Management System - Database Schema
-- ============================================
-- โปรเจกต์: ระบบจัดการห้องสมุด (ยืม-คืนหนังสือ)
-- Engine: SQLite
-- ============================================

PRAGMA foreign_keys = ON;

-- ตารางหมวดหมู่หนังสือ
CREATE TABLE Categories (
    category_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL UNIQUE
);

-- ตารางหนังสือ
CREATE TABLE Books (
    book_id           INTEGER PRIMARY KEY AUTOINCREMENT,
    title             TEXT NOT NULL,
    author            TEXT NOT NULL,
    category_id       INTEGER NOT NULL,
    total_copies      INTEGER NOT NULL DEFAULT 1,
    available_copies  INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- ตารางสมาชิกห้องสมุด
CREATE TABLE Members (
    member_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name   TEXT NOT NULL,
    email       TEXT NOT NULL UNIQUE,
    join_date   TEXT NOT NULL   -- YYYY-MM-DD
);

-- ตารางการยืม-คืนหนังสือ (many-to-many ระหว่าง Members และ Books)
CREATE TABLE Borrows (
    borrow_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id       INTEGER NOT NULL,
    member_id     INTEGER NOT NULL,
    borrow_date   TEXT NOT NULL,   -- YYYY-MM-DD
    due_date      TEXT NOT NULL,   -- YYYY-MM-DD
    return_date   TEXT,            -- NULL = ยังไม่คืน
    status        TEXT NOT NULL DEFAULT 'borrowed', -- borrowed / returned / overdue
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- ตารางค่าปรับ (กรณีคืนช้า)
CREATE TABLE Fines (
    fine_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    borrow_id   INTEGER NOT NULL,
    amount      REAL NOT NULL,
    paid        INTEGER NOT NULL DEFAULT 0, -- 0 = ยังไม่จ่าย, 1 = จ่ายแล้ว
    FOREIGN KEY (borrow_id) REFERENCES Borrows(borrow_id)
);

-- Index ช่วยให้ query เร็วขึ้น
CREATE INDEX idx_borrows_book   ON Borrows(book_id);
CREATE INDEX idx_borrows_member ON Borrows(member_id);
CREATE INDEX idx_borrows_status ON Borrows(status);

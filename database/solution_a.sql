-- 1. Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users ORDER BY user_name ASC;

-- 2. Lấy ra 07 người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users ORDER BY user_name ASC LIMIT 7;

-- 3. Lấy ra danh sách người dùng theo thứ tự tên Alphabet, trong đó tên có chữ a
SELECT * FROM users WHERE user_name LIKE '%a%' ORDER BY user_name ASC;

-- 4. Lấy ra danh sách người dùng trong đó tên người dùng bắt đầu bằng chữ m
SELECT * FROM users WHERE user_name LIKE 'm%';

-- 5. Lấy ra danh sách người dùng trong đó tên người dùng kết thúc bằng chữ i
SELECT * FROM users WHERE user_name LIKE '%i';

-- 6. Lấy ra danh sách người dùng dùng Gmail
SELECT * FROM users WHERE user_email LIKE '%@gmail.com';

-- 7. Email là Gmail và tên bắt đầu bằng chữ m
SELECT * FROM users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE 'm%';

-- 8. Email là Gmail, tên có chữ i và chiều dài tên > 5
SELECT * FROM users 
WHERE user_email LIKE '%@gmail.com' 
  AND user_name LIKE '%i%' 
  AND LENGTH(user_name) > 5;

-- 9. Tên có chữ a, dài 5-9, dùng Gmail, tên email có chữ i
SELECT * FROM users 
WHERE user_name LIKE '%a%' 
  AND LENGTH(user_name) BETWEEN 5 AND 9 
  AND user_email LIKE '%i%@gmail.com';

-- 10. Điều kiện phức hợp (Sử dụng OR và ngoặc đơn để tách nhóm điều kiện)
SELECT * FROM users 
WHERE (user_name LIKE '%a%' AND LENGTH(user_name) BETWEEN 5 AND 9)
   OR (user_name LIKE '%i%' AND LENGTH(user_name) < 9)
   OR (user_email LIKE '%i%@gmail.com');
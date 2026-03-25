-- 1. Liệt kê hóa đơn: mã user, tên user, mã hóa đơn
SELECT u.user_id, u.user_name, o.order_id 
FROM users u 
INNER JOIN orders o ON u.user_id = o.user_id;

-- 2. Liệt kê số lượng hóa đơn của mỗi khách hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
FROM users u 
LEFT JOIN orders o ON u.user_id = o.user_id 
GROUP BY u.user_id;

-- 3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm trong đơn đó
SELECT order_id, COUNT(product_id) AS so_san_pham
FROM order_details 
GROUP BY order_id;

-- 4. Liệt kê thông tin mua hàng (Nối 4 bảng)
SELECT u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
ORDER BY o.order_id;

-- 5. 7 người dùng có số lượng đơn hàng nhiều nhất
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_luong_don
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id
ORDER BY so_luong_don DESC
LIMIT 7;

-- 7. Liệt kê danh sách mua hàng kèm tổng tiền mỗi đơn
SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY o.order_id;

-- 10. Đơn hàng có số sản phẩm nhiều nhất của mỗi user
SELECT u.user_id, u.user_name, o.order_id, COUNT(od.product_id) AS so_sp
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY so_sp DESC;
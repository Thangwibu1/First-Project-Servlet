-- ========= TẠO DATABASE (TÙY CHỌN) =========
-- Nếu bạn chưa có database, hãy chạy lệnh này trước.
-- Nếu đã có rồi thì có thể bỏ qua.

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'MyWebAppDB')
BEGIN
    CREATE DATABASE MyWebAppDB;
END;
GO

-- Sử dụng database vừa tạo
USE MyWebAppDB;
GO



-- ========= TẠO BẢNG PRODUCTS =========
-- Kiểm tra xem bảng Products đã tồn tại chưa, nếu có thì xóa đi để tạo lại
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
DROP TABLE dbo.Products;
GO

-- Tạo bảng mới
CREATE TABLE Products (
                          ProductID INT IDENTITY(1,1) PRIMARY KEY, -- ID tự động tăng, là khóa chính
                          ProductName NVARCHAR(255) NOT NULL,      -- Tên sản phẩm, dùng NVARCHAR để hỗ trợ Unicode (tiếng Việt)
                          Price DECIMAL(18, 2) NOT NULL,           -- Giá sản phẩm, có 2 chữ số sau dấu phẩy
                          Description NVARCHAR(1000) NULL          -- Mô tả sản phẩm, có thể để trống (NULL)
);
GO


-- ========= CHÈN 10 SẢN PHẨM MẪU =========
INSERT INTO Products (ProductName, Price, Description)
VALUES
('Laptop Dell XPS 15', 45500000.00, 'Laptop cao cấp cho lập trình viên và nhà thiết kế.'),
('Bàn phím cơ Filco Majestouch 2', 3250000.00, 'Bàn phím cơ Nhật Bản, sử dụng Cherry MX Brown switch.'),
('Màn hình LG UltraGear 27 inch', 8990000.00, 'Màn hình chuyên game, tần số quét 144Hz, 1ms.'),
('Chuột Logitech MX Master 3S', 2350000.00, 'Chuột không dây công thái học cho công việc.'),
('Ổ cứng SSD Samsung 980 Pro 1TB', 3800000.00, 'Ổ cứng NVMe PCIe 4.0 tốc độ cao.'),
('Tai nghe Sony WH-1000XM5', 7490000.00, 'Tai nghe chống ồn chủ động hàng đầu thị trường.'),
('Webcam Logitech C922 Pro', 2100000.00, 'Webcam HD streaming chuyên nghiệp.'),
('Ghế công thái học Epione ErgoChair Pro', 5500000.00, 'Ghế làm việc hỗ trợ cột sống, lưới thoáng mát.'),
('Sách "Clean Code" - Robert C. Martin', 450000.00, 'Sách gối đầu giường cho mọi lập trình viên.'),
('Ly giữ nhiệt Yeti Rambler 20 oz', 850000.00, 'Ly giữ nóng và lạnh chất liệu thép không gỉ.');
GO


-- ========= KIỂM TRA DỮ LIỆU ĐÃ CHÈN =========
SELECT * FROM Products;
GO
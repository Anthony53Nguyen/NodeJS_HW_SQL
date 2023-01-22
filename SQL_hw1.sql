USE db_node28;

CREATE TABLE FoodType(
TypeId int PRIMARY KEY AUTO_INCREMENT, 
TypeName varchar(20)
);
INSERT INTO FoodType VALUES
(1, 'Thức uống'),
(2, 'Thức ăn nhanh'),
(3, 'Món nước'),
(4, 'Ăn vặt'),
(5, 'Chay');

CREATE TABLE Food(
FoodId int PRIMARY KEY AUTO_INCREMENT, 
FoodName varchar(20), 
Image varchar(150),
Price float, 
`Desc` varchar(100), 
TypeId int,
FOREIGN KEY (TypeID) REFERENCES FoodType(TypeId)
);
INSERT INTO Food VALUES
(1, 'Coke', 'https://medicare.vn/wp-content/uploads/2021/01/0063149.jpg', 5, 'coca cola', 1),
(2, 'Heniken', 'https://minhcaumart.vn/media/com_eshop/products/8934822212339.jpg', 10, 'đây là bia', 1),
(3, 'Burger', 'https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/r/crunchy_whp-min_1.jpg', 7, 'đây là đồ ăn chay', 2),
(4, 'Hủ tiếu', 'https://daubepgiadinh.vn/wp-content/uploads/2018/05/hinh-hu-tiu-nam-vang.jpg', 30, 'hủ tiếu gõ', 3),
(5, 'Bún bò', 'https://i.ytimg.com/vi/A_o2qfaTgKs/maxresdefault.jpg', 50, 'bún bòa', 3),
(6, 'Khoai tây chiên', 'http://icdn.dantri.com.vn/zoom/1200_630/2017/khoai-tay-chien-1497363342895.jpg', 100, 'potato', 2),
(7, 'Sandwich', 'https://monngonmoingay.com/wp-content/uploads/2020/12/sandwich-kep-cha-tom-500.jpg', 2, 'san quýt', 2),
(8, 'Đồ chay', 'https://cdn.tgdd.vn/Files/2022/03/21/1421421/tong-hop-16-cach-lam-mon-chay-thanh-dam-dinh-duong-tai-nha-202203211050443101.jpg', 1, 'đây là đồ ăn chay', 5),
(9, 'Bánh tráng', 'https://res.klook.com/image/upload/q_85/c_fill,w_750/v1596008298/blog/eibedalo0wncojkerkpg.jpg', 33, 'bánh cháng', 4),
(10, 'xúc xích', 'https://www.tvpfood.com/image/cache/catalog/product/san-pham-xien-que-tiec/xuc-xich-berlin-03-1024x1024.png', 22, 'sút sít', 4);

CREATE TABLE `User` (
UserId int PRIMARY KEY AUTO_INCREMENT, 
FullName varchar(50), 
Email varchar(50),
`Password` varchar(20)
);
INSERT INTO `User` VALUES
(1, 'Tony', 'tony@gmail.com', '1234'),
(2, 'John wick', 'john@gmail.com', '1234'),
(3, 'Peter', 'pi@gmail.com', '1234'),
(4, 'Kang', 'kang@gmail.com', '1234');
 ALTER TABLE `User` RENAME TO Users;
 
CREATE TABLE Restaurant (
ResId int PRIMARY KEY AUTO_INCREMENT, 
ResName varchar(50), 
Image varchar(150),
`Desc` varchar(100)
);
INSERT INTO Restaurant  VALUES
(1, 'Phúc Long', 'https://static.mservice.io/placebrand/s/momo-upload-api-200218150929-637176353692616410.jpg', 'pl'),
(2, 'KFC', 'https://cdn.nhanlucnganhluat.vn/uploads/images/cd8af2ea/720-400/2018-11/KFC-diamond-74-1369717453.jpg', 'kfc'),
(3, 'Kichi kichi', 'https://aeonmall-haiphong-lechan.com.vn/wp-content/uploads/2020/09/25.-kichi-kichi.jpg', 'kckc');

CREATE TABLE LikeRes (
UserId int, 
ResId int,
DateLike datetime,
FOREIGN KEY (UserId) REFERENCES `User`(UserId),
FOREIGN KEY (ResId) REFERENCES Restaurant(ResId)
);
INSERT INTO LikeRes VALUES
(1, 1, '2022-01-01 09:00:00'),
(1, 2, '2022-01-01 09:00:00'),
(1, 3, '2022-01-01 09:00:00'),
(2, 2, '2022-01-01 09:00:00'),
(2, 3, '2022-01-01 09:00:00'),
(3, 1, '2022-01-01 09:00:00');

CREATE TABLE RateRes (
UserId int, 
ResId int,
Amount int,
DateRate datetime,
FOREIGN KEY (UserId) REFERENCES `User`(UserId),
FOREIGN KEY (ResId) REFERENCES Restaurant(ResId)
);
INSERT INTO RateRes VALUES
(1, 2, 4, '2022-01-01 09:00:00'),
(1, 3, 5, '2022-01-01 09:00:00'),
(2, 1, 3, '2022-01-01 09:00:00'),
(2, 3, 3, '2022-01-01 09:00:00');

CREATE TABLE `Order` (
UserId int, 
FoodId int,
Amount int,
`Code` varchar(10),
ArrSubId varchar(20),
FOREIGN KEY (UserId) REFERENCES `User`(UserId),
FOREIGN KEY (FoodId) REFERENCES Food(FoodId)
);
INSERT INTO `Order` VALUES
(1, 1, 3, '', '[1,2]'),
(1, 2, 2, '', '[4,5]'),
(3, 1, 1, '', ''),
(3, 4, 1, '', ''),
(3, 5, 5, '', ''),
(3, 8, 10, '', ''),
(3, 9, 10, '', '[1,2,3]'),
(3, 10, 10, '', '');
 ALTER TABLE `Order` RENAME TO Orders;
 
CREATE TABLE SubFood (
SubId int PRIMARY KEY AUTO_INCREMENT, 
SubName varchar(20), 
SubPrice float,
FoodId int,
FOREIGN KEY (FoodId) REFERENCES Food(FoodId)
);
INSERT INTO SubFood VALUES
(1, 'Hành phi', 1, 4),
(2, 'Hành phi', 1, 5),
(3, 'Hành phi', 1, 8),
(4, 'Trân châu', 2, 1),
(5, 'Trân châu', 2, 2),
(6, 'tương ớt', 2, 3),
(7, 'tương ớt', 2, 10);

 
 
-- 1. Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT FullName, count(LikeRes.UserId) as NumOfLikes
FROM Users
INNER JOIN LikeRes
ON  Users.UserId = LikeRes.UserId
GROUP BY LikeRes.UserId
ORDER BY NumOfLikes DESC
LIMIT 5;
-- We have only 4 users in db, and 3 like 

-- 2. Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT ResName, count(LikeRes.ResId) as NumOfLikes
FROM Restaurant
INNER JOIN LikeRes
ON  Restaurant.ResId = LikeRes.ResId
GROUP BY LikeRes.ResId
ORDER BY NumOfLikes DESC;
-- All three restaurants have the same number of likes

-- 3. Tìm người đã đặt hàng nhiều nhất.
SELECT FullName, sum(Orders.Amount) as TotalOrder
FROM Users
INNER JOIN Orders
ON  Users.UserId = Orders.UserId
GROUP BY Orders.UserId
ORDER BY TotalOrder DESC
LIMIT 1;
-- Peter has 37 orders

-- 4. Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT FullName FROM Users WHERE UserId NOT IN 
    ( SELECT UserId FROM Orders WHERE UserId IS NOT NULL) 
AND UserId NOT IN
    ( SELECT UserId FROM LikeRes WHERE UserId IS NOT NULL) 
AND UserId NOT IN
    ( SELECT UserId FROM RateRes WHERE UserId IS NOT NULL) ;
-- Kang has no activity

-- 5. Tính trung bình sub_food của một food
SELECT FoodName, avg(SubPrice) as AVG_SubFood
FROM Food
LEFT JOIN SubFood
ON  Food.FoodId = SubFood.FoodId
GROUP BY  FoodName;



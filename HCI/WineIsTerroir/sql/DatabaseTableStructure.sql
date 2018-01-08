
CREATE TABLE reservations (
	resID int(2) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name text NOT NULL, 
	email varchar(50) NOT NULL,
	phoneNumber varchar(15) NOT NULL,
	reservation_date varchar(10) NOT NULL,
	reservation_time varchar(5) NOT NULL,
	guest_count int(2) NOT NULL,
	event_type text NOT NULL
);

CREATE TABLE comments_and_mailing_list (
	commentID int(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Name text NOT NULL, 
	Email varchar(50) NOT NULL, 
	PhoneNumber varchar(15) NOT NULL, 
	Comment text NOT NULL, 
	Mailing_List boolean NOT NULL
);

CREATE TABLE orders (
	orderID int(2) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	customerName text NOT NULL, 
	custEmail varchar(50) NOT NULL, 
	custPhoneNumber varchar(15) NOT NULL, 
	dateOfPurchase varchar(15) NOT NULL, 
	orderItemName text NOT NULL, 
	orderItemQuantity int(1) NOT NULL,
	orderItemCost int(3) NOT NULL
);

CREATE TABLE meals (
	Code varchar(10) PRIMARY KEY NOT NULL,
	meal_type text NOT NULL,
	Name text NOT NULL,
	Cost double(2,2) NOT NULL,
	Image_Url varchar(30) NOT NULL
);

CREATE TABLE menus (
	menuID int(10) NOT NULL,
	menuType text NOT NULL,
	foodOneName text NOT NULL,
	foodOneImage varchar(50) DEFAULT NULL,
	foodOneText text,
	foodTwoName text NOT NULL,
	foodTwoImage varchar(50) DEFAULT NULL,
	foodTwoText text,
	foodThreeName text NOT NULL,
	foodThreeImage varchar(50) DEFAULT NULL,
	foodThreeText text,
	foodFourName text,
	foodFourImage text,
	foodFourText text
)
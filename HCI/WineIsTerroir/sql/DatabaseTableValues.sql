INSERT INTO `meals`(`Code`, `meal_type`, `Name`, `Cost`, `Image_Url`) 
	VALUES 
		('SPEC0001','Specials','Beet Gazpacho','12.00','img/food11.jpg'),
		('SPEC0002','Specials','Funnel and Rhubarb Salad','8.00','img/food12.jpg'),
		('SPEC0003','Specials','Beets and Burrata','9.00','img/food13.jpg'),
		('SPEC0004','Specials','Charred Greens','8.00','img/food14.jpg'),

		('SNA0001','Snacks','Pickles','6.00','img/food22.jpg'),
		('SNA0002','Snacks','BBQ Chips','4.00','img/food21.jpg'),
		('SNA0003','Snacks','Smokey Almonds','6.00','img/food23.jpg'),
		('SNA0004','Snacks','Deviled Eggs','4.00','img/food24.jpg'),

		('OYS0001','Oysters','Fin De La Bai','2.75','img/food31.jpg'),
		('OYS0002','Oysters','Barnstable','2.75','img/food32jpg'),
		('OYS0003','Oysters','Snow Island','2.75','img/food33.jpg'),
		('OYS0004','Oysters','Barcat','2.75','img/food34.jpg'),

		('CHE0001','Cheese','Chevrot','7.00','img/food41.jpg'),
		('CHE0002','Cheese','Rollright','10.00','img/food42.jpg'),
		('CHE0003','Cheese','Toma Piemontese','5.00','img/food43.jpg'),
		('CHE0004','Cheese','Point Reyes (Original Blue)','5.00','img/food44.jpg'),

		('CHAR0001','Charcuterie','Cacciatore','7.00','img/food51.jpg'),
		('CHAR0002','Charcuterie','Saucisson','7.00','img/food52.jpg'),
		('CHAR0003','Charcuterie','Bresaola','7.00','img/food53.jpg'),
		('CHAR0004','Charcuterie','Rosette de Lyon','5.00','img/food54.jpg'),

		('SWE0001','Sweets','Chocolate Custard','4.00','img/food61.jpg'),
		('SWE0002','Sweets','Vanilla Creme Brulee','4.00','img/food62.jpg'),
		('SWE0003','Sweets','Caramel Apple Bread Pudding','4.00','img/food63.jpg'),
		('SWE0004','Sweets','Chocolate Bread Pudding','4.00','img/food64.jpg'),

		('DRI0001','Drinks','Wine','10.00','img/food71.jpg'),
		('DRI0002','Drinks','Vermouth','8.50','img/food72.jpg'),
		('DRI0003','Drinks','Beer','8.00','img/food73.jpg'),
		('DRI0004','Drinks','Montilla','9.50','img/food74.jpg');

INSERT INTO `menus` (`menuID`, `menuType`, `foodOneName`, `foodOneImage`, `foodOneText`, `foodTwoName`, `foodTwoImage`, `foodTwoText`, `foodThreeName`, `foodThreeImage`, `foodThreeText`, `foodFourName`, `foodFourImage`, `foodFourText`) 
	VALUES
		(1, 'specials', 'Beet Gazpacho', 'food11.jpg', 'Yuzu Crab and Curried Egg @ $12.00', 'Fennel and Rhubarb Salad', 'food12.jpg', 'Celery, Cashew Brittle, Candied Vinegar Vinaigrette @ $8.00', 'Beets and Burrata', 'food13.jpg', 'Banyuls Vinaigrette @ $9.00', 'Charred Greens ', 'food14.jpg', 'Tofu emulsion, Radish @ $8.00'),
		(2, 'snacks', 'BBQ Chips', 'food21.jpg', 'For only $4.00', 'Pickles', 'food22.jpg', 'For only $6.00', 'Smokey Almonds', 'food23.jpg', 'For only $6.00', 'Deviled eggs', 'food24.jpg', 'For only $4.00'),
		(3, 'oysters', 'Fin De La Bai', 'food31.jpg', 'For only $2.75', 'Barnstable', 'food32.jpg', 'For only $2.75', 'Snow Island', 'food33.jpg', 'For only $2.75', 'Barcat', 'food34.jpg', 'For only $2.75'),
		(4, 'cheese', 'Chevrot', 'food41.jpg', 'Pasteurized Goat-France @ $7.00', 'Rollright', 'food42.jpg', 'Pasteurized Cow-England @ $10.00', 'Toma Piemontese', 'food43.jpg', 'Pasteurized Cow-Italy @ $5.00', 'Point Reyes "Original Blue"', 'food44.jpg', 'Raw Cow-California @ $5.00'),
		(5, 'Charcuterie', 'Cacciatore', 'food51.jpg', 'Olympic Provisions-Portland @ $7.00', 'Saucisson', 'food52.jpg', 'Olympic Provisions-Portland @ $7.00', 'Bresaola', 'food53.jpg', 'Salumeria Biellese @ $7.00', 'Rosette de Lyon', 'food54.jpg', 'Salumeria Biellese @ $5.00'),
		(6, 'sweets', 'Chocolate custard', 'food61.jpg', 'For only $4.00', 'Vanilla Creme Brulee', 'food62.jpg', 'For only $4.00', 'Caramel Apple Bread Pudding', 'food63.jpg', 'For only $4.00', 'Chocolate Bread Pudding', 'food64.jpg', 'For Only $4.00'),
		(7, 'drinks', 'Wine', 'food71.jpg', 'These aromatized wines cure all evils', 'Vermouth', 'food72.jpg', 'Because apple cider is as American as apple pie', 'Beer', 'food73.jpg', 'It''s beer, just drink it', 'Montilla', 'food74.jpg', 'Spain has given us Gaudi / Don Quixote / Xavi and….');
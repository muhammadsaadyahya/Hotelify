Create database hotel
use hotel
GO
create table [User]([user_id] int IDENTITY(1, 1) primary key ,username varchar(20)  Unique not null, [password] varchar(20) not null,email varchar(30) Unique not null,user_type char(5) not null,
first_name varchar(10) not null,last_name varchar(10) not null,phone_number char(9),[address] varchar(30));
GO
create table Hotel(hotel_id int IDENTITY(1, 1) primary key ,hotel_name varchar(20),
owner_id int foreign key references [User]([user_id]) on delete cascade on update cascade,[description] varchar(100),[location] varchar(30),rating char,premium_listing bit);
GO
create table Room(room_id int IDENTITY(1, 1) Primary Key,hotel_id int  foreign key references Hotel(hotel_id) on delete cascade on update cascade,room_no int,room_type varchar(10),
[availability] varchar(10),price decimal(10,2),amenities varchar(20));

create table Booking(booking_id int IDENTITY(1, 1) Primary Key  ,guest_id int foreign key references [User]([user_id]) on delete cascade on update cascade, 
room_id int foreign key references Room(room_id),check_in_date date, check_out_date date,total_price int,[status] varchar(20));

create table Review(review_id int IDENTITY(1, 1) Primary Key ,
guest_id int foreign key references [User]([user_id]) ,
hotel_id int foreign key references Hotel(hotel_id) ,
rating int,
comment varchar(20),
date_posted date);

create table [Event]( event_id int IDENTITY(1, 1) Primary Key,guest_id int foreign key references [User]([user_id]),hotel_id int foreign key references Hotel(hotel_id)
,event_type varchar(10),[date] date,attendees int, price int);

Select * from Room

INSERT INTO Room (hotel_id, room_no, room_type, [availability], price, amenities)
VALUES
    (1, 101, 'Single', 'Available', 100.00, 'T1'),
    (1, 102, 'Double', 'Available', 150.00, 'T2'),
    (1, 103, 'Suite', 'Available', 200.00, 'T3');

Select * from [User]



create table [Transaction](transaction_id int IDENTITY(1, 1) Primary Key ,
booking_id int Foreign Key references Booking(booking_id) on delete cascade on update cascade,payment_amount int ,payment_date date,payment_method varchar(10),transaction_status varchar(10),transaction_details varchar(20));



--Functionalities:
--Sign Up (Guest/Hotel Owner/Admin): Users can create accounts as guests or hotel owners. Employee can also create account on the platform.

GO
CREATE PROCEDURE SignUpUser
    @username varchar(20),
    @password varchar(20),
    @email varchar(30),
    @user_type char(5),
    @first_name varchar(10),
    @last_name varchar(10),
    @phone_number char(9),
    @address varchar(30)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the username or email already exists
    IF EXISTS (SELECT 1 FROM [User] WHERE username = @username OR email = @email)
    BEGIN
        PRINT 'Username or email already exists. Please choose a different one.';
        RETURN;
    END

    -- Insert the new user into the [User] table
    INSERT INTO [User] (username, [password], email, user_type, first_name, last_name, phone_number, [address])
    VALUES (@username, @password, @email, @user_type, @first_name, @last_name, @phone_number, @address);

    PRINT 'User signed up successfully.';
END;
GO

EXEC SignUpUser 
    @username = 'L226800',
    @password = 'haseeb2838',
    @email = 'l226800@lhr.nu.edu.pk',
    @user_type = 'Guest', -- or 'Hotel' depending on the user type
    @first_name = 'Haseeb',
    @last_name = 'Zahid',
    @phone_number = '123456789',
    @address = 'Samnabad';

---------------------------FUNCTIONALITY 2------------------------------------
--Login(Guest/Hotel Owner/Admin):: Users can login accounts as guests or hotel owners. 
--Employee can also login account on the platform. Users have different view for admin and customers.
GO


CREATE PROCEDURE LoginUser
    @username varchar(20),
    @password varchar(20),
	@flag int Output
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @user_id int;

    -- Check if the provided username and password match
    SELECT @user_id = user_id
    FROM [User]
    WHERE username = @username AND [password] = @password;

    -- If user_id is NULL, login failed
    IF @user_id IS NULL
    BEGIN
        PRINT 'Invalid username or password. Please try again.';
        Set @flag=0;
		Return;
    END
	Else
	 Set @flag=1;
	 return;

    -- Retrieve user information based on user_id
    SELECT *
    FROM [User]
    WHERE user_id = @user_id;

    PRINT 'Login successful.';
END;
GO

declare @flag1 int;
EXEC LoginUser 
    @username = 'Talha',
    @password = 'GGGG',@flag=@flag1;

	Select * from [User]


	Select * from Hotel


--Profile Management: Both guests and hotel owners can edit their profiles, update information, and manage bookings
GO

CREATE PROCEDURE GetBookingByUser
    @Username VARCHAR(50)
AS
BEGIN
    DECLARE @userid INT;

    -- Get the user ID based on the username
    SELECT @userid = user_id FROM [User] WHERE username = @Username;

    -- Retrieve booking details for the user
    SELECT b.booking_id, b.guest_id, b.room_id, b.check_in_date, b.check_out_date, b.total_price, b.[status]
    FROM Booking b
    INNER JOIN [User] u ON b.guest_id = u.user_id
    INNER JOIN Room r ON b.room_id = r.room_id
    WHERE u.username = @Username;
END

Exec GetBookingByUser @Username = 'Talha'






CREATE PROC UPDATE_USER_PROFILE
	-- RECEIVES THE USERID AND THE REST OF THE INFO TO BE UPDATED
	
    @username varchar(20),
    @password varchar(20),
    @email varchar(30),
   
    @first_name varchar(10),
    @last_name varchar(10),
    @phone_number char(9),
    @address varchar(30)
AS
BEGIN
    SET NOCOUNT ON;
	--DECLARE @FLAG INT;
	
	 IF (EXISTS(SELECT 1 FROM [USER] WHERE ([USER].email =  @email and [User].[user_id]!=(Select [user_id] from [User] where @username=username))))
	BEGIN
		PRINT'USERNAME OR EMAIL ALREADY EXISTS CANNOT UPDATE TRY AGAIN LATER'
	END
	ELSE
	BEGIN 
		UPDATE [User]
		SET 
        [password] = @password,
        email = @email,
        first_name = @first_name,
        last_name = @last_name,
        phone_number = @phone_number,
        [address] = @address
    WHERE username = @username;


	Select* from [User]

    PRINT 'Profile updated successfully.';
	END
END

EXEC UPDATE_USER_PROFILE
    @USERID = 1, -- Replace 1 with the actual user ID
    @username = 'L22-6800',
    @password = 'haseeb2838',
    @email = 'haseebo@example.com',
    @user_type = 'Guest', -- or 'Hotel' depending on the user type
    @first_name = 'New First Name',
    @last_name = 'New Last Name',
    @phone_number = '987654321',
    @address = '456 New Address St';


-- Retrieve user profile information
go
CREATE PROCEDURE GetUserProfile
    @user_id int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [User]
    WHERE user_id = @user_id;
END;
GO
EXEC GetUserProfile @user_id = 1; -- Replace 1 with the actual user ID you want to retrieve the profile for
go

drop procedure ViewBookingDetails
-- Manage bookings: View booking details
CREATE PROCEDURE ViewBookingDetails
	@username varchar(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- Retrieve detailed information about the specified booking
	Declare @gust int;
	Select @gust = [user_id] from [User] where username=@username;
    SELECT *
    FROM Booking join Room on Room.room_id=Booking.room_id join Hotel on Hotel.hotel_id = room.room_id
    WHERE  Booking.guest_id=@gust;

END;
GO
use hotel
-- Manage bookings (example: cancel booking)
Drop Procedure CancelBooking

Select * from Booking

CREATE PROCEDURE CancelBooking
    @booking_id int
AS
BEGIN
    SET NOCOUNT ON;
	Declare @room_id int
	Select @room_id =room_id from Booking 	WHERE booking_id = @booking_id;
    Delete From Booking 
	WHERE booking_id = @booking_id;
	Update Room Set [availability]= 'Available' where room_id=@room_id;
	
	


    PRINT 'Booking cancelled successfully.';
END;
GO
-- Manage bookings: View bookings
CREATE PROCEDURE ViewBookings
    @user_id int
AS
BEGIN
    SET NOCOUNT ON;

    -- Retrieve bookings for the specified user
    SELECT Booking.booking_id,
           Room.room_no,
           Booking.check_in_date,
           Booking.check_out_date,
           Booking.total_price,
           Booking.status
    FROM Booking
    INNER JOIN Room ON Booking.room_id = Room.room_id
    WHERE Booking.guest_id = @user_id;

END;
GO

EXEC ViewBookings @user_id = 1; -- Replace 1 with the actual user ID to view bookings for



--4



--Booking System: Guests can browse through a wide range of hotels branches, view availability, and make reservations according to their preferences.

-- 1. Browse Hotels
go
CREATE PROCEDURE BrowseHotels
AS
BEGIN
    SET NOCOUNT ON;

    -- Retrieve hotel information
    SELECT hotel_id, hotel_name, location, description, rating
    FROM Hotel;

END;
GO

-- 2. View Availability
CREATE PROCEDURE CheckRoomAvailability
    @hotel_id int,
    @check_in_date date,
    @check_out_date date
AS
BEGIN
    SET NOCOUNT ON;

    -- Retrieve available rooms for the specified hotel and date range
    SELECT Room.room_id, Room.room_no, Room.room_type, Room.price
    FROM Room
    LEFT JOIN Booking ON Room.room_id = Booking.room_id
    WHERE Room.hotel_id = @hotel_id
    AND (Booking.check_out_date <= @check_in_date OR Booking.check_in_date >= @check_out_date);

END;
GO
Drop Procedure MakeReservation

-- 3. Make Reservations
CREATE PROCEDURE MakeReservation
    @username varchar(20),
    @room_id int,
    @check_in_date date,
    @check_out_date date
AS
BEGIN
    SET NOCOUNT ON;
	Declare @total_price int;
	Declare @guest_id int;
	Select @guest_id = [user_id] from [User] where username = @username; 
    Select @total_price=price from Room where room_id=@room_id;
	Set @total_price=@total_price*(DATEDIFF(day,@check_in_date,@check_out_date));
    -- Insert a new booking record
    INSERT INTO Booking (guest_id, room_id, check_in_date, check_out_date, total_price, [status])
    VALUES (@guest_id, @room_id, @check_in_date, @check_out_date, @total_price, 'Confirmed');
	Update Room Set [availability]= 'Not' where room_id=@room_id;
	PRINT 'Total Price is'+ CAST(@total_price AS varchar(100));
	

    Select * from [User]
END;
GO


Select * from Booking
EXEC BrowseHotels;

-- Replace @hotel_id, @check_in_date, and @check_out_date with appropriate values
EXEC CheckRoomAvailability @hotel_id = 1, @check_in_date = '2024-05-01', @check_out_date = '2024-05-05';

-- Replace @guest_id, @room_id, @check_in_date, @check_out_date, and @total_price with appropriate values
EXEC MakeReservation @username = 'Talha', @room_id = 1, @check_in_date = '2024-05-01', @check_out_date = '2024-05-05';
Select * from Booking
Delete  from Booking
Update Room Set [availability]='Available' 




CREATE PROCEDURE AddReview
    @guest_id INT,
    @hotel_id INT,
    @rating INT,
    @comment VARCHAR(20),
    @date_posted DATE
AS
BEGIN
    -- Check if the guest_id exists in the User table
    IF NOT EXISTS (SELECT 1 FROM [User] WHERE [user_id] = @guest_id)
    BEGIN
        PRINT 'Invalid guest_id. The user does not exist.'
        RETURN;
    END;

    -- Check if the hotel_id exists in the Hotel table
    IF NOT EXISTS (SELECT 1 FROM Hotel WHERE hotel_id = @hotel_id)
    BEGIN
        PRINT 'Invalid hotel_id. The hotel does not exist.'
        RETURN;
    END;

    -- Insert the new review
    INSERT INTO Review (guest_id, hotel_id, rating, comment, date_posted)
    VALUES (@guest_id, @hotel_id, @rating, @comment, @date_posted);

    Print 'Review Added Successfully'

END;

EXEC AddReview @guest_id = 1, @hotel_id = 1, @rating = 4, @comment = 'Great stay!', @date_posted = '2024-04-21';

---Functionality 7---
CREATE PROCEDURE OptForPremiumListing
    @hotel_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Hotel WHERE hotel_id = @hotel_id)
    BEGIN
        PRINT 'Invalid hotel_id. The hotel does not exist.'
        RETURN;
    END;

    -- Update the premium_listing column for the specified hotel to 1 (indicating a premium listing)
    UPDATE Hotel
    SET premium_listing = 1
    WHERE hotel_id = @hotel_id;
    PRINT 'Hotel has successfully opted for a premium listing.';
END;

EXEC OptForPremiumListing @hotel_id = 1;

---Functionality 8---
CREATE PROCEDURE ProcessPayment
    @booking_id INT
AS
BEGIN
    -- Check if the booking exists
    IF NOT EXISTS (SELECT 1 FROM Booking WHERE booking_id = @booking_id)
    BEGIN
        PRINT 'Error: Invalid booking_id. Booking does not exist.'
        RETURN;
    END;

    -- Update the status of the booking to "Paid"
    UPDATE Booking
    SET [status] = 'Paid'
    WHERE booking_id = @booking_id;

    PRINT 'Payment processed successfully. Booking is now paid.';
END;


---Functionality 9----
CREATE PROCEDURE AdjustRoomRates
    @hotel_id INT,
    @room_type VARCHAR(10),
    @new_price DECIMAL(10, 2)
AS
BEGIN
    -- Check if the hotel exists
    IF NOT EXISTS (SELECT 1 FROM Hotel WHERE hotel_id = @hotel_id)
    BEGIN
        PRINT 'Error: Invalid hotel_id. Hotel does not exist.'
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM Room WHERE hotel_id = @hotel_id AND room_type = @room_type)
    BEGIN
        PRINT 'Error: Invalid room_type for the specified hotel.'
        RETURN;
    END;

    -- Update the price 
    UPDATE Room
    SET price = @new_price
    WHERE hotel_id = @hotel_id AND room_type = @room_type;

    PRINT 'Room rates adjusted successfully.';
END;
EXEC AdjustRoomRates @hotel_id = 1, @room_type = 'Standard', @new_price = 150.00;

---Functionality 10---

CREATE PROCEDURE GetHotelAnalytics
    @hotel_id INT
AS
BEGIN
    -- Total number of bookings
    DECLARE @total_bookings INT;
    SELECT @total_bookings = COUNT(*) 
    FROM Booking 
    WHERE room_id IN (SELECT room_id FROM Room WHERE hotel_id = @hotel_id);

    -- Total revenue 
    DECLARE @total_revenue DECIMAL(10, 2);
    SELECT @total_revenue = SUM(total_price) 
    FROM Booking 
    WHERE room_id IN (SELECT room_id FROM Room WHERE hotel_id = @hotel_id) 
    AND [status] = 'Paid';

    -- Average revenue
    DECLARE @avg_revenue_per_booking DECIMAL(10, 2);
    IF @total_bookings > 0
        SET @avg_revenue_per_booking = @total_revenue / @total_bookings;
    ELSE
        SET @avg_revenue_per_booking = 0;

   
    PRINT 'Hotel Analytics Report:';
    PRINT '------------------------';
    PRINT 'Total Bookings: ' + CONVERT(VARCHAR(10), @total_bookings);
    PRINT 'Total Revenue: $' + CONVERT(VARCHAR(10), @total_revenue);
    PRINT 'Average Revenue per Booking: $' + CONVERT(VARCHAR(10), @avg_revenue_per_booking);
END;
EXEC GetHotelAnalytics @hotel_id = 1;


--14
Create Procedure BookEvent
@user  varchar(20),
@pass  varchar(20),
@h_id   int,
@ev_type varchar(20),
@date date,
@attendees int,
@pr int


As
Begin
Declare @uid int;
Select @uid=USER_ID from [User] where @user=username and @pass=[password];
insert into [Event](guest_id,hotel_id,event_type,[date],attendees,price
) values(@uid,@h_id,@ev_type,@date,@attendees,@attendees*@pr);
End


Create Procedure CancelEvent
@Ev_id int
As
Begin
Delete From [Event] where event_id=@Ev_id;
End

Create Procedure ShowBookedEvents
@user_id int
AS
Begin
Select * from [Event] where [Event].guest_id=@user_id
End
--13


Create Procedure SearchHotelAll
@loc varchar(20),
@max int,
@min int,
@roomt varchar(20),
@A   varchar(20)
As
Begin
Select Hotel.* from Hotel join Room on Room.hotel_id = Hotel.hotel_id where Room.amenities= @A and price<=@max and price >= @min and Hotel.[location]=@loc and Room.room_type=@roomt;
End

Create Procedure SearchHotelLoc
@loc varchar(20),
@max int,
@min int
As
Begin
Select Hotel.* from Hotel join Room on Room.hotel_id = Hotel.hotel_id where  price<=@max and price >= @min and Hotel.[location]=@loc;
End

Create Procedure SearchHotelAandt

@max int,
@min int,
@roomt varchar(20),
@A   varchar(20)
As
Begin
Select Hotel.* from Hotel join Room on Room.hotel_id = Hotel.hotel_id where Room.amenities= @A and price<=@max and price >= @min  and Room.room_type=@roomt;
End

Create Procedure SearchHoteltype
@loc varchar(20),
@max int,
@min int,
@roomt varchar(20)
As
Begin
Select Hotel.* from Hotel join Room on Room.hotel_id = Hotel.hotel_id where price<=@max and price >= @min and Room.room_type=@roomt;
End

CREATE TABLE GroupBookings (
  GroupBookingID INT  IDentity(1,1) PRIMARY KEY,
  UserID INT foreign key references [User]([user_id]),
  HotelID INT foreign key references Hotel(hotel_Id),
  GroupName VARCHAR(20),
  NumberOfGuests INT,
  Price DECIMAL(10,2)
);


--12
Create Procedure GRBOOK
@user varchar(20),
@h int,
@no int,

@g varchar(20)
AS
Begin

Begin
Declare @uid int
Select @uid= [user_id] from [User] where [username]=@user;
Declare @p int;
Set @p=@no*500;

insert into GroupBookings(UserID,HotelID ,GroupName ,NumberOfGuests ,Price) values(@uid,@h,@g,@no,@p);
End
End

use hotel

Select * from GroupBookings;
Exec GRBOOK @user='Talha',@h=1,@no=50,@g='College Group';
Select * from GroupBookings where [UserID]=(Select [user_id] from [user] where username=@username)


Select * from [Event]

drop procedure [EventBook]

Create Procedure EventBook
@user varchar(20),
@hid int,
@date date,
@e varchar(20),
@g int
AS
Begin

Begin
Declare @uid int
Select @uid= [user_id] from [User] where [username]=@user;
Declare @p int;
Set @p=@g*500;

insert into [Event](guest_id,hotel_id ,event_type,attendees ,[date] ,Price) values(@uid,@hid,@e,@g,@date,@p);
End
End
Delete from [Event]

Select * from GroupBookings

Select * from Event


SELECT * FROM Booking WHERE room_id=(Select * from Hotel where  [hotel_id]  =(SELECT [hotel_id] FROM Hotel where owner_id= (Select [user_id] from [User] WHERE username = 'Haseeb')))
Select * from [User]

Update Hotel Set owner_id=1 where owner_id=2

SELECT B.* FROM Booking B JOIN Room R ON B.room_id = R.room_id JOIN Hotel H ON R.hotel_id = H.hotel_id JOIN [User] U ON H.owner_id = U.user_id WHERE U.username = 'haseeb';

INSERT INTO Hotel (hotel_name, owner_id, description, location, rating, premium_listing)
VALUES ('Hotel Name', 1, 'Description of the hotel', 'Location of the hotel', 'A', 1);

Select * from Hotel where [owner_id] = any (Select [user_id] from [User] where username='Haseeb'  )

INSERT INTO Booking (guest_id, room_id, check_in_date, check_out_date, total_price, [status])
VALUES 
    (1, 2, '2024-05-01', '2024-05-05', 100, 'Confirmed'),  -- Booking for hotel 1, room 2
    (1, 1, '2024-05-10', '2024-05-15', 150, 'Confirmed'); -- Booking for hotel 1, room 1

-- Insert booking for hotel with hotel_id 2
INSERT INTO Booking (guest_id, room_id, check_in_date, check_out_date, total_price, [status])
VALUES 
    (3, 4, '2024-06-01', '2024-06-05', 120, 'Confirmed'); -- Book

	Select * from Booking
	Select * from Room

	SELECT * FROM Booking WHERE room_id= any (Select room_id from

	SELECT * FROM Booking B JOIN Room R ON B.room_id = R.room_id JOIN Hotel H ON R.hotel_id = H.hotel_id WHERE R.hotel_id IN (SELECT [hotel_id] FROM Hotel  WHERE owner_id = (SELECT [user_id] FROM [User] WHERE username = 'Haseeb'));

	SELECT * FROM Booking B JOIN Room R ON B.room_id = R.room_id JOIN Hotel H ON R.hotel_id = H.hotel_id WHERE R.hotel_id IN (SELECT [hotel_id] FROM Hotel  WHERE owner_id = (SELECT [user_id] FROM [User] WHERE username = 'Haseeb'));

	Select * from Hotel

Create Procedure AddHotelA
@user varchar(20),
@hn varchar(20),
@des varchar(200),
@loc varchar(20)
AS
Begin

Begin
Declare @oid int
Select @oid= [user_id] from [User] where [username]=@user;


insert into [Hotel](hotel_name,owner_id ,[description],[location] ,[rating] ,premium_listing) values(@hn,@oid,@des,@loc,1,0);
End
End

Select* from Room
insert into room(hotel_id,room_no,room_type,[availability],price,amenities) values(@h_id,@r_no,@r_type,'Available',@p,'Type1');


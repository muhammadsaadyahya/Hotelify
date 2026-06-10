# 🏨 Hotelify

A comprehensive hotel management and booking system built with ASP.NET Web Forms and SQL Server. Hotelify enables seamless hotel operations, booking management, and guest services.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Key Pages](#key-pages)
- [Database](#database)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

### For Guests
- **User Authentication**: Secure sign-up and login system
- **Hotel Browsing**: Browse available hotels and rooms
- **Room Booking**: Easy-to-use room reservation system
- **Event Booking**: Book hotel event spaces and conference rooms
- **Group Bookings**: Special handling for group reservations
- **Guest Profile Management**: Update personal information and preferences
- **Reviews & Ratings**: Leave and view reviews for hotels
- **Booking Management**: View, modify, and manage existing bookings

### For Hotel Owners
- **Hotel Management**: Add and manage hotel properties
- **Room Management**: Add and configure rooms with pricing
- **Booking Analytics**: View booking statistics and analytics
- **Reservation Oversight**: Monitor and manage all bookings
- **Guest Management**: View guest information and history

### General Features
- **Responsive Design**: Mobile-friendly interface with responsive master pages
- **Admin Dashboard**: Centralized management portal
- **Real-time Updates**: Live booking and room availability updates

## 🛠️ Tech Stack

- **Frontend**: ASP.NET Web Forms, HTML5, CSS, JavaScript
- **Backend**: C# (.NET Framework)
- **Database**: SQL Server
- **Architecture**: Three-tier architecture (Presentation, Business Logic, Data Access)

## 📁 Project Structure

```
Hotelify/
├── Default.aspx                    # Home page
├── Login.aspx                      # User login
├── SignUp.aspx                     # User registration
├── Guest.aspx                      # Guest dashboard
├── Owner.aspx                      # Owner dashboard
├── Book.aspx                       # Room booking page
├── ManageBooking.aspx              # Booking management
├── Bookings and Hotels.aspx        # View bookings and hotels
├── EventBooking.aspx               # Event space booking
├── GroupBooking.aspx               # Group reservation system
├── HotelAnalytics.aspx             # Analytics dashboard
├── AddHotel.aspx                   # Add new hotel
├── AddRoom.aspx                    # Add new room
├── AddReview.aspx                  # Submit reviews
├── Reviews.aspx                    # View reviews
├── ShowRoomaspx.aspx               # Room details display
├── manageprofile.aspx              # User profile management
├── Site.Master                     # Master page layout
├── Site.Mobile.Master              # Mobile master page
├── App_Start/                      # Application startup configuration
├── Content/                        # CSS and styling files
├── Scripts/                        # JavaScript files
├── Properties/                     # Project properties
├── SQL Files schema and Procedures/# Database schema and stored procedures
├── Web.config                      # Application configuration
└── packages.config                 # NuGet dependencies
```

## 🚀 Installation

### Prerequisites
- Visual Studio 2015 or higher
- .NET Framework 4.5+
- SQL Server 2012 or higher
- IIS (for deployment)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/muhammadsaadyahya/Hotelify.git
   cd Hotelify
   ```

2. **Set up the database**
   - Open SQL Server Management Studio
   - Run the SQL scripts from `SQL Files schema and Procedures For Sql Server/` directory
   - Execute schema creation and stored procedures

3. **Open in Visual Studio**
   - Open `WebApplication6.csproj` in Visual Studio
   - Restore NuGet packages: `Update-Package -Reinstall`

4. **Configure connection string**
   - Open `Web.config`
   - Update the SQL Server connection string with your database credentials

5. **Build and run**
   - Build the solution: `Ctrl + Shift + B`
   - Press `F5` to run with IIS Express

## 📖 Usage

### For Guests

1. **Sign Up**: Create a new account on the SignUp page
2. **Browse Hotels**: Navigate to the hotel listing
3. **Search Rooms**: Filter by date, location, and preferences
4. **Book Rooms**: Select rooms and complete the booking
5. **Manage Bookings**: View and modify your reservations
6. **Leave Reviews**: Share your experience after checkout

### For Hotel Owners

1. **Sign Up as Owner**: Create an owner account
2. **Add Hotel**: Register your hotel property
3. **Manage Rooms**: Add rooms, set pricing, and manage availability
4. **View Analytics**: Monitor booking trends and occupancy
5. **Manage Reservations**: Accept, modify, or cancel bookings

## 🗄️ Database

The database includes the following main tables:
- **Users**: Guest and owner accounts
- **Hotels**: Hotel property information
- **Rooms**: Room details and availability
- **Bookings**: Reservation records
- **Reviews**: Guest reviews and ratings
- **Events**: Event space details and bookings

Stored procedures handle complex operations like:
- Booking creation and validation
- Room availability checks
- Reservation modifications
- Analytics calculations

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please ensure your code follows the existing style and includes appropriate comments.

## 📝 License

This project is open source and available under the MIT License. See the LICENSE file for details.

## 📞 Support

For issues, questions, or suggestions, please:
- Open an [issue](https://github.com/muhammadsaadyahya/Hotelify/issues) on GitHub
- Contact the development team

---

**Built with ❤️ by Muhammad Saad Yahya**

*Last Updated: June 2026*

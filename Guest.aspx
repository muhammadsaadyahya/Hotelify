<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Guest.aspx.cs" Inherits="WebApplication6.WebForm3" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest Page</title>
    <style>
        body {
            background-image: url("Home.jpg");
            background-size:cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 800px;
            margin: 56px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
        }

        .left-section {
            flex: 1;
            padding-right: 50px;
            text-align: center;
        }

        .right-section {
            flex: 1;
            padding-left: 50px;
        }

        h1 {
            text-decoration: underline;
            font-style: italic;
            font-size: 40px;
            text-align: center;
            margin-bottom: 20px;
        }

        .functionality {
            margin-bottom: 20px;
        }

            .functionality h2 {
                margin-bottom: 10px;
            }

            .functionality ul {
                list-style-type: none;
                padding: 0;
            }

            .functionality li {
                margin-bottom: 10px display: block;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
                text-align: center;
                background-color: #0056b3;
            }

                .functionality li a {
                    display: block;
                    padding: 10px;
                    background-color: #007bff;
                    color: #fff;
                    text-decoration: none;
                    border-radius: 4px;
                    text-align: center;
                }

                    .functionality li a:hover {
                        background-color: #0056b3;
                    }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <h1>Guest Page</h1>
            <br>



            <h2>Guest Details</h2>
            <div>
              
                Hi
                <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
                  <br />
              
                
                <asp:Label ID="UsernameLabel" runat="server" Text=""></asp:Label>
                <br />
                Phone:
                <asp:Label ID="phoneLabel" runat="server" Text=""></asp:Label>
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text=""></asp:Label>
                 <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text=""></asp:Label>
                

            </div>

        </div>
        <div class="right-section">
            <form id="form1" runat="server">

            <div class="functionality">
                <%--<h2> profile Management</h2>--%>
                <ul>
                    <li>
                        <asp:Button ID="Button1" runat="server" Text="Manage Profile" OnClick="manage" />
                    </li>
                </ul>
            </div>


            <div class="functionality">
                <%--<h2>Managing Booking</h2>--%>
                <ul>
                    <li>
                        <asp:Button ID="Button2" runat="server" Text="Manage Bookings" OnClick="manageaps" />
                    </li>
                </ul>
            </div>

            <div class="functionality">
                <%--<h2>Search Hotels (EHR)</h2>--%>
                <ul>
                    <li>
                        <asp:Button ID="ehr" runat="server" Text="Search Hotels" OnClick="ehr_Click" />
                    </li>
                </ul>
            </div>

            

            <div class="functionality">
                <%--<h2>Your Reviews</h2>--%>
                <ul>
                    <li>
                        <asp:Button ID="Button5" runat="server" Text="Your Reviews" OnClick="Reviews" />
                    </li>
                </ul>
            </div>

           <div class="functionality">
                <%--<h2>Your Reviews</h2>--%>
                <ul>
                    <li>
                        <asp:Button ID="Button6" runat="server" Text="GroupBooking " OnClick="GroupBookings" />
                    </li>
                </ul>
            </div>
           <div class="functionality">
                <%--<h2>Your Reviews</h2>--%>
                <ul>
                    <li>
                        <asp:Button ID="Button3" runat="server" Text="EventBooking " OnClick="EventBooking" />
                    </li>
                </ul>
            </div>
            <div class="functionality">
                    <ul>
                        <li>
                            <asp:Button ID="AddReviewButton" runat="server" Text="Add Review" OnClick="AddReviewButton_Click" />
                        </li>
                    </ul>
                </div>

            <br />
            
                
            
                
                <asp:Button ID="LogoutButton" runat="server" Text="Logout" OnClick="LogoutButton_Click" />

            

        </div>
        </form>
    </div>
</body>
</html>



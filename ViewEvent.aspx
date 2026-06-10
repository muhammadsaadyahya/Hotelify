<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="WebApplication6.ViewEvent" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Group Booking Page</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .form-group {
            margin-bottom: 15px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }
    </style>
</head>
<body>
    <div class="container">
        <form runat="server">
            <div class="left-section">
                <asp:Button runat="server" Text="Home" OnClick="home"  />
                <h1>Event Booking</h1>
               <table>
                    <asp:GridView ID="EventGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="event_id" HeaderText="event ID" />
                            <asp:BoundField DataField="Hotel_id" HeaderText="Hotel id" />
                            <asp:BoundField DataField="event_type" HeaderText="Eventtype" />
                            <asp:BoundField DataField="Date" HeaderText=" Date" />
                            <asp:BoundField DataField="attendees" HeaderText=" attendees" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            
                        </Columns>
                    </asp:GridView>
                </table>




                <br />
                
                                <h1>Group Booking</h1>
               <table>
                    <asp:GridView ID="GroupBookingGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="GroupBookingid" HeaderText="Book ID" />
                            <asp:BoundField DataField="HotelID" HeaderText="Hotel id" />
                            <asp:BoundField DataField="GroupName" HeaderText="GroupName" />
                            <asp:BoundField DataField="NumberOfGuests" HeaderText=" no" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            
                        </Columns>
                    </asp:GridView>
                </table>
                <br />

                
                
            
                       
        </form>
    </div>
</body>

</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookings and Hotels.aspx.cs" Inherits="WebApplication6.ManageBookings" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Page</title>
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
                <h1>Available Hotels</h1>
                <table>

                    <asp:GridView ID="HotelGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="hotel_id" HeaderText="Hotel ID" />
                            <asp:BoundField DataField="hotel_name" HeaderText="Hotel Name" />
                            <asp:BoundField DataField="description" HeaderText="Hotel Description" />
                            <asp:BoundField DataField="hotel_name" HeaderText="Hotel Name" />
                            <asp:BoundField DataField="location" HeaderText="location" />
                            <asp:BoundField DataField="rating" HeaderText="rating" />
                          <asp:TemplateField HeaderText="Add">
                            <ItemTemplate>
                                <asp:Button ID="BookingRoom" runat="server" Text="AddRoom" CommandName="AddRum" CommandArgument='<%# Eval("hotel_id") %>' OnClick="AddRooom" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        </Columns>
                        </asp:GridView>

                        </table>
                     <h1>Booking in your Hotels</h1>

                    <asp:GridView ID="BookingGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="booking_id" HeaderText="Book ID" />
                            <asp:BoundField DataField="hotel_id" HeaderText="Hotel ID" />
                            <asp:BoundField DataField="hotel_name" HeaderText="Hotel Name" />
                            <asp:BoundField DataField="room_id" HeaderText="Room id" />
                            <asp:BoundField DataField="room_no" HeaderText="Room no" />
                            <asp:BoundField DataField="total_price" HeaderText="Price" />
                                         
                        </Columns>
                    </asp:GridView>
                </table>





                
            </div>
        </form>
    </div>
</body>

</html>

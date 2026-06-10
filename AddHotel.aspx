<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHotel.aspx.cs" Inherits="WebApplication6.AddHotel" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotelify  Login</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            background-image: url("Home.jpg");
            display: flex;
            background-size: cover;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 17px;
            border-radius: 20px;
            box-shadow: 0 7px 7px rgba(0, 0, 0, 0.1);
            width: 313px;
        }

            .login-container h1 {
                text-align: center;
                margin-bottom: 22px;
                font-size: 24px;
            }

        .form-group {
            margin-bottom: 15px;
        }

            .form-group label {
                font-weight: bold;
            }

            .form-group input {
                width: 91%;
                padding: 11px;
                border: 2px solid #ccc;
                border-radius: 3px;
            }

            .form-group button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-group button:hover {
                background-color: #0056b3;
            }

        .right-align {
            text-align: right;
            font-style: italic;
        }
    </style>

</head>
<body>
    <div class="login-container">
                    
                    
        <h1>Hotelify  AddHotel</h1>
        <form runat="server">
                <asp:Button runat="server" Text="Home" OnClick="home"  />    

            <div class="form-group">
                <asp:Label ID="HotelName" runat="server" AssociatedControlID="HotelName" Text="HotelName:"></asp:Label>
                <asp:TextBox ID="HotelNameTextBox" runat="server" placeholder="Enter Hotel Name"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="description" runat="server" AssociatedControlID="description" Text="description:"></asp:Label>
                <asp:TextBox ID="descriptionTextBox" runat="server" placeholder="Enter description"></asp:TextBox>
            </div>



            <div class="form-group">
                <asp:Label ID="Location" runat="server" AssociatedControlID="Location" Text="Location:"></asp:Label>
                <asp:TextBox ID="LocationTextBox1" runat="server" placeholder="Enter Location"></asp:TextBox>
            </div>

            <div class="form-group">
    <asp:Button type="submit" runat="server" OnClick="Confirm" Text="Confirm"></asp:Button>
            </div>
            
        </form>
    </div>
</body>
</html>




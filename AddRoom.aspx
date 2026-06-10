<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddRoom.aspx.cs" Inherits="WebApplication6.WebForm9" %>
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
                    
                    
        <h1>Hotelify  AddRoom</h1>
        <form runat="server">
                <asp:Button runat="server" Text="Home" OnClick="home"  />    

            <div class="form-group">
                <asp:Label ID="RoomNo" runat="server" AssociatedControlID="RoomNo" Text="RoomNo:"></asp:Label>
                <asp:TextBox ID="RoomNoTextBox" runat="server" placeholder="Enter Room No"></asp:TextBox>
            </div>
            
            <div class="form-group">
    <asp:Label ID="RoomT" runat="server" AssociatedControlID="RoomTypeTextBox" Text="RoomType:"></asp:Label>
    <asp:TextBox ID="RoomTypeTextBox" runat="server" placeholder="Enter Room Type"></asp:TextBox>
</div>




            <div class="form-group">
                <asp:Label ID="Price" runat="server" AssociatedControlID="Price" Text="Price:"></asp:Label>
                <asp:TextBox ID="PriceTextBox1" runat="server" placeholder="Enter Price"></asp:TextBox>
            </div>

            <div class="form-group">
    <asp:Button type="submit" runat="server" OnClick="Confirm" Text="Confirm"></asp:Button>
            </div>
            
        </form>
    </div>
</body>
</html>


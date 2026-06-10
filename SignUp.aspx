<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication6.WebForm2" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hotelify Sign Up</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            background-image: url("Hotel.jpg");
            background-size:cover;
            display: flex;
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
            margin-bottom: 5px;
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
        <h1>Registration</h1>
        <form runat="server">
            <div class="form-group">
                <input type="text" id="regusername" placeholder="Enter your username" runat="server" required />
            </div>
            <div class="form-group">
                <input type="text" id="regemail" placeholder="Enter your email" runat="server" required />
            </div>
            <div class="form-group">
                <input type="text" id="regfirstname" placeholder="Enter firstname" runat="server" required />
            </div>
            <div class="form-group">
                <input type="text" id="reglastname" placeholder="Enter lastname" runat="server" required />
            </div>

            <div class="form-group">
                <input type="text" id="regaddress" placeholder="Enter your Address" runat="server" required />
            </div>
            <div class="form-group">
                <input type="text" id="regphone" placeholder="Phone Num" runat="server" required />
            </div>

            <div class="form-group">
                <input type="password" id="regpassword" placeholder="Enter your password" runat="server" required />
            </div>
            <div class="form-group">
                <label for="role">User Role:</label>
                <select id="regrole" name="role" runat="server" required>
                    <option value="">Select role</option>
                    <option value="User">User</option>
                    <option value="Owner">Owner</option>
                </select>
            </div>
            <div class="form-group">
                <asp:Button type="submit" runat="server" OnClick="RegisterButton_Click" Text="Register"></asp:Button>
            </div>
            <asp:Label ID="ConfirmationLabel" runat="server" Text=""></asp:Label>
            <div class="form-group">
                <a href="Login.aspx" style="font-style: italic">login</a>
            </div>
        </form>

    </div>
</body>
</html>


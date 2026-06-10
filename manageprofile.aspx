<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageprofile.aspx.cs" Inherits="WebApplication6.WebForm4" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
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
            
            <h1>Update Profile Page</h1>
            <br>



            <h2>Profile Details</h2>
            <div>
                <asp:Label ID="UsernameLabel" runat="server" Text=""></asp:Label>
                <br />
                Hi
                <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
                <br />
                Phone:
                <asp:Label ID="phoneLabel" runat="server" Text=""></asp:Label>
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text=""></asp:Label>
                <br />
                Password:
                <asp:Label ID="pwdLabel" runat="server" Text=""></asp:Label>

                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text=""></asp:Label>

            </div>

        </div>
        <div class="right-section">
            <form runat="server">


                <div class="form-group">
                    <%--<label for="username">Username:</label>--%>
                    <input type="text" id="regaddress" placeholder="Change Address" runat="server" />
                </div>
                
                </br>
                <div class="form-group">
                    <%--<label for="username">Username:</label>--%>
                    <input type="text" id="regphone" placeholder="Change PhoneNum" runat="server" />
                </div>
                
                </br>

                <div class="form-group">
                    <%--<label for="password">Password:</label>--%>
                    <input type="text" id="firstname" placeholder="Change FirstName" runat="server" />
                </div>

                
                </br>
                <div class="form-group">
                    <%--<label for="password">Password:</label>--%>
                    <input type="text" id="lastname" placeholder="Change LastName" runat="server" />
                </div>
                
                </br>
                <div class="form-group">
                    <%--<label for="password">Password:</label>--%>
                    <input type="text" id="emailLabel1" placeholder="Change Email" runat="server" />
                </div>
               
                </br>
                
                <div class="form-group">
                    <%--<label for="password">Password:</label>--%>
                    <input type="password" id="regpassword" placeholder="Change Password" runat="server" />
                </div>
                
                </br>
                <div class="form-group">
                    <asp:Button type="submit" runat="server" OnClick="UpdateButton_Click" Text="Update"></asp:Button>
                </div>
                <asp:Label ID="ConfirmationLabel" runat="server" Text=""></asp:Label>

                <div class="form-group">
                    <asp:Button type="submit" runat="server" OnClick="deleteButton_Click" Text="Deleteprofile"></asp:Button>
                </div>

                <br />

                <asp:Button runat="server" Text="Home" OnClick="home"  />

                

            </form>
        </div>
        </div>
</body>
</html>

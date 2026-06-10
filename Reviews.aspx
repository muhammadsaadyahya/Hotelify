<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="WebApplication6.Reviews" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            overflow-y: auto;
            max-height: 90vh;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .review {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .review:last-child {
            border-bottom: none;
        }
        .review-title {
            font-size: 18px;
            font-weight: bold;
        }
        .review-content {
            margin: 10px 0;
        }
        .review-footer {
            font-size: 12px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Reviews</h1>
        <asp:Repeater ID="ReviewsRepeater" runat="server">
            <ItemTemplate>
                <div class="review">
                    <div class="review-title">Rating: <%# Eval("rating") %> stars</div>
                    <div class="review-content"><%# Eval("comment") %></div>
                    <div class="review-footer">
                        By <%# Eval("username") %> on <%# Eval("date_posted", "{0:MMMM dd, yyyy}") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</body>
</html>

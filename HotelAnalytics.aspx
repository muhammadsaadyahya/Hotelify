<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelAnalytics.aspx.cs" Inherits="WebApplication6.HotelAnalytics" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Analytics</title>

    <style>
         
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
    background-image: url('/an.jpeg');
    background-size: cover; 
}

        #analyticsForm {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        #btnRunAnalytics {
            display: block;
            margin: 0 auto;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        #btnRunAnalytics:hover {
            background-color: #0056b3;
        }
        #litAnalyticsResults {
            margin-top: 20px;
            padding: 10px;
            font-size: 16px;
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="analyticsForm" runat="server">
        <h1>Hotel Analytics</h1>
        <div>
            <asp:Button ID="btnRunAnalytics" runat="server" Text="Run Analytics" OnClick="btnRunAnalytics_Click" />
        </div>
        <br />
        <div>
            <asp:Literal ID="litAnalyticsResults" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>

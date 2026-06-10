<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReview.aspx.cs" Inherits="WebApplication6.AddReview" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Review</title>
    <style>
        /* Resetting default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Centering the form */
        #form1 {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('/fd.jpg'); /* Replace 'path/to/your/background/image.jpg' with the actual path to your image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        /* Form container styles */
        div {
            max-width: 300px;
            padding: 4px;
            background-color: rgba(255, 255, 255, 0.8); /* Added transparency to the background color */
            border-radius: 8px;
            box-shadow: 0px 15px 10px rgba(1, 1, 1, 0.1);
        }

        /* Label styles */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        /* Input styles */
        input[type="text"] {
            width: calc(100% - 22px); /* Adjusted for input padding and border */
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #66afe9;
        }

        /* Button styles */
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Result label styles */
        #ResultLabel {
            font-size: 14px;
            color: #28a745;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="HotelIDLabel" runat="server" Text="Hotel ID:"></asp:Label>
            <asp:TextBox ID="HotelIDTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="RatingLabel" runat="server" Text="Rating:"></asp:Label>
            <asp:TextBox ID="RatingTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="CommentLabel" runat="server" Text="Comment:"></asp:Label>
            <asp:TextBox ID="CommentTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Button ID="SubmitReviewButton" runat="server" Text="Submit Review" OnClick="SubmitReviewButton_Click" CssClass="btn btn-primary" />
            <br />
            <asp:Label ID="ResultLabel" runat="server" Text=""></asp:Label>
            

        </div>
    </form>
</body>
</html>

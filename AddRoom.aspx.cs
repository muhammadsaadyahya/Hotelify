using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("owner.aspx");
        }


        protected void Confirm(object sender, EventArgs e)
        {
            int hotelId = Convert.ToInt32(Request.QueryString["hotelId"]);
            string roomtype = RoomTypeTextBox.Text.Trim();
            int roomNo = int.Parse(RoomNoTextBox.Text);
            int price = int.Parse(PriceTextBox1.Text);

            string query = "INSERT INTO Room (hotel_id, room_no, room_type, availability, price, amenities) " +
                           "VALUES (@h_id, @r_no, @r_type, 'Available', @p, 'Type1')";

            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@h_id", hotelId);
                    command.Parameters.AddWithValue("@r_no", roomNo);
                    command.Parameters.AddWithValue("@r_type", roomtype);
                    command.Parameters.AddWithValue("@p", price);

                    int rowsAffected = command.ExecuteNonQuery();
                    
                    
                }
            }
        }
    }

}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Load hotels data into HotelGridView
                    BindBooking();
                    BindHotel();
                }
            }

        protected void BindHotel()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM Hotel";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                HotelGridView.DataSource = reader;
                HotelGridView.DataBind();
            }
        }


        protected void BindBooking()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string username = Session["Username"].ToString();
                connection.Open();

                string query = "SELECT * FROM GroupBookings WHERE [UserID] = (SELECT [user_id] FROM [User] WHERE username = @username)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);

                SqlDataReader reader = command.ExecuteReader();

                BookingGridView.DataSource = reader;
                BookingGridView.DataBind();
            }
        }

        protected void DoGroupBook(object sender, EventArgs e)
        {
                string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            string username = Session["Username"].ToString();


            int.TryParse(hid.Text, out int hotelId);
            int.TryParse(P.Text, out int numberOfGuests);

            string groupName = GroupName.Text;


            using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("GRBOOK", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        
                        command.Parameters.AddWithValue("@user", username);
                        command.Parameters.AddWithValue("@h", hotelId);
                        command.Parameters.AddWithValue("@no", numberOfGuests);
                        command.Parameters.AddWithValue("@g", groupName);

                        command.ExecuteNonQuery();
                    Response.Redirect(Request.RawUrl);


                }
            }
            
        }










            protected void home(object sender, EventArgs e)
            {
                Response.Redirect("guest.aspx");
            }
        }
    }


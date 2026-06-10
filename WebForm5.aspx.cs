using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Services;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        
            protected void Page_Load(object sender, EventArgs e)
            {
            if (!IsPostBack)
            {
                BindHotel();
            }
            else
            {
                bool isRoomViewVisible = Session["IsRoomViewVisible"] != null ? (bool)Session["IsRoomViewVisible"] : false;
                RoomGridView.Visible = isRoomViewVisible;
                BackButton.Visible = isRoomViewVisible;
                HotelGridView.Visible = !isRoomViewVisible;
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

        protected void ViewRoom(object sender, EventArgs e)
        {
            HotelGridView.Visible = false;
            RoomGridView.Visible = true;
            BackButton.Visible = true;

            Session["IsRoomViewVisible"] = true;
            Button btn = (Button)sender;
            string hotelId = btn.CommandArgument;

            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            string query = "SELECT room_id,room_no, room_type,price FROM Room WHERE hotel_id = @HotelId and [availability]=\'Available\'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@HotelId", hotelId);

                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                RoomGridView.DataSource = dt;
                RoomGridView.DataBind();
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            HotelGridView.Visible = true;
            RoomGridView.Visible = false;
            BackButton.Visible = false;

            Session["IsRoomViewVisible"] = false;
        }
        protected void Book(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string roomID = btn.CommandArgument;

            Response.Redirect("Book.aspx?roomID=" + roomID);
        }


        protected void home(object sender, EventArgs e)
            {
                Response.Redirect("guest.aspx");
            }
        }
    }
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplication6
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }

        protected void Confirm(object sender, EventArgs e)
        {
            string roomID = Request.QueryString["roomID"];

            HtmlInputControl CheckIn = (HtmlInputControl)FindControl("CheckIn");
            HtmlInputControl CheckOut = (HtmlInputControl)FindControl("CheckOut");


            string Checkin = CheckIn.Value;
            string Checkout = CheckOut.Value;
            string username = Session["Username"].ToString();


            
            DateTime checkInDate = DateTime.Parse(Checkin);
            DateTime checkOutDate = DateTime.Parse(Checkout);

            


            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

               
                SqlCommand command = new SqlCommand("MakeReservation", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@room_id", roomID);
                command.Parameters.AddWithValue("@check_in_date", checkInDate);
                command.Parameters.AddWithValue("@check_out_date", checkOutDate);
                   
                
                string message = null;

                if (checkInDate >= checkOutDate || checkInDate == DateTime.Today)
                {

                }
                else
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            reader.Read();


                            if (!reader.IsDBNull(0))
                            {

                                object value = reader.GetValue(0);


                                if (value != null)
                                {
                                    message = value.ToString();
                                }
                            }
                        }
                    }


                    Console.WriteLine(message);
                    Response.Redirect("ManageBooking.aspx");

                }

            }


        }

    }
}
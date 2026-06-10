using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6
{
    public partial class HotelAnalytics : System.Web.UI.Page
    {
        protected void btnRunAnalytics_Click(object sender, EventArgs e)
        {
            string analyticsReport = GetHotelAnalyticsForAllHotels();

            litAnalyticsResults.Text = analyticsReport;
        }

        private string GetHotelAnalyticsForAllHotels()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            string analyticsReport = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("GetHotelAnalyticsForAllHotels", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            analyticsReport = reader["AnalyticsReport"].ToString();
                        }
                    }
                }
            }

            return analyticsReport;
        }
    }
}

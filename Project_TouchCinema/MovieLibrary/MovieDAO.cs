using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace MovieLibrary
{
    public class MovieDAO
    {
        private string strConnection;

        public MovieDAO()
        {
            strConnection = ConfigurationManager.ConnectionStrings["TouchCinemaDB"].ConnectionString;

        }

        public String GetMovieTitle(string movieID)
        {
            String movieName = "";
            SqlConnection conn = new SqlConnection(strConnection);
            if (conn != null)
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                try
                {
                    string sql = "Select movieTitle from Movie where movieID=@id";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", movieID);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        
                        movieName = reader["movieTitle"].ToString();
                    }
                }
                finally
                {
                    conn.Close();
                }
            }
            return movieName;
        }
    }
}

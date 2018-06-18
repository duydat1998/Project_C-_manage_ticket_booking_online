using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace AdminLibrary
{
    public class AdminDAO
    {
        private string strConnection = ConfigurationManager.ConnectionStrings["TouchCinemaDB"].ConnectionString;

        public AdminDTO CheckLogin(string username, string password)
        {
            AdminDTO result = new AdminDTO();
            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            try
            {
                string sql = "SELECT * FROM Admin WHERE username = @username, password=@password";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        string userid = dr.GetString(0);
                        string pw = dr.GetString(1);
                        string firstName = dr.GetString(2);
                        string lastName = dr.GetString(3);
                        string phone = dr.GetString(4);
                        string email = dr.GetString(5);
                        result = new AdminDTO(userid, pw, firstName, lastName, phone, email);
                    }
                    else
                    {
                        result = null;
                    }
                }
            }
            finally
            {
                con.Close();
            }
            return result; 
        }

        public bool AddNewStaff(StaffLibrary.StaffDTO dto,string password,bool isActive)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            try
            {
                string sql = "Insert into Staff (username, password, firstName, lastName, phone, email, isActive) values(@username, @password, @firstname, @lastName, @phone, @email, @isActive)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@username", dto.Username);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@firstName", dto.FirstName);
                cmd.Parameters.AddWithValue("@lastName", dto.LastName);
                cmd.Parameters.AddWithValue("@phone", dto.Phone);
                cmd.Parameters.AddWithValue("@email", dto.Email);
                cmd.Parameters.AddWithValue("@isActive", isActive);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    check = true;
                }
            }
            finally
            {
                con.Close();
            }
            return check;
        }

        public bool DeactivateStaff(string username)
        {
            bool check = false;

            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            try
            {
                string sql = "UPDATE Staff SET isActive=@isActive";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@isActive", false);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    check = true;
                }
            }
            finally
            {
                con.Close();
            }

            return check;
        }

        public bool AddNewMovie(MovieLibrary.MovieDTO dto)
        {
            bool check = false;

            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            try
            {
                string sql = "INSERT INTO Movie(movieID,movieTitle,length,rating,startDate,poster,linkTrailer,producer,year)" +
                    " VALUES(@movieID,@movieTitle,@length,@rating,@startDate,@poster,@linkTrailer,@producer,@year)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@movieID",dto.MovieID);
                cmd.Parameters.AddWithValue("@movieTitle", dto.MovieTitle);
                cmd.Parameters.AddWithValue("@length", dto.Length);
                cmd.Parameters.AddWithValue("@rating", dto.Rating);
                cmd.Parameters.AddWithValue("@startDate", dto.StartDate);
                cmd.Parameters.AddWithValue("@poster", dto.Poster);
                cmd.Parameters.AddWithValue("@linkTrailer", dto.LinkTrailer);
                cmd.Parameters.AddWithValue("@producer", dto.Producer);
                cmd.Parameters.AddWithValue("@year", dto.Year);
                int count = cmd.ExecuteNonQuery();
                if(count > 0)
                {
                    check = true;
                }
            }
            finally
            {
                con.Close();
            }

            return check;
        }

        public bool UpdateMovie(MovieLibrary.MovieDTO dto)
        {
            bool check = false;

            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            try
            {
                string sql = "UPDATE Movie" +
                    " SET movieTitle=@movieTitle,length=@length,rating=@rating,startDate=@startDate,poster=@poster,linkTrailer=@linkTrailer,producer=@producer,year=@year" +
                    " WHERE movieID=@movieID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@movieTitle", dto.MovieTitle);
                cmd.Parameters.AddWithValue("@length", dto.Length);
                cmd.Parameters.AddWithValue("@rating", dto.Rating);
                cmd.Parameters.AddWithValue("@startDate", dto.StartDate);
                cmd.Parameters.AddWithValue("@poster", dto.Poster);
                cmd.Parameters.AddWithValue("@linkTrailer", dto.LinkTrailer);
                cmd.Parameters.AddWithValue("@producer", dto.Producer);
                cmd.Parameters.AddWithValue("@year", dto.Year);
                cmd.Parameters.AddWithValue("@movieID", dto.MovieID);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    check = true;
                }
            }
            finally
            {
                con.Close();
            }

            return check;
        }

        public List<MemberLibrary.MemberDTO> SearchMemberByUsername(string username)
        {
            List<MemberLibrary.MemberDTO> result = null;

            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            try
            {
                string sql = "SELECT * FROM Member WHERE username LIKE %@username%";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@username", username);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while(dr.Read())
                    {
                        
                        MemberLibrary.MemberDTO dto = new MemberLibrary.MemberDTO
                        {
                            Username = dr.GetString(0),
                            Password = dr.GetString(1),
                            FirstName = dr.GetString(2),
                            LastName = dr.GetString(3),
                            PhoneNum = dr.GetString(4),
                            Email = dr.GetString(5),
                            Birthdate = dr.GetDateTime(6),
                            isActive = dr.GetBoolean(8)
                        };
                        result.Add(dto);
                    }
                    
                }
            }
            finally
            {
                con.Close();
            }

            return result;
        }

        public bool DeactivateMember(string username)
        {
            bool check = false;

            

            return check;
        }
    }
}

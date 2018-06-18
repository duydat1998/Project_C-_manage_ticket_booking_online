using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using MovieLibrary;

namespace MemberLibrary
{
    class MemberDAO
    {
        private SqlConnection conn;
        private SqlDataAdapter dAdapter;
        private SqlDataReader dReader;
        private SqlCommand cmd;
        private string cmdLine;
        private readonly string DATABASENAME = "TouchCinemaDB";

        public MemberDAO()
        {

        }

        private void CloseConnect()
        {
            try
            {
                if(conn!= null || conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }
                cmdLine = "";
            }
            catch (Exception)
            {
                throw;
            }
        }

        private string getConnection()
        {
            return ConfigurationManager.ConnectionStrings[DATABASENAME].ConnectionString;
        }

        public MemberDTO CheckLoginMember(string Username, string Password)
        {
            MemberDTO member = null;
            try
            {
                conn = new SqlConnection(getConnection());
                cmdLine = "Select username, password, firstName, lastName, phone, email, birthDate, avatar, isActive " +
                                "From Member " +
                                "Where username = @Username AND password = @Password;";
                cmd = new SqlCommand(cmdLine, conn);
                cmd.Parameters.AddWithValue("@Username", Username);
                cmd.Parameters.AddWithValue("@Password", Password);
                dReader = cmd.ExecuteReader();
                if (dReader.Read())
                {
                    member = new MemberDTO
                    {
                        Username = dReader.GetString(0),
                        Password = dReader.GetString(1),
                        FirstName = dReader.GetString(2),
                        LastName = dReader.GetString(3),
                        PhoneNum = dReader.GetString(4),
                        Email = dReader.GetString(5),
                        Birthdate = dReader.GetDateTime(6),
                        ImageLink = dReader.GetString(7),
                        isActive = dReader.GetBoolean(8),
                    };
                }
            }
            catch (Exception)
            {
                member = null;
            }
            finally
            {
                CloseConnect();
            }            
            return member;
        }

        public int CheckPointMember(string Username)
        {
            int point = 0;
            try
            {
                conn = new SqlConnection(getConnection());
                cmdLine = "Select point " +
                            "From Point " +
                            "Where username = @Username";
                cmd = new SqlCommand(cmdLine, conn);
                cmd.Parameters.AddWithValue("@Username", Username);
                dReader = cmd.ExecuteReader();
                if (dReader.Read())
                {
                    point = dReader.GetInt32(0);
                }
            }
            catch (Exception)
            {
                point = 0;
            }
            finally
            {
                CloseConnect();
            }
            return point;
        }

        private bool UpdatePointMember(string Username, int point)
        {
            bool checker = false;
            try
            {
                conn = new SqlConnection(getConnection());
                cmdLine = "Update Point " +
                            "Set point = @Point " +
                            "Where username = @Username";
                cmd = new SqlCommand(cmdLine, conn);
                cmd.Parameters.AddWithValue("@Point", point);
                cmd.Parameters.AddWithValue("@Username", Username);
                checker = cmd.ExecuteNonQuery() > 0;
            }
            catch (Exception)
            {
                point = 0;
            }
            finally
            {
                CloseConnect();
            }
            return checker;
        }

        public bool UpdateProfileMember(MemberDTO dto)
        {
            bool checker = false;
            try
            {
                conn = new SqlConnection(getConnection());
                cmdLine = "Update Member " +
                            "Set password = @Password, firstName = @First, lastName = @Last, phone = @Phone," +
                                " email = @Email, birthDate = @Birth, avatar = @Avatar, isActive = @IsActive" +
                            "Where username = @Username";
                cmd = new SqlCommand(cmdLine, conn);
                cmd.Parameters.AddWithValue("@Password", dto.Password);
                cmd.Parameters.AddWithValue("@First", dto.FirstName);
                cmd.Parameters.AddWithValue("@Last", dto.LastName);
                cmd.Parameters.AddWithValue("@Phone", dto.PhoneNum);
                cmd.Parameters.AddWithValue("@Email", dto.Email);
                cmd.Parameters.AddWithValue("@Birth", dto.Birthdate);
                cmd.Parameters.AddWithValue("@Avatar", dto.ImageLink);
                cmd.Parameters.AddWithValue("@IsActive", dto.isActive);
                cmd.Parameters.AddWithValue("@Username", dto.Username);
                checker = cmd.ExecuteNonQuery() > 0;
                
            }
            catch (Exception)
            {
                checker = false;
            }
            finally
            {
                CloseConnect();
            }
            return checker;
        }


        public List<MemberLibrary.MemberDTO> SearchMemberByUsername(string username)
        {
            List<MemberLibrary.MemberDTO> result = null;

            SqlConnection con = new SqlConnection(getConnection());
            con.Open();
            try
            {
                string sql = "SELECT * FROM Member WHERE username LIKE %@username%";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@username", username);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
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

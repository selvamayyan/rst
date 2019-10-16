using System;
using System.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net;




 

/// <summary>
/// Summary description for UserDetails
/// </summary>
public class UserDetails
{
	
    private int mCode;
    private string mFirstName;
    private string mLastName;
    private string mEntID;

    private Boolean chkflag = false;

    


    public int Code
    {
        set
        {
            mCode = value;
        }
        get
        {
            return mCode;
        }
    }


    public string FirstName
    {
        set
        {
            mFirstName = value;
        }
        get
        {
            return mFirstName;
        }
    }



    public string LastName
    {
        set
        {
            mLastName = value;
        }
        get
        {
            return mLastName;
        }
    }



    public string EntID
    {
        set
        {
            mEntID = value;
        }
        get
        {
            return mEntID;
        }
    }





    public Boolean checkValidUser()
    {


        SqlConnection con=new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("Select * from del_User where userPk='" + mEntID +"'",con);
        cmd.CommandType = CommandType.Text;

        ////dataset..

        //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //DataSet ds = new DataSet();
        //adp.Fill(ds,"UserDtl");

        //if (ds.Tables["UserDtl"].Rows.Count > 0)
        //{

        //    mCode = System.Convert.ToInt16(ds.Tables["UserDtl"].Rows[0]["UserPk"].ToString());
        //    mFirstName = ds.Tables["UserDtl"].Rows[0]["FirstName"].ToString();
        //    mLastName = ds.Tables["UserDtl"].Rows[0]["LastName"].ToString();
        //    chkflag = true;
                  
        //}


        //SqlDataReader rdr = cmd.ExecuteReader();

        //if(rdr.HasRows)
        //{

        //    while (rdr.Read())
        //    {

        //        mCode = System.Convert.ToInt16(rdr["UserPk"].ToString());
        //        mFirstName = rdr["FirstName"].ToString();
        //        mLastName = rdr["LastName"].ToString();
        //        chkflag = true;

        //     }

        //}


        //datareader..








        //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connectionstring"].ToString());
        //SqlCommand cmd = new SqlCommand("select * from del_user where enterpriseid='" + mEntID + "'", con);


        //Using data Adaptor...

        SqlDataAdapter adp = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();
        adp.Fill(ds, "UserDtl");

        if (ds.Tables["UserDtl"].Rows.Count > 0)
        {
            mCode = System.Convert.ToInt16(ds.Tables["UserDtl"].Rows[0]["Userpk"].ToString());
            mFirstName = ds.Tables["UserDtl"].Rows[0]["FirstName"].ToString();
            mLastName = ds.Tables["UserDtl"].Rows[0]["LastName"].ToString();
            chkflag = true;


        }



        //Using data reader...
        //SqlDataReader rdr = cmd.ExecuteReader();
        //if( rdr.HasRows)
        //{
        //   while(rdr.Read())
        //    {
        //        mFirstName=rdr["FirstName"].ToString();
        //        mLastName=rdr["LastName"].ToString();
        //        chkflag=true;
        //    }
        //}

        return chkflag;   
    
    }

}
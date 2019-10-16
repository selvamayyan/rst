using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Summary description for ErrDtl
/// </summary>
public class ErrDtl
{


    private string _User;
    private string _Source;
    private string _ErrMsg;
    private string _StkTrc;


    public string User
    {

        set
        {
            _User = value;
        }
        get
        {
            return _User;
        }
    }


    public string Source
    {

        set
        {
            _Source = value;
        }
        get
        {
            return _Source;
        }
    }


    public string ErrMsg
    {

        set
        {
            _ErrMsg = value;
        }
        get
        {
            return _ErrMsg;
        }
    }


    public string StkTrc
    {

        set
        {
            _StkTrc = value;
        }
        get
        {
            return _StkTrc;
        }
    }


    public void writeEventlog()
    {

        //string strHeader = "\n The following Error has accured: \n\n";
        //strDescription = "\n";
        //strDescription = string.Concat(strHeader.ToString(), "User Name is :", _UserID.ToString(), "\n Error Description:", _Emsg.ToString(), "\n", _Source.ToString());
        //System.Diagnostics.EventLog.WriteEntry("Application", strDescription.ToString() + _Stack.ToString(), System.Diagnostics.EventLogEntryType.Error, _eventID);
        string StrDescription = "The following Error has accured \n\n" + "User Name:" + _User.ToString() + " Source:" + _Source.ToString() + " Error Message:" + _ErrMsg.ToString() + " Stack Trace:" + _StkTrc.ToString();
        System.Diagnostics.EventLog.WriteEntry("Application", StrDescription, System.Diagnostics.EventLogEntryType.Error, 2);

    }

    public void WriteTextLog()
    {

        string StrDescription = "The following Error has accured \n\n" + "User Name:" + _User.ToString() + " Source:" + _Source.ToString() + " Error Message:" + _ErrMsg.ToString() + " Stack Trace:" + _StkTrc.ToString();
        System.IO.StreamWriter logfile = new System.IO.StreamWriter("d:\\error.txt", true);
        logfile.WriteLine(DateTime.Now.ToLongDateString() + "---" + DateTime.Now.ToLongTimeString() + "---" + StrDescription);
        logfile.Close();
        SendEmail(StrDescription);

    }



    private static void SendEmail( string ErrDescription)
    {

        MailMessage MailMessage = new MailMessage("selvam.cna@gmail.com", "selvam.cna@gmail.com");
        MailMessage.Subject = "Execption";

        SmtpClient smtpclient = new SmtpClient("smtp.gmail.com", 587);
        smtpclient.Credentials= new  System.Net.NetworkCredential()
        {
            UserName ="selvam.cna@gmail.com",
            Password="Krishi$123$"
        
        };

        smtpclient.EnableSsl = true;
        smtpclient.Send(MailMessage);


            
    }
}
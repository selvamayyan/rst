using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;

public partial class FileStream : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



        //btnRead.Click+=new EventHandler(method1);
        //btnRead.Click+=new EventHandler(method2);

        if (!IsPostBack)
        {
           string[] filelist = Directory.GetFiles("c:\\TT");
          // string[] filelist =
               //File.Copy("c:\\Inetpub/wwwroot");

           // string[] directoryList = Directory.GetDirectories("c:\\pendrive Copy");

     

            drpFils.DataSource = filelist;
            this.DataBind();

            DirectoryInfo myDirectory = new DirectoryInfo(@"c:\\TT");
            myDirectory.Create();

            FileInfo myFile = new FileInfo(@"c:\\TT\selvam.txt");
            myFile.Create();

            StreamWriter file = new StreamWriter("c:\\TT/kumar.txt");
            file.WriteLine("hhkajsdklasdj;as");

            //FileInfo myFile1 = new FileInfo("c:\\TT/valli.txt");
            //myFile1.Create();


            //StreamReader rdr = new StreamReader("c:\\TT/valli.txt");
            //Response.Write(rdr.Read());

            File.ReadAllLines("c:\\TT/valli.txt");
          
           //StreamWriter file=new StreamWriter("c:\\TT/selvam.txt");
           //file.WriteLine("hhkajsdklasdj;as");
           //file.WriteLine("wwwwwwwwwwww");
           //file.WriteLine("dddddddddddd");
           //file.WriteLine("cccccccccccccc");
           //file.WriteLine("vvvvvvvvvvvvv");

           //file.WriteLine("cccccc");
           //file.WriteLine("ggggggggggg");
           //file.Close();

        }
    }
   
    protected void drpFils_SelectedIndexChanged(object sender, EventArgs e)
    {


        StringBuilder displaytext = new StringBuilder();
        string filename = drpFils.SelectedItem.Text;
        displaytext.Append("<b>").AppendLine();
        displaytext.Append(filename);
        displaytext.Append("<b><br/>Created:").AppendLine();
        displaytext.Append(File.GetCreationTime(filename).ToString());
        displaytext.Append("<br>LastAccessed:");
        displaytext.Append(File.GetLastAccessTime(filename));
        displaytext.Append("<b>");
        displaytext.Append("<b>");
        displaytext.Append("<b>");

        lblDisply.Text = displaytext.ToString();


    }






    protected void btnRead_Click(object sender, EventArgs e)
    {

        //    StreamReader rdr = new StreamReader("c:\\TT/selvam.txt");
        //    string line;
        //    string rdrtext="";
        //    do{
        //     line = rdr.ReadLine();
        //     rdrtext=rdrtext+"--"+ line;

        //    }while(line !=null) ;
        //    lblread.Text = rdrtext;
        //}

        //Directory.CreateDirectory("d:\\xxxxx");
        //File.Create("d:\\xxxxx/selvam.xls");
        //File.Create("d:\\xxxxx/selvam.doc");
        //File.Create("d:\\xxxxx/selvam.txt");

         Directory.CreateDirectory("d:\\fff");

         File.Create("d:\\fff/sel.xls");
         File.Create("d:\\fff/sel.doc");
         File.Create("d:\\fff/sel.txt");
    }

}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class execrcise_fileUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {


        if (Fileupload1.HasFile)
        {

            string fileExtension=System.IO.Path.GetExtension(Fileupload1.FileName);

            if (fileExtension.ToLower() != "doc" && fileExtension.ToLower() != "docx")
            {

                Label1.Text = "only word document can be uploaded";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else 
            
            {

                int filesize = Fileupload1.PostedFile.ContentLength;
                if (filesize > 2097152)///2 bytes
                {
                    Label1.Text = "only file below 2 bytes can be uploaded";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    Fileupload1.SaveAs(Server.MapPath("~/Upload/" + Fileupload1.FileName));
                    Label1.Text = "File Uploytesaded";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
            }

          
        }
        else 
        
        {

            Label1.Text = "Select File to Uploaded";
        }
    }
}
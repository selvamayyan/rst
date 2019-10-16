using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;


public partial class files_recursion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      



    }


    protected void btnfindFiles_Click(object sender, EventArgs e)
    {
        string path = Txtpath.Text;
        FindFiles(path);
    }

    private void  FindFiles(string filePath)
    {

        foreach (string filename in Directory.GetFiles(filePath))
        {

            ListBox1.Items.Add(filename);

        }

        foreach (string directory in Directory.GetDirectories(filePath))
        {

            FindFiles(directory);

        }

    }
 

    


}


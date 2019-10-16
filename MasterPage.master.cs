using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        try
        {

            if (!IsPostBack)
            {
                TreeNode Root = new TreeNode("root");
                Root.SelectAction = TreeNodeSelectAction.None;
               

                
                TreeNode Home = new TreeNode("Home", "", "", "Default.aspx", "");
                Root.ChildNodes.Add(Home);

                TreeNode Calander = new TreeNode("Calander", "", "", "Calendar.aspx", "");
                Root.ChildNodes.Add(Calander);

                TreeNode Session = new TreeNode("Session", "", "", "SessionList.aspx", "");
                Root.ChildNodes.Add(Session);

                TreeNode Course = new TreeNode("Course", "", "", "Course.aspx", "");
                Root.ChildNodes.Add(Course);

                TreeNode Location = new TreeNode("Location", "", "", "Location.aspx", "");
                Root.ChildNodes.Add(Location);


                tvw.Nodes.Add(Root);
            }


        }
        
        catch(Exception Ex )
          
        {

            string Msg = Ex.Message;
            string stktrc = Ex.StackTrace;

        }
      
    }

    public TextBox TxtboxOnMasterPage
    {
        get
        {
            return this.TxtMaster;
        }

    }


    public Panel panalOnMasterPage
    {
        get
        {
            return this.pnlMasterSearch;
        }
    }

    public Button buttonOnMasterPage
    {
        get
        {
            return this.btnMasterSearch;
        }
    }


    public string SearchTermOnMasterPage
    
    {   
        get
        {
            return this.TxtMasterName.Text;
        }
    }

   
}

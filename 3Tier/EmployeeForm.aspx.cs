using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLemployee;
using DALemployee;

public partial class _3Tier_EmployeeForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void BtnInsert_Click(object sender, EventArgs e)
    {


        try
        {
            Employee emp = new Employee();
            emp.Name = txtName.Text;
            emp.City = TxtCity.Text;
            emp.Gender = drpGender.SelectedValue;

            DALemployee.DALemployee dal = new DALemployee.DALemployee();
            int result=  dal.Insert(emp);

           
            
            
        }
        catch(Exception Ex)
        {

            string ErrMsg = Ex.Message.ToString();
            string StcTrc = Ex.StackTrace.ToString();


        }




    }
}
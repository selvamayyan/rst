using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Reflection;


public partial class execrcise_Reflection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        string typename=TxtEntry.Text;
        Type T =  Type.GetType(typename);

        



        MethodInfo[] methods = T.GetMethods();

        foreach(MethodInfo method in methods )
        {

            Lstmothod.Items.Add(method.ReturnType.Name + "---" + method.Name);
        
        }


        //retriving property type..

        PropertyInfo[] properties = T.GetProperties();

        foreach (PropertyInfo property in properties)
        {

            LstProperties.Items.Add(property.PropertyType.Name + "---" + property.Name);

        }


        //Constructor Type..

        ConstructorInfo[] constructors = T.GetConstructors();

        foreach (ConstructorInfo constructor in constructors )
        {

            LstConstructors.Items.Add(constructor.ToString());

        }




    }
}
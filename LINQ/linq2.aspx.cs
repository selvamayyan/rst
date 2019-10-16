using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LINQ_linq2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //UserDataContext datacontext = new  UserDataContext();


        //Gridview1.DataSource = from user in datacontext.students
        //                       where student.gender=="male"
        //                       select student;


      
        


    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int[] numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

        Response.Write("Max:"+ numbers.Max());
        Response.Write("<br>Min:"+numbers.Min());
        Response.Write("<br>Aver:" + numbers.Average());
        Response.Write("<br>Count:" + numbers.Count());
        Response.Write("<br>First:" + numbers.First());
        Response.Write("<br>Last:" + numbers.Last());
        Response.Write("<br>sum:" + numbers.Sum());




        //Gridview1.DataSource = from number in numbers
        //                       where (number % 2) == 0
        //                       select number;

        //Gridview1.DataBind();

    }
    protected void BtnLabda_Click(object sender, EventArgs e)
    {

        IEnumerable<student> queryResult = student.getAllrecords().Where(studentt => studentt.gender == "Male");
        Gridview1.DataSource = queryResult;
        Gridview1.DataBind();

    }
    protected void BtnSqlQury_Click(object sender, EventArgs e)
    {
        //IEnumerable<student> queryResult = from studentt in student.getAllrecords()
        //                                   where studentt.gender == "Male"
        //                                   select studentt;


        //Gridview1.DataSource = queryResult;
        //Gridview1.DataBind();


        //other method

        List<student> students = new List<student>();
        students = student.getAllrecords();

        //IEnumerable<student> queryResult = from studentt in students
        //                                  // where studentt.gender == "Male"
        //                                   select studentt;

        //selecting Allfields
        //var queryResult = from stu in students
        //                  where stu.gender == "Male"
        //                  orderby stu.name, stu.id descending
        //                  select stu;

        //selecting multiple fields.. 
        //var queryResult = from studentt in students
        //                  where studentt.gender == "Male"
        //                  orderby studentt.name descending, studentt.id descending
        //                  select studentt.id;


       // selecting multiple fields.. 
        //var queryResult = from stu in students
        //                  where stu.gender == "Male" && stu.name == "selvam" //we can use or '||'
        //                  orderby stu.name, stu.id descending
        //                  select new { stu.name, stu.id };


        var queryResult = from stu in students
                          // where stu.gender == "Male" && stu.name == "selvam"
                          orderby stu.id
                          select new { stu.id, stu.name };



        



      
        Gridview1.DataSource = queryResult;
        Gridview1.DataBind();




        //order by examples... both sql query structure & lamda expression...
        //var query = from person in people
        //            orderby person.Name descending, person.Age descending
        //            select person.Name;


        //var query = people.OrderByDescending(person => person.Name)
        //          .ThenByDescending(person => person.Age)
        //          .Select(person => person.Name);


      //  var items = db.tblItems.Select(i => i.id && i.name && i.totalAmount);
    }

  
}
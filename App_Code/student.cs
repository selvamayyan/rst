using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for student
/// </summary>
public class student
{

    public int id { get; set; }
    public string name { get; set; }
    public string gender { get; set; }

    public static List<student> getAllrecords()
    {

       List<student> students = new List<student>();

       student student1 = new student()
       {
        id=1,
        name="selvam",
        gender="Male"
       };

       students.Add(student1);

       student student2 = new student()
       {
           id = 2,
           name = "Kumar",
           gender = "Male"
       };

       students.Add(student2);
       student student3 = new student()
       {
           id = 3,
           name = "Venu",
           gender = "Male"
       };

       students.Add(student3);
       student student4 = new student()
       {
           id = 4,
           name = "Malar",
           gender = "FeMale"
       };
       students.Add(student4);
       student student5 = new student()
       {
           id = 5,
           name = "Geetha",
           gender = "FeMale"
       };
       students.Add(student5);

        return students;
    }



}
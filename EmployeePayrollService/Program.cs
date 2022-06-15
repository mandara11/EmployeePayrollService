using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeePayrollService
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Employee Payroll!");
            EmployeeRepo repo = new EmployeeRepo();
            EmployeeModel employee = new EmployeeModel();
            employee.EmployeeName = "Ruthu";
            employee.Department = "ComputerScience";
            employee.PhoneNumber = "7474362528";
            employee.Address = "Delhi";
            employee.Gender = 'F';
            employee.BasicPay = 12000.00M;
            employee.Deductions = 1500.00;


            employee.StartDate = Convert.ToDateTime("2020-11-03");

            //if (repo.AddEmployee(employee))
            //    Console.WriteLine("Records added successfully");
            repo.GetAllEmployee();
            Console.ReadKey();
        }
    }
}

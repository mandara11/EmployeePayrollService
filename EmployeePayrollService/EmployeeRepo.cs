using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeePayrollService
{
    public class EmployeeRepo
    {
        public static string connectionString = @"Data Source=(localdb)\ProjectModels;Initial Catalog=payroll_service;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"; //"Data Source=(localdb)\ProjectsV13;Initial Catalog=payroll_service;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        public bool GetAllEmployee()
        {
            try
            {
                EmployeeModel employeeModel = new EmployeeModel();
                using (this.connection)
                {
                    string query = @"Select * from employee_payroll1;";
                    SqlCommand cmd = new SqlCommand(query, this.connection);
                    this.connection.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            //employeeModel.EmployeeID = dr.GetInt32(0);
                            employeeModel.EmployeeID = Convert.ToInt32(dr["id"]);//dr.GetInt32(0);
                            employeeModel.EmployeeName = Convert.ToString(dr["name"]); //dr.GetString(1);
                                                                                       //employeeModel.PhoneNumber = dr.GetString(2);
                                                                                       //employeeModel.Address = dr.GetString(7);
                                                                                       //employeeModel.BasicPay = dr.GetDecimal(9);
                                                                                       //employeeModel.StartDate = dr.GetDateTime(11);
                                                                                       //employeeModel.Gender = Convert.ToChar(dr.GetString(5));
                                                                                       //employeeModel.PhoneNumber = dr.GetString(4);

                            //employeeModel.Department = dr.GetString(4);
                            //employeeModel.Deductions = dr.GetDouble(7);
                            //employeeModel.TaxablePay = dr.GetDouble(8);
                            //employeeModel.Tax = dr.GetDouble(9);
                            //employeeModel.NetPay = dr.GetDouble(10);
                            Console.WriteLine(employeeModel.EmployeeID + " " + employeeModel.EmployeeName);
                            //System.Console.WriteLine(employeeModel.EmployeeName+" "+employeeModel.BasicPay+ " "+employeeModel.StartDate +" "+ employeeModel.Gender+" "+ employeeModel.PhoneNumber+" "+employeeModel.Address+" "+ employeeModel.Department+" "+ employeeModel.Deductions+" "+ employeeModel.TaxablePay+" "+ employeeModel.Tax+" "+ employeeModel.NetPay);
                            System.Console.WriteLine("\n");
                        }
                    }
                    else
                    {
                        System.Console.WriteLine("No data found");
                        return false;
                    }
                    return true;
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e.Message);
                return false;
            }
        }

        public bool AddEmployee(EmployeeModel model)
        {
            try
            {
                using (this.connection)
                {
                    //var qury=values()
                    SqlCommand command = new SqlCommand("SpAddEmployeeDetails", this.connection);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmployeeName", model.EmployeeName);
                    command.Parameters.AddWithValue("@PhoneNumber", model.PhoneNumber);
                    command.Parameters.AddWithValue("@Address", model.Address);
                    command.Parameters.AddWithValue("@Department", model.Department);
                    command.Parameters.AddWithValue("@Gender", model.Gender);
                    command.Parameters.AddWithValue("@BasicPay", model.BasicPay);
                    command.Parameters.AddWithValue("@Deductions", model.Deductions);
                    command.Parameters.AddWithValue("@TaxablePay", model.TaxablePay);
                    command.Parameters.AddWithValue("@Tax", model.Tax);
                    command.Parameters.AddWithValue("@NetPay", model.NetPay);
                    command.Parameters.AddWithValue("@StartDate", DateTime.Now);
                    //command.Parameters.AddWithValue("@City", model.City);
                    //command.Parameters.AddWithValue("@Country", model.Country);
                    this.connection.Open();
                    var result = command.ExecuteNonQuery();
                    this.connection.Close();
                    if (result != 0)
                    {

                        return true;
                    }
                    return false;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                this.connection.Close();
            }
            return false;
        }

    }

}
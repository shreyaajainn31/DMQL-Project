using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace MusicDataStore
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            label1.Hide();
            //NpgsqlConnection con = new NpgsqlConnection("Server=localhost; Port =5432; Database=universitydb; User Id=postgres; Password=admin;");
            //con.Open();
            //NpgsqlCommand comm = new NpgsqlCommand();
            //comm.Connection = con;
            //comm.CommandType = CommandType.Text;
            //comm.CommandText = "Select * From department";
            //NpgsqlDataReader rd = comm.ExecuteReader();
            //if(rd.HasRows)
            //{
            //    DataTable dt = new DataTable();
            //    dt.Load(rd);
            //    dataGridView1.DataSource = dt;
            //}
            //comm.Dispose();
            //con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                NpgsqlConnection con = new NpgsqlConnection("Server=localhost; Port =5432; Database=public; User Id=postgres; Password=admin;");
                NpgsqlDataAdapter da;
                DataSet ds;
                string query = textBox1.Text;
                da = new NpgsqlDataAdapter(query, con);
                ds = new DataSet();
                da.Fill(ds);

                con.Close();
                if (ds.Tables.Count != 0 && ds.Tables[0].Rows.Count != 0)
                {
                    dataGridView1.Show();
                    dataGridView1.DataSource = ds.Tables[0];
                    label1.Show();
                    int n = ds.Tables[0].Rows.Count;
                    label1.Text = "Records found : " + n;

                }
                else
                {
                    dataGridView1.Hide();
                    MessageBox.Show("Table updated successfully...");
                    dataGridView1.DataSource = ds.Tables[0];
                    //dataGridView1.Update();
                    dataGridView1.Refresh();
                    //dataGridView1.DataSource = ds;
                }
            }
            catch
            {
                MessageBox.Show("Error in query. Please check the query");
            }
        }

        public void Form1_Load(object sender, EventArgs e)
        {
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            dataGridView1.Hide();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            textBox1.PlaceholderText = "Enter your query here";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            dataGridView1.DataSource = null;
            dataGridView1.Hide();
            label1.Hide();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}

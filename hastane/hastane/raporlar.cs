using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace hastane
{
    public partial class raporlar : Form
    {
        public raporlar()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Server=.;Database=Hastane;Integrated Security=true"); 
        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            Application.Exit(); 

        }
        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            anasayfa git = new anasayfa();
            git.Show();
            this.Hide();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "doktorunvan";//prosedürün adı 
            SqlDataAdapter dr=new SqlDataAdapter(komut);
           DataTable doldur = new DataTable();  
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;  
            baglanti.Close();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "doktordtuzmanlik";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastadtboy";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastayas";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
        private void button5_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "poluzman1";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
        private void button6_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "polyataksayisi";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
        private void button7_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastadoktor";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
        private void button8_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "poldoktor";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
        private void button9_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastarandevu";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
        private void button10_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastadoktorrandevu";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
            baglanti.Close();
        }
    }
}

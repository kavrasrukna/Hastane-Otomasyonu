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
    public partial class randevular : Form
    {
        public randevular()
        {
            InitializeComponent();
        }
        SqlConnection baglanti1 = new SqlConnection("Server=.;Database=Hastane;Integrated Security=true");
        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            anasayfa git = new anasayfa();
            git.Show();
            this.Hide();
        }

        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        public void listele() // metot tanımladık her yerde çağırabilmek için
        {
            // veri çekme,listeleme komutu
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "randevulistele";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); 
            dataGridView1.DataSource = dt; 
        }
        private void goster_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            listele();
        }

        private void gizle_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }
        private void btnekle_Click(object sender, EventArgs e)
        {
            // veri ekleme komutu

            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "randevuekle";
            baglanti1.Open();
            komut.Parameters.AddWithValue("hastano", txthastano.Text); 
            komut.Parameters.AddWithValue("polno", txtpoliklinikno.Text);
            komut.Parameters.AddWithValue("doktorno", txtdoktorno.Text);
            komut.Parameters.AddWithValue("randevutarih", dateTimePicker1.Value);
            komut.ExecuteNonQuery();
            baglanti1.Close();
            listele();
        }

        private void btnguncelle_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "randevuyenile";
            baglanti1.Open();
            komut.Parameters.AddWithValue("randevuno", txthastano.Tag);
            komut.Parameters.AddWithValue("hastano", txthastano.Text); 
            komut.Parameters.AddWithValue("polno", txtpoliklinikno.Text); 
            komut.Parameters.AddWithValue("doktorno", txtdoktorno.Text);
            komut.Parameters.AddWithValue("randevutarih", dateTimePicker1.Value);
            komut.ExecuteNonQuery();
            baglanti1.Close();
            listele();
        }

        private void btnsil_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "randevusilme";
            baglanti1.Open();
            komut.Parameters.AddWithValue("randevuno", randevuno.Text);
            komut.ExecuteNonQuery();
            baglanti1.Close();
            listele();
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txthastano.Tag = dataGridView1.CurrentRow.Cells[0].Value.ToString(); //[0] sütun numarası
            txthastano.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txtpoliklinikno.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            txtdoktorno.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            dateTimePicker1.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
        }

        private void azsirala_Click(object sender, EventArgs e)
        {
            //randevurtarihe göre asc sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "randevuaz";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); 
            dataGridView1.DataSource = dt;
        }

        private void zasirala_Click(object sender, EventArgs e)
        {
            //randevurtarihe göre desc sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "randevuza";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); 
            dataGridView1.DataSource = dt;
        }

        private void btnara_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            baglanti1.Open();
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;

            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "randevuarama";
           
            komut1.Parameters.AddWithValue("randevutarih", aranacakrandevutarih.Text); 

            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);
            DataTable dt = new DataTable();
            goruntule1.Fill(dt);
            dataGridView1.DataSource = dt;

            aranacakrandevutarih.Clear();  

            baglanti1.Close();
        }
    }
}

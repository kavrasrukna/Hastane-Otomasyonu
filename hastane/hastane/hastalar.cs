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
    public partial class hastalar : Form
    {
        public hastalar()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Server=.;Database=Hastane;Integrated Security=true"); 
                                                                                                          
        private void btnara_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            baglanti.Open();
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti;

            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "hastaarama";

            komut1.Parameters.AddWithValue("hastano", aranacakhastano.Text);
            komut1.Parameters.AddWithValue("hastaadsoyad", aranacakadsoyad.Text); 

            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView1.DataSource = dt;


            aranacakhastano.Clear();  //textboxlarımı temizler
            aranacakadsoyad.Clear();
            baglanti.Close();
        }

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

        private void gizle_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }

        private void goster_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            listele();
        }
        public void listele() // metot tanımladık her yerde çağırabilmek için
        {
            // veri çekme,listeleme komutu
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastalistele";
            SqlDataAdapter goruntule = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            goruntule.Fill(dt); 
            dataGridView1.DataSource = dt; 
        }
        private void btnekle_Click(object sender, EventArgs e)
        {
            // veri ekleme komutu
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastaekle";
            baglanti.Open();
            komut.Parameters.AddWithValue("hastaadsoyad", txtadsoyad.Text);
            komut.Parameters.AddWithValue("tcno", txttcno.Text); 
            komut.Parameters.AddWithValue("dogumtarihi", dateTime.Value);
            komut.Parameters.AddWithValue("boy", txtboy.Text);
            komut.Parameters.AddWithValue("yas", txtyas.Text);
            komut.Parameters.AddWithValue("recete", txtrecete.Text);
            komut.Parameters.AddWithValue("rapordurumu", txtrapor.Text);
            komut.Parameters.AddWithValue("doktorno", txtdoktorno.Text);
            komut.Parameters.AddWithValue("randevuid", txtrandevuid.Text);
            komut.ExecuteNonQuery();
            baglanti.Close();
            listele(); 
        }

        private void btnguncelle_Click(object sender, EventArgs e)
        {

            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastayenile";
            baglanti.Open();
            komut.Parameters.AddWithValue("hastano", txtadsoyad.Tag);
            komut.Parameters.AddWithValue("hastaadsoyad", txtadsoyad.Text);
            komut.Parameters.AddWithValue("tcno", txttcno.Text); 
            komut.Parameters.AddWithValue("dogumtarihi", dateTime.Value);
            komut.Parameters.AddWithValue("boy", txtboy.Text);
            komut.Parameters.AddWithValue("yas", txtyas.Text);
            komut.Parameters.AddWithValue("recete", txtrecete.Text);
            komut.Parameters.AddWithValue("rapordurumu", txtrapor.Text);
            komut.Parameters.AddWithValue("doktorno", txtdoktorno.Text);
            komut.Parameters.AddWithValue("randevuid", txtrandevuid.Text);
            komut.ExecuteNonQuery();
            baglanti.Close();
            listele();
        }

        private void btnsil_Click(object sender, EventArgs e)
        {
            //veri silme işlemi
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "hastasilme11"; 
            baglanti.Open();
            komut.Parameters.AddWithValue("hastano", txthastasil.Text);
            komut.ExecuteNonQuery();
            baglanti.Close();
            listele();
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtadsoyad.Tag = dataGridView1.CurrentRow.Cells[0].Value.ToString();//[0] sütun numarası     
            txtadsoyad.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString(); 
            txttcno.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();                                                              
            dateTime.Value = Convert.ToDateTime(dataGridView1.CurrentRow.Cells[3].Value);
            txtboy.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString(); 
            txtyas.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString(); 
            txtrecete.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString(); 
            txtrapor.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString(); 
            txtdoktorno.Text = dataGridView1.CurrentRow.Cells[8].Value.ToString();
            txtrandevuid.Text = dataGridView1.CurrentRow.Cells[9].Value.ToString();
        }

        private void hastalar_Load(object sender, EventArgs e)
        {

        }
        private void azsirala_Click(object sender, EventArgs e)
        {//hastanoya göre asc sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "hastaaz";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); 
            dataGridView1.DataSource = dt;
        }

        private void zasirala_Click(object sender, EventArgs e)
        {//hastanoya göre desc sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "hastaza";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);
            DataTable dt = new DataTable();
            goruntule1.Fill(dt);
            dataGridView1.DataSource = dt;
        }
    }
}

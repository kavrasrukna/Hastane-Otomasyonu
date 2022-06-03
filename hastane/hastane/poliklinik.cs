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
    public partial class poliklinik : Form
    {
        public poliklinik()
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
            komut1.CommandText = "polikliniklistele";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView1.DataSource = dt; //gösterir
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            poliklinikadi.Tag = dataGridView1.CurrentRow.Cells[0].Value.ToString(); //[0] sütun numarası
            poliklinikadi.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString(); //[0] sütun numarası
            poliklinikuzmansayisi.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();                                                                  
            poliklinikbaskan.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString(); 
            poliklinikbashemsire.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString(); 
            yataksayisi.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString(); 
           
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
            komut.CommandText = "poliklinikekle";//prosedürün adı her defasında bak doğru mu
            baglanti1.Open();
            komut.Parameters.AddWithValue("poladi", poliklinikadi.Text);// addwithvalue:değeriyle beraber ekle  demek
            komut.Parameters.AddWithValue("poluzmansayisi", poliklinikuzmansayisi.Text); //yas,maas,adres bunlar sql tablomdaki kolonlarla aynı adda olmalı
            komut.Parameters.AddWithValue("polbaskan", poliklinikbaskan.Text); //prosedürdeki alanlar ""
            komut.Parameters.AddWithValue("polbashemsire", poliklinikbashemsire.Text);
            komut.Parameters.AddWithValue("yataksayisi", yataksayisi.Text);
            komut.ExecuteNonQuery();//kaydet
            baglanti1.Close();
            listele(); //ekledikten sonra veritabanında görüntüle demeden gösterir
        }

        private void poliklinik_Load(object sender, EventArgs e)
        {
            
        }

        private void btnguncelle_Click(object sender, EventArgs e)
        {
           
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "poliklinikyenile";//prosedürün adı her defasında bak doğru mu
            baglanti1.Open();
            komut.Parameters.AddWithValue("polno", poliklinikadi.Tag);
            komut.Parameters.AddWithValue("poladi", poliklinikadi.Text);// addwithvalue:değeriyle beraber ekle  demek
            komut.Parameters.AddWithValue("poluzmansayisi", poliklinikuzmansayisi.Text); //yas,maas,adres bunlar sql tablomdaki kolonlarla aynı adda olmalı
            komut.Parameters.AddWithValue("polbaskan", poliklinikbaskan.Text); //prosedürdeki alanlar ""
            komut.Parameters.AddWithValue("polbashemsire", poliklinikbashemsire.Text);
            komut.Parameters.AddWithValue("yataksayisi", yataksayisi.Text);
            komut.ExecuteNonQuery();//kaydet
            baglanti1.Close();
            listele();
        }

        private void btnsil_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "polikliniksilme"; //prosedürün adı
            baglanti1.Open();
            komut.Parameters.AddWithValue("polno", silinecekno.Text);
            komut.ExecuteNonQuery();//kaydet
            baglanti1.Close();
            listele();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void azsirala_Click(object sender, EventArgs e)
        {
            //poladına göre sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "polaz";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView1.DataSource = dt;
        }

        private void zasirala_Click(object sender, EventArgs e)
        {
            //poladına göre sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "polza";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView1.DataSource = dt;
        }

        private void btnara_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;  
            baglanti1.Open();   
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
           
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "polarama";
           
         
            komut1.Parameters.AddWithValue("poladi", aranacakpoliklinikadi.Text); //polno poladi tablodaki kolnlarımın adı

            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView1.DataSource = dt;

         
            aranacakpoliklinikadi.Clear();  //textboxlarımı temizler

            baglanti1.Close();
        }
    }
}

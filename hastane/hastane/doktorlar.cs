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
    public partial class doktorlar : Form
    {
        public doktorlar()
        {
            InitializeComponent();
        }
        SqlConnection baglanti1 = new SqlConnection("Server=.;Database=Hastane;Integrated Security=true");
        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            anasayfa git = new anasayfa();
            git.Show();
            this.Hide();
        }
        public void listele() // metot tanımladık her yerde çağırabilmek için
        {
            // veri çekme,listeleme komutu
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "doktorlistele";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView2.DataSource = dt; //datagriddde gösterir
        }
        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnekle_Click(object sender, EventArgs e)
        {
            // veri ekleme komutu
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "doktorekle";//prosedürünadı
            baglanti1.Open();
           
            komut.Parameters.AddWithValue("doktoradsoyad", dradsoyad.Text);
            komut.Parameters.AddWithValue("tc", drtc.Text); 
            komut.Parameters.AddWithValue("uzmanlikalani", druzmanlik.Text); 
            komut.Parameters.AddWithValue("unvani", drunvan.Text);
            komut.Parameters.AddWithValue("telefon", drtel.Text);
            komut.Parameters.AddWithValue("adres", dradres.Text);
            komut.Parameters.AddWithValue("dogumtarihi", dateTimePicker1.Value);
            komut.Parameters.AddWithValue("polno", drpolno.Text);
            komut.ExecuteNonQuery();
            baglanti1.Close();
            listele(); //ekledikten sonra veritabanında görüntüle demeden gösterir
        }

        private void btnguncelle_Click(object sender, EventArgs e)
        {

            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "doktoryenile";
            baglanti1.Open();
            komut.Parameters.AddWithValue("doktorno", dradsoyad.Tag);
            komut.Parameters.AddWithValue("doktoradsoyad",dradsoyad.Text);
            komut.Parameters.AddWithValue("tc",drtc.Text); 
            komut.Parameters.AddWithValue("uzmanlikalani",druzmanlik.Text);
            komut.Parameters.AddWithValue("unvani",drunvan.Text);
            komut.Parameters.AddWithValue("telefon",drtel.Text);
            komut.Parameters.AddWithValue("adres",dradres.Text);
            komut.Parameters.AddWithValue("dogumtarihi",dateTimePicker1.Value);
            komut.Parameters.AddWithValue("polno",drpolno.Text);
            komut.ExecuteNonQuery();
            baglanti1.Close();
            listele();
        }

        private void goster_Click(object sender, EventArgs e)
        {
            dataGridView2.Visible = true;
            listele();
        }

        private void gizle_Click(object sender, EventArgs e)
        {
            dataGridView2.Visible = false;
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            dradsoyad.Tag = dataGridView2.CurrentRow.Cells[0].Value.ToString();//[0] sütun numarası
            dradsoyad.Text = dataGridView2.CurrentRow.Cells[1].Value.ToString(); 
            drtc.Text = dataGridView2.CurrentRow.Cells[2].Value.ToString();                                                                  
            druzmanlik.Text = dataGridView2.CurrentRow.Cells[3].Value.ToString(); 
            drunvan.Text = dataGridView2.CurrentRow.Cells[4].Value.ToString();
            drtel.Text = dataGridView2.CurrentRow.Cells[5].Value.ToString();
            dradres.Text = dataGridView2.CurrentRow.Cells[6].Value.ToString(); 
            dateTimePicker1.Text = dataGridView2.CurrentRow.Cells[7].Value.ToString(); 
            drpolno.Text = dataGridView2.CurrentRow.Cells[8].Value.ToString();
        }

        private void dradres_TextChanged(object sender, EventArgs e)
        {
            //TextBox'ımızı çok satırlı veri girebileciğimiz hale getirir. Fakat scroolbar gözükmez.
            dradres.Multiline = true;

            //TextBox içine yazılan yazının boyutu TextBox boyutundan büyükse bir alt satıra indirme işlevi kazandırır.
            dradres.WordWrap = true;

            //TextBox'ımızda bir scroolbar gözükmesini sağlar. 3 tip kullanımı vardır.
            //Horizontal (yatay), Vertical (dikey) ve Both (her iki) yönde scroolbar sunar. 
            dradres.ScrollBars = ScrollBars.Both;

            //TextBox'ımızı boyutlandırma.
            dradres.Width = 200;
            dradres.Height = 50;
        }

        private void btnsil_Click(object sender, EventArgs e)
        {
            //veri silme işlemi
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti1;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "doktorsilme"; //prosedürün adı
            baglanti1.Open();
            komut.Parameters.AddWithValue("doktorno", silinecekdrno.Text);
            komut.ExecuteNonQuery();
            baglanti1.Close();
            listele();
        }
        private void azsirala_Click(object sender, EventArgs e)
        {//uzmanlıkalanına göre asc sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "doktoraz";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView2.DataSource = dt;
        }

        private void zasirala_Click(object sender, EventArgs e)
        {//uzmanlıkalanına göre desc sıralama yapıyor
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;
            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "doktorza";
            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView2.DataSource = dt;
        }

        private void btnara_Click(object sender, EventArgs e)
        {
            dataGridView2.Visible = true;
            baglanti1.Open();
            SqlCommand komut1 = new SqlCommand();
            komut1.Connection = baglanti1;

            komut1.CommandType = CommandType.StoredProcedure;
            komut1.CommandText = "doktorarama";

            komut1.Parameters.AddWithValue("doktoradsoyad", aranacakdradsoyad.Text);
            komut1.Parameters.AddWithValue("uzmanlikalani", aranacakdruzmanlik.Text); 

            SqlDataAdapter goruntule1 = new SqlDataAdapter(komut1);//verileri al
            DataTable dt = new DataTable();
            goruntule1.Fill(dt); // içini doldur
            dataGridView2.DataSource = dt;

            aranacakdradsoyad.Clear();  //textboxlarımı temizler
            aranacakdruzmanlik.Clear();
            baglanti1.Close();
        }
    }
}

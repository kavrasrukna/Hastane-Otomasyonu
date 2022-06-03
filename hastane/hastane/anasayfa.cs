using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace hastane
{
    public partial class anasayfa : Form
    {
        public anasayfa()
        {
            InitializeComponent();
        }

        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            anasayfa git = new anasayfa();
            git.Show();
            this.Hide();
        }

        private void btnhastalar_Click(object sender, EventArgs e)
        {
            hastalar git = new hastalar();
            git.Show();
            this.Hide();
        }

        private void btndoktorlar_Click(object sender, EventArgs e)
        {
            doktorlar git = new doktorlar();
            git.Show();
            this.Hide();
        }

        private void btnpoliklinikler_Click(object sender, EventArgs e)
        {
            poliklinik git = new poliklinik();
            git.Show();
            this.Hide();
        }

        private void btnrandevular_Click(object sender, EventArgs e)
        {
            randevular git = new randevular();
            git.Show();
            this.Hide();
        }

        private void btnraporlar_Click(object sender, EventArgs e)
        {
            raporlar git = new raporlar();
            git.Show();
            this.Hide();
        }
    }
}

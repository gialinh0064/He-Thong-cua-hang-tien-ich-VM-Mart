﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BaiNhom
{
    public partial class QLCHTL : Form
    {
        public QLCHTL()
        {
            InitializeComponent();
        }

        private void btNCC_Click(object sender, EventArgs e)
        {
            QLNCC f = new QLNCC();
            f.ShowDialog();
        }

        private void QLCHTL_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn chắc chắn muốn thoát chương trình?", "Cảnh báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.No)
                e.Cancel = true;
        }
    }
}

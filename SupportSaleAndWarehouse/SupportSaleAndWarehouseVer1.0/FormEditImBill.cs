﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SupportSaleAndWarehouseVer1._0.FrameWork;
using SupportSaleAndWarehouseVer1._0.Function;


namespace SupportSaleAndWarehouseVer1._0
{
    public partial class FormEditImBill : Form
    {

        WareHouseDbContext db = new WareHouseDbContext();
        List<ProductDetail> lprodt;
        List<Product> lpro;
        public int IDImBill;
        public FormEditImBill(int ID, string Bill)
        {
            InitializeComponent();
            IDImBill = ID;
            txtBillName.Text = Bill;
        }

        private void FormEditImBill_Load(object sender, EventArgs e)
        {
            Binding_CbWH();
            Load_CbPro();
            lprodt = new List<ProductDetail>();
            lpro = new List<Product>();
            btnEdit.Enabled = false;
            btnAddPro.Enabled = false;
            Binding_list();
            Binding_dgrvPro();
        }


        private void Binding_CbWH()
        {
          
        }
        private void Load_CbPro()
        {
           
        }

        
        public void Binding_list()
        {
           
        }

        private void SumPriceAndQuantity()
        {
            
        }

        private void Binding_dgrvPro()
        {
            
        }

       

        private void btnAddPro_Click_1(object sender, EventArgs e)
        {
            
        }

        private void btnDeletePro_Click_1(object sender, EventArgs e)
        {

           

        }

        private void btnEdit_Click_1(object sender, EventArgs e)
        {

           


        }

        private void btnRefresh_Click_1(object sender, EventArgs e)
        {


        }

        private void btnCancle_Click_1(object sender, EventArgs e)
        {

           

        }

        private void txtBillName_TextChanged_1(object sender, EventArgs e)
        {
           
        }

        private void numeric_ValueChanged_1(object sender, EventArgs e)
        {
            
        }
    }
}

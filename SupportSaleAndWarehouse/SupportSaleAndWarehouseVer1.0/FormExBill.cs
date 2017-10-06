using System;
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
    public partial class FormExBill : Form
    {
       
        public FormExBill()
        {
            InitializeComponent();
        }
        private void FormExBill_Load(object sender, EventArgs e)
        {
            Binding_CbWH();
            Load_CbPro();
            lprodt = new List<ProductDetail>();
            lpro = new List<Product>();
            btnAdd.Enabled = false;
            btnAddPro.Enabled = false;
        }

        private void Binding_CbWH()
        {
            List<WareHouse> lwh = (from wh in db.WareHouses select wh).ToList();
            cbWH.DataSource = lwh;
            cbWH.DisplayMember = "Warehouse";
            cbWH.ValueMember = "ID";

        }
        private void Load_CbPro()
        {
            List<Product> list = (from pro in db.Products select pro).ToList();
            cbPro.DataSource = list;
            cbPro.DisplayMember = "Product1";
            cbPro.ValueMember = "ID";
        }
        private void SumPriceAndQuantity()
        {
            var list = (from item1 in lpro
                        join item2 in lprodt
                        on item1.ID equals item2.IDProduct
                        orderby item1.ID
                        select new
                        {
                            Product1 = item1.Product1,
                            Quantity = item2.Quantity,
                            OrdinaryPrice = item1.OrdinaryPrice
                        }).ToList();
            var listPrice = (from item in list
                             select new
                             {
                                 Money = item.Quantity * item.OrdinaryPrice
                             }
                             ).ToList();
            var sumPrice = listPrice.Sum(x => x.Money);
            var sumQuantity = list.Sum(x => x.Quantity);
            txtMoney.Text = sumPrice.ToString();
            txtQuantity.Text = sumQuantity.ToString();
        }

        private void Load_dgrvPro()
        {
           
        }


        private void btnAddPro_Click(object sender, EventArgs e)
        {
           
        }

        private void btnDeletePro_Click(object sender, EventArgs e)
        {
            
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
          
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            
        }

        private void btnCancle_Click(object sender, EventArgs e)
        {
           
        }

        private void txtBillName_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void numeric_ValueChanged(object sender, EventArgs e)
        {
            
        }
    }
}

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
    public partial class FormEditExBill : Form
    {
        WareHouseDbContext db = new WareHouseDbContext();
        List<ProductDetail> lprodt;
        List<Product> lpro;
        public int IDExBill;
        public FormEditExBill(int ID, string Bill)
        {
            InitializeComponent();
            IDExBill = ID;
            txtBillName.Text = Bill;
        }

        private void FormEditExBill_Load(object sender, EventArgs e)
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

        public void Binding_list()
        {
            var listolder = (from dt in db.ProductDetails.Where(x => x.IDExBill == IDExBill).ToList()
                             from pr in db.Products.Where(x => x.ID == dt.IDProduct).ToList()
                             from com in db.Companies.Where(x => x.ID == pr.IDCompany).ToList()
                             select new
                             {
                                 IDProductDetail = dt.ID,
                                 ID = pr.ID,
                                 Product1 = pr.Product1,
                                 Quantity = dt.Quantity,
                                 OrdinaryPrice = pr.OrdinaryPrice
                             }
                            ).ToList();
            foreach (var item in listolder)
            {
                var search1 = lpro.Find(x => x.ID == item.ID);
                if (search1 == null)
                {
                    ProductDetail entity = new ProductDetail();
                    entity.ID = 1;
                    entity.IDExBill = IDExBill;
                    entity.Quantity = item.Quantity;
                    entity.IDProduct = item.ID;

                    // var ID = Convert.ToInt32(cbPro.SelectedValue.ToString());
                    lprodt.Add(entity);

                    Product pro = db.Products.Where(x => x.ID == item.ID).SingleOrDefault();
                    lpro.Add(pro);
                }
                else
                {
                    foreach (var dt in lprodt.Where(x => x.IDProduct == item.ID))
                    {
                        dt.Quantity = dt.Quantity + item.Quantity;
                    }
                }

            }
        }

        private void SumPriceAndQuantity()
        {
            
        }

        private void Binding_dgrvPro()
        {
           
        }

        private void btnAddPro_Click(object sender, EventArgs e)
        {
           
        }

        private void btnDeletePro_Click(object sender, EventArgs e)
        {
           
        }

        private void btnEdit_Click(object sender, EventArgs e)
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

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
using System.Reflection;

namespace SupportSaleAndWarehouseVer1._0
{
    public partial class FormMain : Form
    {
        WareHouseDbContext db = new WareHouseDbContext();
        public FormMain()
        {
            InitializeComponent();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            Binding_CbWHImSearch();
            Binding_CbWHExSearch();
            BindingWarehouse();
            Binding_dgrDetailWH();
            Load_CbCom();
            Load_CbCompany();
            Load_TabProduct();
            BindingdgrvIm();
            BindingdgrvEx();




        }
        #region Tab WareHouse
        #region Datagridview Warehouse
        public void BindingWarehouse()
        {
            dgrvWH.Refresh();
            dgrvWH.DataSource = null;
            txtIDWH.Enabled = false;
            List<WareHouse> list = (from wh in db.WareHouses select wh).ToList();

            dgrvWH.AutoGenerateColumns = false;

            dgrvWH.ColumnCount = 5;
            dgrvWH.Columns[0].Name = "ID";
            dgrvWH.Columns[0].HeaderText = "ID";
            dgrvWH.Columns[0].DataPropertyName = "ID";

            dgrvWH.Columns[1].Name = "Warehouse";
            dgrvWH.Columns[1].HeaderText = "Tên kho";
            dgrvWH.Columns[1].DataPropertyName = "Warehouse";


            dgrvWH.Columns[2].Name = "Location";
            dgrvWH.Columns[2].HeaderText = "Địa chỉ";
            dgrvWH.Columns[2].DataPropertyName = "Location";

            dgrvWH.Columns[3].Name = "Quantity";
            dgrvWH.Columns[3].HeaderText = "Đã chứa";
            dgrvWH.Columns[3].DataPropertyName = "Quantity";

            dgrvWH.Columns[4].Name = "Capacity";
            dgrvWH.Columns[4].HeaderText = "Sức chứa";
            dgrvWH.Columns[4].DataPropertyName = "Capacity";
            dgrvWH.DataSource = list;

            txtIDWH.Text = dgrvWH.CurrentRow.Cells["ID"].Value.ToString();
            txtLocationWH.Text = dgrvWH.CurrentRow.Cells["Location"].Value.ToString();
            txtWH.Text = dgrvWH.CurrentRow.Cells["Warehouse"].Value.ToString();
            txtCapacityWH.Text = dgrvWH.CurrentRow.Cells["Capacity"].Value.ToString();
            txtQuantityWH.Text = dgrvWH.CurrentRow.Cells["Quantity"].Value.ToString();
        }
    }
}

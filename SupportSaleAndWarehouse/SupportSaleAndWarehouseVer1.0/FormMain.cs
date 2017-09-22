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
         




        }
        #region Tab WareHouse
        #region Datagridview Warehouse
        public void BindingWarehouse()
        {
            
        }

        public void Binding_dgrDetailWH()
        {
            
        }
        private void dgrvWH_MouseClick(object sender, MouseEventArgs e)
        {
           
        }
        #region Button WH
        private void Add_Condition()
        {
            if (txtCapacityWH.Text == "" || txtIDWH.Text == "" || txtLocationWH.Text == "" || txtQuantityWH.Text == "" || txtWH.Text == "")
            {
                btnAddWH.Enabled = false;
            }
            else
            {
                btnAddWH.Enabled = true;
            }
        }
        private void btnAddWH_Click(object sender, EventArgs e)
        {
            WareHouse entity = new WareHouse();
            entity.ID = Convert.ToInt32(txtIDWH.Text.ToString());
            entity.Location = txtLocationWH.Text;
            entity.Quantity = Convert.ToInt32(txtQuantityWH.Text.ToString());
            entity.Capacity = Convert.ToInt32(txtCapacityWH.Text.ToString());
            entity.Warehouse = txtWH.Text;
            FWareHouse fWareHouse = new FWareHouse();
            fWareHouse.Insert(entity);

            BindingWarehouse();

        }

        private void btnRefreshWH_Click(object sender, EventArgs e)
        {

            txtLocationWH.Text = "";
            txtWH.Text = "";
            txtCapacityWH.Text = "";
            txtQuantityWH.Text = "";
        }

        private void btnDeleteWH_Click(object sender, EventArgs e)
        {
            FWareHouse fWareHouse = new FWareHouse();
            var ID = Convert.ToInt32(dgrvWH.CurrentRow.Cells["ID"].Value.ToString());
            fWareHouse.Delete(ID);
            BindingWarehouse();
        }
        private void btnEditWH_Click(object sender, EventArgs e)
        {
            WareHouse entity = new WareHouse();
            entity.ID = Convert.ToInt32(txtIDWH.Text.ToString());
            entity.Location = txtLocationWH.Text;
            entity.Quantity = Convert.ToInt32(txtQuantityWH.Text.ToString());
            entity.Capacity = Convert.ToInt32(txtCapacityWH.Text.ToString());
            entity.Warehouse = txtWH.Text;
            FWareHouse fWareHouse = new FWareHouse();
            fWareHouse.Update(entity);
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


        private void txtWH_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtWH.Text) | string.IsNullOrWhiteSpace(txtIDWH.Text) | string.IsNullOrWhiteSpace(txtLocationWH.Text) | string.IsNullOrWhiteSpace(txtQuantityWH.Text) | string.IsNullOrWhiteSpace(txtCapacityWH.Text))
            {
                btnAddWH.Enabled = false;
            }
            else
            {
                btnAddWH.Enabled = true;
            }
        }

        private void txtIDWH_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtWH.Text) | string.IsNullOrWhiteSpace(txtIDWH.Text) | string.IsNullOrWhiteSpace(txtLocationWH.Text) | string.IsNullOrWhiteSpace(txtQuantityWH.Text) | string.IsNullOrWhiteSpace(txtCapacityWH.Text))
            {
                btnAddWH.Enabled = false;
            }
            else
            {
                btnAddWH.Enabled = true;
            }
        }

        private void txtLocation_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtWH.Text) | string.IsNullOrWhiteSpace(txtIDWH.Text) | string.IsNullOrWhiteSpace(txtLocationWH.Text) | string.IsNullOrWhiteSpace(txtQuantityWH.Text) | string.IsNullOrWhiteSpace(txtCapacityWH.Text))
            {
                btnAddWH.Enabled = false;
            }
            else
            {
                btnAddWH.Enabled = true;
            }
        }

        private void txtCapacity_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtWH.Text) | string.IsNullOrWhiteSpace(txtIDWH.Text) | string.IsNullOrWhiteSpace(txtLocationWH.Text) | string.IsNullOrWhiteSpace(txtQuantityWH.Text) | string.IsNullOrWhiteSpace(txtCapacityWH.Text))
            {
                btnAddWH.Enabled = false;
            }
            else
            {
                btnAddWH.Enabled = true;
            }
        }

        private void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtWH.Text) | string.IsNullOrWhiteSpace(txtIDWH.Text) | string.IsNullOrWhiteSpace(txtLocationWH.Text) | string.IsNullOrWhiteSpace(txtQuantityWH.Text) | string.IsNullOrWhiteSpace(txtCapacityWH.Text))
            {
                btnAddWH.Enabled = false;
            }
            else
            {
                btnAddWH.Enabled = true;
            }
        }

        private void txtCapacity_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            //if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            //{
            //    e.Handled = true;
            //}
        }

        private void txtQuantity_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        #endregion
        #endregion


        private void btnDeleteDTWH_Click(object sender, EventArgs e)
        {
            
        }

        private void btnAddPro_Click(object sender, EventArgs e)
        {
           
        }

        private void button6_Click(object sender, EventArgs e)
        {
            
        }
        #endregion

        #region Tab Product

        public void Load_TabProduct()
        {

           

        }
        public void BindingdgrvProduct()
        {
           
        }

        public void Load_CbCom()
        {
           
        }
        public void Load_CbCompany()
        {
            
        }
        public void dgrvProduct_MouseClick(object sender, MouseEventArgs e)
        {
            
        }
        private void cbCom_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void btnAddProduct_Click(object sender, EventArgs e)
        {
           
        }

        private void btnRefreshPro_Click(object sender, EventArgs e)
        {
            
        }

        private void btnEditPro_Click(object sender, EventArgs e)
        {
           

        }

        private void btnDeletePro_Click(object sender, EventArgs e)
        {
            
        }
        private void txtOrdinaryPrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void txtPrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void txtPro_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtOrdinaryPrice_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtPrice_TextChanged(object sender, EventArgs e)
        {
           
        }


        #endregion
        #region Tab Import Bill
        public void Binding_CbWHImSearch()
        {
           
        }
        public void BindingdgrvIm()
        {
            

        }

        public void Binding_dgrvDTIm()
        {
            
        }

        private void dgrvIm_MouseClick(object sender, MouseEventArgs e)
        {
            
        }

        private void cbWHImSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void btnAddIm_Click(object sender, EventArgs e)
        {
            
        }
        private void btnRefreshIm_Click(object sender, EventArgs e)
        {
            
        }

        private void btnEditIm_Click(object sender, EventArgs e)
        {
            
        }

        private void btnDeleteIm_Click(object sender, EventArgs e)
        {
            
        }

        private void txtIDIm_TextChanged(object sender, EventArgs e)
        {
            
        }

        #endregion
        #region Export Bill
        public void Binding_CbWHExSearch()
        {
            
        }
        public void BindingdgrvEx()
        {
            

        }

        public void Binding_dgrvDTEx()
        {
            
        }

       

        private void dgrvEx_MouseClick(object sender, MouseEventArgs e)
        {

           


        }

        private void btnAddEx_Click(object sender, EventArgs e)
        {
           
        }

        private void btnRefreshEx_Click(object sender, EventArgs e)
        {
           
        }

        private void btnEditEx_Click(object sender, EventArgs e)
        {
            
        }

        private void btnDeleteEx_Click(object sender, EventArgs e)
        {
            
        }

        private void txtIDEx_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void cbWHExSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        #endregion
    }
}

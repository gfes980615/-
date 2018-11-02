using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace web_class1
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            drinkDetailsView.DataBind();
            userShowLB.Text = Session["name"] + "歡迎光臨<br>你的餘額剩" + Session["money"];
            if (!IsPostBack)
            {
                drinkPrice.Text = "";
                drinkNumber.Text = "";
                drinkImage.ImageUrl = "./pic/未選取" + ".jpg";
                for (int i = 0; i < 50; i++)
                {
                    cupList.Items.Insert(i, new ListItem("" + (i + 1), "" + (i + 1)));
                }
                cupList.SelectedIndex = 0;
            }
           
        }

        protected void drinkList_SelectedIndexChanged(object sender, EventArgs e)
        {
            drinkImage.ImageUrl = "./pic/" + drinkList.SelectedItem.Text.ToString() + ".jpg";
            if(drinkList.SelectedIndex == 0)
            {
                drinkPrice.Text = "";
                drinkNumber.Text = "";
                cubBT.Enabled = false;
            }
            else
            {
                drinkPrice.Text = drinkDetailsView.Rows[0].Cells[1].Text + " 元";
                drinkNumber.Text = "\t庫存: " + drinkDetailsView.Rows[1].Cells[1].Text +" 個";
                cubBT.Enabled = true;
            }
        }

        protected void orderBT_Click(object sender, EventArgs e)
        {
            drinkDataSelect.Insert();

            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\clientData.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderCmd = new SqlCommand("select top 1 order_id from [orderTable] order by order_id Desc", orderCon);
            SqlDataReader orderDr;
            orderDr = orderCmd.ExecuteReader();
            if (orderDr.Read())
            {
                Session["order_id"] = orderDr["order_id"]; 
                orderBT.Text = orderDr["order_id"] + "號訂單";
                orderBT.Enabled = false;

                cupLB.Visible = true;
                cupList.Visible = true;
                sweetList.Visible = true;
                iceList.Visible = true;
                cubBT.Visible = true;
            }

        }

        protected void reTB_Click(object sender, EventArgs e)
        {
            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\clientData.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderTableTurncateCmd = new SqlCommand("truncate table orderTable", orderCon);
            orderTableTurncateCmd.ExecuteNonQuery();
            SqlCommand orderItemTableTurncateCmd = new SqlCommand("truncate table orderItemTable", orderCon);
            orderItemTableTurncateCmd.ExecuteNonQuery();
            orderBT.Text = "前往訂購";
            orderBT.Enabled = true;


            cupLB.Visible = false;
            cupList.Visible = false;
            sweetList.Visible = false;
            iceList.Visible = false;
            cubBT.Visible = false;
            orderItemGridView.Visible = false;
        }

        protected void cupList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cubBT_Click(object sender, EventArgs e)
        {
            orderItemDataSource.Insert();

            if(!orderItemGridView.Visible)
            {
                orderItemGridView.Visible = true;
            }
        }
    }
}
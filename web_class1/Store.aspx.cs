using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_class1
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            drinkDetailsView.DataBind();
            userShowLB.Text = Session["name"] + "歡迎光臨<br>你的餘額剩" + Session["money"];
            drinkPrice.Text = "";
            drinkNumber.Text = "";
            drinkImage.ImageUrl = "./pic/未選取" + ".jpg";
        }

        protected void drinkList_SelectedIndexChanged(object sender, EventArgs e)
        {
            drinkImage.ImageUrl = "./pic/" + drinkList.SelectedItem.Text.ToString() + ".jpg";
            if(drinkList.SelectedIndex == 0)
            {
                drinkPrice.Text = "";
                drinkNumber.Text = "";
            }
            else
            {
                drinkPrice.Text = drinkDetailsView.Rows[0].Cells[1].Text + " 元";
                drinkNumber.Text = "\t庫存: " + drinkDetailsView.Rows[1].Cells[1].Text +" 個";
            }
        }
    }
}
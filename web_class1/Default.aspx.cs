using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_class1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clientDetailView.DataBind();
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            clientDetailView.Visible = false;
            entry.Visible = false;
            if(clientDetailView.DataItemCount == 1)
            {
                Session["name"] = clientDetailView.Rows[0].Cells[1].Text;
                Session["money"] = clientDetailView.Rows[1].Cells[1].Text;
                Session["phone"] = clientDetailView.Rows[2].Cells[1].Text;
                entry.Visible = true;
            }
            else
            {
                Session["name"] = null;
                Session["money"] = null;
                Session["phone"] = null;
                clientDetailView.Visible = true;
            }
        }
    }
}
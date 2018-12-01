using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core;

namespace ChipsAnalysis
{
    public partial class GraphicsCard : System.Web.UI.Page
    {
        protected business b;
        protected void Page_Load(object sender, EventArgs e)
        {
            b = new business();
            if (!IsPostBack)
                DataBind();
        }

        protected void Update_Click(object sender, EventArgs e)
        {

            int index = Convert.ToInt32((sender as Button).CommandArgument);

            Label priceLabel = GridView1.Rows[index].FindControl("PriceLabel") as Label;
            TextBox priceTextBox = GridView1.Rows[index].FindControl("PriceTextBox") as TextBox;
            Button updateButton = GridView1.Rows[index].FindControl("Update") as Button;
            Button editButton = GridView1.Rows[index].FindControl("Edit") as Button;
            Button cancelButton = GridView1.Rows[index].FindControl("Cancel") as Button;

            updateButton.Visible = priceTextBox.Visible = cancelButton.Visible = false;
            editButton.Visible = priceLabel.Visible = true;

            if (priceTextBox.Text == null || priceTextBox.Text.Trim() == "")
                return;
            int id = int.Parse(GridView1.DataKeys[index].Value.ToString());

            float price = Convert.ToSingle(priceTextBox.Text);
            double costPerformance = Math.Round(Convert.ToInt32(GridView1.Rows[index].Cells[5].Text) / price, 4);
            //Response.Write(costPerformance);

            b.UpdatePriceandPerformance("Graphics", id, price, costPerformance);
            DataBind();

        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            ShowButton(sender, true);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            ShowButton(sender, false);
        }

        protected void ShowButton(object sender, bool isShow)
        {
            int index = Convert.ToInt32((sender as Button).CommandArgument);

            Label priceLabel = GridView1.Rows[index].FindControl("PriceLabel") as Label;
            TextBox priceTextBox = GridView1.Rows[index].FindControl("PriceTextBox") as TextBox;
            Button updateButton = GridView1.Rows[index].FindControl("Update") as Button;
            Button editButton = GridView1.Rows[index].FindControl("Edit") as Button;
            Button cancelButton = GridView1.Rows[index].FindControl("Cancel") as Button;

            updateButton.Visible = priceTextBox.Visible = cancelButton.Visible = isShow;
            editButton.Visible = priceLabel.Visible = !isShow;

            if (isShow)
                priceTextBox.Text = priceLabel.Text;
        }
    }
}
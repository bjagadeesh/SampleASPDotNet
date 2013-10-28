using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SampleWebApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGridView();
            }
        }

        protected void DealerMenu_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox activeCheckBox = (CheckBox)e.Row.FindControl("activeCheckBox");
                    TextBox activationDate = (TextBox)e.Row.FindControl("activationDateTextbox");

                    if (activationDate.Text.ToString().Trim() != String.Empty) activeCheckBox.Checked = true;
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gRow in this.DealerMenu.Rows)
                {
                    CheckBox activeCheckBox = (CheckBox)gRow.FindControl("activeCheckBox");
                    CheckBox eRatingCheckBox = (CheckBox)gRow.FindControl("eRatingCheckBox");
                    CheckBox eContractingCheckBox = (CheckBox)gRow.FindControl("eContractingCheckBox");
                    TextBox activationdate = (TextBox)gRow.FindControl("activationDateTextbox");
                    HiddenField dealerID = (HiddenField)gRow.FindControl("dealerID");
                    HiddenField menuCode = (HiddenField)gRow.FindControl("menucode");

                    DealerMenu dm = new DealerMenu();
                    dm.DealerID = dealerID.Value.ToString();
                    dm.MenuCode = menuCode.Value.ToString();
                    dm.ActivationDate = activationdate.Text.ToString();
                    dm.eRating = eRatingCheckBox.Checked.ToString();
                    dm.eContracting = eContractingCheckBox.Checked.ToString();
                    dm.Active = activeCheckBox.Checked;

                    DataServices ds = new DataServices();
                    ds.UpdateGridData(dm);
                }
                bindGridView();
            }

            catch (Exception ex)
            {
                throw (ex);
            }

        }

        private void bindGridView()
        {
            try
            {
                DataServices ds = new DataServices();
                this.DealerMenu.DataSource = ds.GetGridViewData();
                this.DealerMenu.DataBind();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
      
    }
}
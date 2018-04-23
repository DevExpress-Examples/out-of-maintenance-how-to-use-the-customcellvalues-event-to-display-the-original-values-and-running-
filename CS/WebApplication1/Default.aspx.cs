using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.XtraPivotGrid;
using DevExpress.Web.ASPxPivotGrid;
using System.Collections.Generic;

namespace WebApplication1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxPivotGrid1_CustomCellValue(object sender, DevExpress.Web.ASPxPivotGrid.PivotCellValueEventArgs e)
        {

            if (e.DataField == fieldProductAmount)
            {
                PivotDrillDownDataSource ds = e.CreateDrillDownDataSource();
                double value = 0;
                Dictionary<PivotGridField, object> rowFieldValues = new Dictionary<PivotGridField, object>();
                PivotGridField[] rowFields = e.GetRowFields();
                foreach (PivotGridField field in rowFields)
                    rowFieldValues[field] = e.GetFieldValue(field);
                for (int i = 0; i < ds.RowCount; i++)
                {
                    bool skip = false;
                    foreach (PivotGridField field in rowFields)
                    {
                        if (!Comparer.Equals(ds[i][field], rowFieldValues[field]))
                        {
                            skip = true;
                            break;
                        }
                    }
                    if (skip)
                        continue;
                    double v1 = Convert.ToDouble(ds[i][e.DataField]);
                    value += v1;
                }
                e.Value = value;
            }
        }
    }
}

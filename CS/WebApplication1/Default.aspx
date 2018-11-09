<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxwpg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="AccessDataSource1"
            OnCustomCellValue="ASPxPivotGrid1_CustomCellValue">
            <Fields>
                <dxwpg:PivotGridField ID="fieldProductName" Area="RowArea" AreaIndex="0" FieldName="ProductName" RunningTotal="True">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldOrderDate" Area="ColumnArea" AreaIndex="0" FieldName="OrderDate"
                    GroupInterval="DateYear" UnboundFieldName="fieldOrderDate">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0" FieldName="ProductAmount">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductAmount1" Area="DataArea" AreaIndex="1" Caption="ProductAmount Running"
                    FieldName="ProductAmount">
                </dxwpg:PivotGridField>
            </Fields>
        </dxwpg:ASPxPivotGrid>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [CustomerReports]"></asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>

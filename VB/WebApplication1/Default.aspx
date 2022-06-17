<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication1._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxwpg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="AccessDataSource1" ClientIDMode="AutoID">
            <Fields>
                <dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0" Caption="Amount" FieldName="ProductAmount" Name="fieldProductAmount">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="ProductAmount" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                 <dxwpg:PivotGridField ID="field" Area="DataArea" AreaIndex="1" Caption="Running Amount" Name="field">
                    <DataBindingSerializable>
                        <dxwpg:RunningTotalBinding PartitioningCriteria="RowValue">
                            <SourceSerializable>
                                <dxwpg:DataSourceColumnBinding ColumnName="ProductAmount" />
                            </SourceSerializable>
                        </dxwpg:RunningTotalBinding>
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductName" Area="RowArea" AreaIndex="0" Caption="Product" FieldName="ProductName" Name="fieldProductName">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="ProductName" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldOrderDate" Area="ColumnArea" AreaIndex="0" EmptyCellText="Year" FieldName="OrderDate" Name="fieldOrderDate">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateYear" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
            </Fields>
            <OptionsData DataProcessingEngine="Optimized" />
        </dxwpg:ASPxPivotGrid>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [CustomerReports]"></asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>

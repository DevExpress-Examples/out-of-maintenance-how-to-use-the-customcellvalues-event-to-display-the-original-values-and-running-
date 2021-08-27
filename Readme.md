<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128579711/19.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E1962)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebApplication1/Default.aspx) (VB: [Default.aspx](./VB/WebApplication1/Default.aspx))
<!-- default file list end -->
# How to display the original values and Running Total values
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e1962/)**
<!-- run online end -->




Starting with version 19.2 it is possible to use the new Optimize data processing engine to enable the RunningTotals feature in a specific data fields. To enable the Optimized engine, use the [OptionsData.DataProcessingEngine](https://docs.devexpress.com/CoreLibraries/DevExpress.XtraPivotGrid.PivotGridOptionsData.DataProcessingEngine) property. Then you will be able to bind fields to data using the [PivotGridField.DataBinding](https://docs.devexpress.com/CoreLibraries/DevExpress.XtraPivotGrid.PivotGridFieldBase.DataBinding) property. The following code snippet demonstrates how to define two data fields bound to the same data source column and display running summary values in one of them:

```cs
new PivotGridField() {
    Caption = "Amount",
    ID = "fieldAmount", // or Name = "fieldAmount",
    Area = DevExpress.XtraPivotGrid.PivotArea.DataArea,
    DataBinding = new DataSourceColumnBinding("ProductAmount") };
new PivotGridField() {
    Caption = "Running Amount",
    ID = "fieldRunningAmount", // or Name = "fieldRunningAmount"
    Area = DevExpress.XtraPivotGrid.PivotArea.DataArea,
    DataBinding = new RunningTotalBinding( 
        new DataSourceColumnBinding("ProductAmount"), 
        DevExpress.XtraPivotGrid.CalculationPartitioningCriteria.RowValue, 
        DevExpress.Data.PivotGrid.PivotSummaryType.Sum)};
```

 

**See Also:**
[Add the capability to specify data fields for the RunningTotals feature](https://www.devexpress.com/Support/Center/p/S30656) 




Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.XtraPivotGrid
Imports DevExpress.Web.ASPxPivotGrid
Imports System.Collections.Generic

Namespace WebApplication1
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub

		Protected Sub ASPxPivotGrid1_CustomCellValue(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxPivotGrid.PivotCellValueEventArgs)

			If e.DataField Is fieldProductAmount Then
				Dim ds As PivotDrillDownDataSource = e.CreateDrillDownDataSource()
				Dim value As Double = 0
				Dim rowFieldValues As New Dictionary(Of PivotGridField, Object)()
				Dim rowFields() As PivotGridField = e.GetRowFields()
				For Each field As PivotGridField In rowFields
					rowFieldValues(field) = e.GetFieldValue(field)
				Next field
				For i As Integer = 0 To ds.RowCount - 1
					Dim skip As Boolean = False
					For Each field As PivotGridField In rowFields
						If (Not Comparer.Equals(ds(i)(field), rowFieldValues(field))) Then
							skip = True
							Exit For
						End If
					Next field
					If skip Then
						Continue For
					End If
					Dim v1 As Double = Convert.ToDouble(ds(i)(e.DataField))
					value += v1
				Next i
				e.Value = value
			End If
		End Sub
	End Class
End Namespace

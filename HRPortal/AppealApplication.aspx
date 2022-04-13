<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppealApplication.aspx.cs" Inherits="HRPortal.AppealApplication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Create A New Application</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Create A New Application (<i style="color: yellow">Kindly note that all fields marked with asterisk (<span style="color: red">*</span>) are mandatory</i>)
           
        </div>
        <div class="panel-body">
            <div runat="server" id="linesfeedback"></div>
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group" style="display:none">
                        <strong>Appeal Reason:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:DropDownList runat="server" ID="AppealReason" CssClass="form-control select2" />
                        
                        </div>
                   
                        <div class="form-group">
                            <strong>Date</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="txtDate" TextMode="DateTime" CssClass="form-control" ReadOnly />                            
                        </div>
                    
                        <div class="form-group">
                            <strong>Appeal Reason</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="Describe" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="Describe"  ErrorMessage="Appeal Reason select Payment Type, it cannot be empty!" ForeColor="Red" />
                        </div>
                    
                        <div class="form-group">
                            <strong>Attach Appeal evidence</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:FileUpload runat="server" CssClass="form-control" ID="FileUpload1"></asp:FileUpload>
                             <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="FileUpload1"  ErrorMessage="Please attach a document, it cannot be empty!" ForeColor="Red" />
                        </div>
                  
                </div>
            </div>
        </div>

        <div class="panel-footer">
             <asp:Button runat="server" ID="addapplication" CssClass="btn btn-warning center-block" Text="Apply for Appeal" OnClick="addapplication_Click"/>               
               <asp:Button runat="server" ID="Nexttostep2" CssClass="btn btn-success pull-left" Text="Exit" CausesValidation="false"  OnClick="Nexttostep2_Click"/>
            <div class="clearfix"></div>
        </div>

    </div>
        

</asp:Content>

﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace HRPortal.NavXtender {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="NavXtender_Binding", Namespace="urn:microsoft-dynamics-schemas/codeunit/NavXtender")]
    public partial class NavXtender : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback AddLinkToRecordOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public NavXtender() {
            this.Url = global::HRPortal.Properties.Settings.Default.HRPortal_NavXtender_NavXtender;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event AddLinkToRecordCompletedEventHandler AddLinkToRecordCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("urn:microsoft-dynamics-schemas/codeunit/NavXtender:AddLinkToRecord", RequestNamespace="urn:microsoft-dynamics-schemas/codeunit/NavXtender", ResponseElementName="AddLinkToRecord_Result", ResponseNamespace="urn:microsoft-dynamics-schemas/codeunit/NavXtender", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void AddLinkToRecord(string ptxtPageName, string ptxtRecordText, string ptxtURL, string ptxtDescription) {
            this.Invoke("AddLinkToRecord", new object[] {
                        ptxtPageName,
                        ptxtRecordText,
                        ptxtURL,
                        ptxtDescription});
        }
        
        /// <remarks/>
        public void AddLinkToRecordAsync(string ptxtPageName, string ptxtRecordText, string ptxtURL, string ptxtDescription) {
            this.AddLinkToRecordAsync(ptxtPageName, ptxtRecordText, ptxtURL, ptxtDescription, null);
        }
        
        /// <remarks/>
        public void AddLinkToRecordAsync(string ptxtPageName, string ptxtRecordText, string ptxtURL, string ptxtDescription, object userState) {
            if ((this.AddLinkToRecordOperationCompleted == null)) {
                this.AddLinkToRecordOperationCompleted = new System.Threading.SendOrPostCallback(this.OnAddLinkToRecordOperationCompleted);
            }
            this.InvokeAsync("AddLinkToRecord", new object[] {
                        ptxtPageName,
                        ptxtRecordText,
                        ptxtURL,
                        ptxtDescription}, this.AddLinkToRecordOperationCompleted, userState);
        }
        
        private void OnAddLinkToRecordOperationCompleted(object arg) {
            if ((this.AddLinkToRecordCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.AddLinkToRecordCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void AddLinkToRecordCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
}

#pragma warning restore 1591
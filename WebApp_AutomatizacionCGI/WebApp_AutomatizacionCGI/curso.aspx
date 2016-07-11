<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="curso.aspx.cs" Inherits="WebApp_AutomatizacionCGI.curso" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Registrar Asistencia</h3>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="Panel1" runat="server" DefaultButton="Link_RegistrarAsistencia">
                                <asp:TextBox ID="txt_CodigoDocente" runat="server" CssClass="form-control" placeholder="Codigo..." TextMode="Password"></asp:TextBox>
                               <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender_codigoDocente" TargetControlID="txt_CodigoDocente" Enabled="true" ValidChars="kK0123456789" runat="server"></asp:FilteredTextBoxExtender>   

                                <asp:LinkButton ID="Link_RegistrarAsistencia" runat="server" OnClick="Link_RegistrarAsistencia_Click" CssClass="btn btn-primary hidden">Ingresar</asp:LinkButton>
                            </asp:Panel>
                        </div>
                        <div class="modal-footer">
                            <asp:Label ID="lb_Bienvenida" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                 <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4><asp:Label ID="lb_numeropad" runat="server" Text=""></asp:Label></h4>
                        </div>
                        <div class="modal-body">      
                            <asp:Label ID="lb_infoPad" runat="server" Text=""></asp:Label>
                            <asp:GridView ID="GridView_DatosCurso" runat="server" CssClass="table"></asp:GridView>    
                        </div>
                        <div class="modal-footer">
                           <asp:LinkButton ID="Link_CerrarCurso" runat="server" CssClass="btn btn-danger btn-block" OnClick="Link_CerrarCurso_Click">Cerrar Curso</asp:LinkButton>  
                        </div>
                    </div>
                             
            </div>
        </div>
    </div>
        </div>
    <br />
    <br />

</asp:Content>

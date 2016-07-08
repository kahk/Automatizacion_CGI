<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="curso.aspx.cs" Inherits="WebApp_AutomatizacionCGI.curso" %>

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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txt_CodigoDocente" SetFocusOnError="true" CssClass="text-danger" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                
                                <asp:LinkButton ID="Link_RegistrarAsistencia" runat="server" OnClick="Link_RegistrarAsistencia_Click" CssClass="btn btn-primary hidden">Ingresar</asp:LinkButton>
                            </asp:Panel>
                        </div>
                        <div class="modal-footer">
                            <asp:Label ID="lb_Bienvenida" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <asp:LinkButton ID="Link_CerrarCurso" runat="server" CssClass="btn btn-danger" OnClick="Link_CerrarCurso_Click">CerrarCurso</asp:LinkButton>
            </div>
        </div>
    </div>
    <br />
    <br />
    
</asp:Content>

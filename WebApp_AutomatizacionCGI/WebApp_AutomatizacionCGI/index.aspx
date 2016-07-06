<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp_AutomatizacionCGI.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View0_inicio" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                            <div class="col-md-2">
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_Administrador" runat="server" CssClass="btn btn-danger btn-lg btn-block" OnClick="Link_Administrador_Click">Administrador</asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_Encargado" runat="server" CssClass="btn btn-danger btn-lg btn-block" OnClick="Link_Encargado_Click">Encargado</asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_VistaEncuestas" runat="server" CssClass="btn btn-danger btn-lg btn-block" OnClick="Link_VistaEncuestas_Click">Encuestas</asp:LinkButton>
                            </div>
                            <div class="col-md-4"></div>
                            <div class="col-md-4"></div>
                </asp:View>
                <asp:View ID="View1_Encargado" runat="server">
                         <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3>Ingreso Encargado</h3>                                            
                                        </div>
                                        <div class="modal-body">
                                            <asp:TextBox ID="txt_RutEncargado" runat="server" CssClass="form-control" placeholder="Rut..."></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  Display="Dynamic" ControlToValidate="txt_RutEncargado" SetFocusOnError="true" CssClass="text-danger" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="txt_CodigoEncargado" runat="server" CssClass="form-control" placeholder="Codigo..."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  Display="Dynamic" ControlToValidate="txt_CodigoEncargado" SetFocusOnError="true" CssClass="text-danger" runat="server" ErrorMessage="tonto culiao"></asp:RequiredFieldValidator>
                                       </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="Link_IngresarEncargado" runat="server" OnClick="Link_IngresarEncargado_Click" CssClass="btn btn-primary">Ingresar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="View2_administrador" runat="server">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3>Ingreso Administrador</h3>                                            
                                        </div>
                                        <div class="modal-body">
                                            <asp:TextBox ID="txt_Usuario" runat="server" CssClass="form-control" placeholder="Usuario...."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  Display="Dynamic" ControlToValidate="txt_Usuario" SetFocusOnError="true" CssClass="text-danger" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="txt_Clave" runat="server" CssClass="form-control" placeholder="Password...."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txt_Clave" CssClass="text-danger" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="Link_Ingresar" runat="server" OnClick="Link_Ingresar_Click" CssClass="btn btn-primary">Ingresar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="View3_ingreso_encuestas" runat="server">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3>Ingreso a Encuesta</h3>                                            
                                        </div>
                                        <div class="modal-body">
                                            <asp:TextBox ID="txt_usuarioEncuesta" runat="server" CssClass="form-control" placeholder="Usuario..."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  Display="Dynamic" ControlToValidate="txt_usuarioEncuesta" SetFocusOnError="true" CssClass="text-danger" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="txt_passwordEncuesta" runat="server" CssClass="form-control" placeholder="Password..."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txt_passwordEncuesta" CssClass="text-danger" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="Link_CargarEncuesta" runat="server" OnClick="Link_CargarEncuesta_Click" CssClass="btn btn-primary">Ingresar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                </asp:View>

                  <asp:View ID="View4_encuestas" runat="server">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4"></div>
                             
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>

        </ContentTemplate>

    </asp:UpdatePanel>


    
</asp:Content>

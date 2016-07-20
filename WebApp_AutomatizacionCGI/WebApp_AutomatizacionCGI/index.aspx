<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp_AutomatizacionCGI.index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_Administrador" runat="server" CssClass="btn btn-danger btn-lg btn-block" OnClick="Link_Administrador_Click">Administrador</asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_Encargado" runat="server" CssClass="btn btn-danger btn-lg btn-block" OnClick="Link_Encargado_Click">Relator</asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_VistaEncuestas" runat="server" CssClass="btn btn-danger btn-lg btn-block" OnClick="Link_VistaEncuestas_Click">Encuestas</asp:LinkButton>
                            </div>       
                                             
                            <div class="col-md-9"></div>
                </asp:View>
                <asp:View ID="View1_Encargado" runat="server">
                         <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3>Ingreso Relator</h3>                                            
                                        </div>
                                        <div class="modal-body">
                                            <br />
                                            <asp:TextBox ID="txt_RutEncargado" runat="server" CssClass="form-control" placeholder="Rut..."></asp:TextBox>
                                             <asp:MaskedEditExtender ID="MaskedEditExtender_rutencargado" TargetControlID="txt_RutEncargado" Mask="99,999,999-C" Filtered="0123456789kK" MaskType="Number" ClearMaskOnLostFocus="false" runat="server"></asp:MaskedEditExtender>    
                                            <br />
                                            <asp:TextBox ID="txt_CodigoEncargado" runat="server" CssClass="form-control" placeholder="Codigo..." TextMode="Password"></asp:TextBox>
                                           <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender_codigoEncargado" TargetControlID="txt_CodigoEncargado" Enabled="true" ValidChars="kK0123456789" runat="server"></asp:FilteredTextBoxExtender>    
                                            <br />                                            
                                            <asp:Label ID="lb_IngresoEncargado" runat="server" CssClass="label label-danger" Text=""></asp:Label>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="Link_IngresarEncargado" runat="server" OnClick="Link_IngresarEncargado_Click" CssClass="btn btn-primary">Ingresar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton ID="Link_Volver1" runat="server" OnClick="Link_Volver1_Click"  CssClass="btn btn-danger">Volver</asp:LinkButton>
                            </div>
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
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender_usuario" TargetControlID="txt_Usuario" Enabled="true" ValidChars="abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789()_" runat="server"></asp:FilteredTextBoxExtender>
                                            <br />
                                            <asp:TextBox ID="txt_Clave" runat="server" CssClass="form-control" placeholder="Contraseña...." TextMode="Password"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender_clave" TargetControlID="txt_Clave" Enabled="true" ValidChars="abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789()" runat="server"></asp:FilteredTextBoxExtender>
                                            <br />                                            
                                            <asp:Label ID="lb_IngresoAdministrador" CssClass="label label-danger" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="Link_Ingresar" runat="server" OnClick="Link_Ingresar_Click" CssClass="btn btn-primary">Ingresar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton ID="Link_Volver2" runat="server" OnClick="Link_Volver1_Click" CssClass="btn btn-danger">Volver</asp:LinkButton>
                            </div>
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
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender_usuarioEncuesta" TargetControlID="txt_usuarioEncuesta" Enabled="true" ValidChars="abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789()_" runat="server"></asp:FilteredTextBoxExtender>
                                            <br />
                                            <asp:TextBox ID="txt_passwordEncuesta" runat="server" CssClass="form-control" placeholder="Contraseña..." TextMode="Password"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender_passwordencuesta" TargetControlID="txt_passwordEncuesta" Enabled="true" ValidChars="abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789()" runat="server"></asp:FilteredTextBoxExtender>
                                            <br />
                                            <br />
                                            <asp:Label ID="lb_IngresoEncuestas" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="Link_IngresarEncuesta" runat="server" OnClick="Link_IngresarEncuesta_Click" CssClass="btn btn-primary">Ingresar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton ID="Link_Volver3" runat="server" OnClick="Link_Volver1_Click" CssClass="btn btn-danger">Volver</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </asp:View>

            </asp:MultiView>

        </ContentTemplate>

    </asp:UpdatePanel>


    
</asp:Content>

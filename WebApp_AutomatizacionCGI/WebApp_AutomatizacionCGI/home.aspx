<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApp_AutomatizacionCGI.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View0_inicio" runat="server">

                </asp:View>
                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View1_addDocentes" runat="server">
                    <div class="col-md-3">
                        <h3>Ingreso Docentes</h3>
                        <br />
                        <div class="form-group">
                            <label for="txt_rutDocente" class="col-sm-3 control-label">Rut</label>
                            <div class="col-md-5">
                                <asp:TextBox ID="txt_rutDocente" runat="server" CssClass="form-control" placeholder="11.111.111"></asp:TextBox>
                            </div>
                            <label for="txt_digitoDocente" class="col-sm-1 control-label">-</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_digitoDocente" runat="server" CssClass="form-control" placeholder="1"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="txt_nombreDocente" class="col-sm-3 control-label">Nombre</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txt_nombreDocente" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="txt_apellidoDocente" class="col-sm-3 control-label">Apellido</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txt_apellidoDocente" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="txt_correoDocente" class="col-sm-3 control-label">Correo</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txt_correoDocente" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="txt_fechaingresoDocente" class="col-sm-3 control-label">Fecha</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txt_fechaingresoDocente" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                        <asp:Button ID="btn_addDocente" runat="server" Text="Añadir" CssClass="btn btn-primary btn-lg btn-block" />
                    </div>

                    <div class="col-md-1"></div>
                    <div class="col-md-7">
                        <h3>Docentes</h3>
                        <br />
                        <asp:GridView ID="GridView_docentes" runat="server"></asp:GridView>
                    </div>
                </asp:View>
                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View2_addCurso" runat="server">

                </asp:View>
                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View3_addEncuesta" runat="server">

                </asp:View>
                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View4_reportes" runat="server">

                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

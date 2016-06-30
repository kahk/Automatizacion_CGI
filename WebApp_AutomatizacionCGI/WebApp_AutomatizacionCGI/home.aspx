<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApp_AutomatizacionCGI.home" %>

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

                </asp:View>
                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View1_addDocentes" runat="server">
                    <div class="col-md-3">
                        <h3>Ingreso Docentes</h3>
                        <br />
                        <div class="form-group">
                            <label for="txt_rutDocente" class="col-sm-3 control-label">Rut</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_rutDocente" runat="server" CssClass="form-control" placeholder="11.111.111"></asp:TextBox>
                            </div>                            
                            <div class="col-md-3">
                                <asp:TextBox ID="txt_digitoDocente" runat="server" CssClass="form-control" placeholder="k"></asp:TextBox>
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
                            <div class="col-sm-7">
                                <asp:TextBox ID="txt_fechaingresoDocente" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox> 
                                <asp:Calendar ID="Calendar1_Docentes" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_Docentes_SelectionChanged">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#808080" />
                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                    <SelectorStyle BackColor="#CCCCCC" />
                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                </asp:Calendar>
                            </div>
                            <div class="col-sm-2">
                                <asp:LinkButton ID="LinkButto_abrircalendario" runat="server" OnClick="LinkButto_abrircalendario_Click"><i class="fa fa-calendar" aria-hidden="true"></i></asp:LinkButton>
                            </div>
                        </div>
                        <br />
                        <br />
                        <asp:Button ID="btn_addDocente" runat="server" Text="Añadir" CssClass="btn btn-danger btn-lg btn-block" OnClick="btn_addDocente_Click" />
                        <asp:Button ID="btn_volver" runat="server" Text="Volver" CssClass="btn btn-default btn-lg btn-block" OnClick="btn_volver_Click"/>
                    </div>

                    
                    <div class="col-md-8">
                        <h3>Docentes</h3>
                        <br />
                        <asp:GridView ID="GridView_docentes" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataKeyNames="Rut,Nombre,Apellido,Correo,Fecha_Ingreso,ID_Estado,Codigo" OnPageIndexChanging="GridView_docentes_PageIndexChanging" OnRowCancelingEdit="GridView_docentes_RowCancelingEdit" OnRowEditing="GridView_docentes_RowEditing" OnRowUpdating="GridView_docentes_RowUpdating" AllowPaging="True" PageIndex="10">
                            <Columns>
                                <asp:TemplateField HeaderText="Rut" SortExpression="Rut">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Rut") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rut") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1_nombreDocente" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido" SortExpression="Apellido">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2_apellidoDocente" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo" SortExpression="Correo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3_correoDocente" runat="server" Text='<%# Bind("Correo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Correo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Fecha_Ingreso") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Fecha_Ingreso") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Editar">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="btn-danger" />
                        </asp:GridView>
                    </div>
                </asp:View>

                 <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View2_addCurso" runat="server">

                </asp:View>

                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View3_addCurso" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="Link_BuscarCurso" runat="server">Buscar</asp:LinkButton>
                            <asp:LinkButton ID="Link_CursoNuevo" runat="server" OnClick="Link_CursoNuevo_Click">Nuevo Curso</asp:LinkButton>
                            <asp:LinkButton ID="Link_volver" runat="server" OnClick="btn_volver_Click">Volver</asp:LinkButton>
                            <br />
                            <br />
                            <asp:Button ID="btn_modalcursonuevo" runat="server" Text="Button" CssClass="hidden" />
                            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btn_modalcursonuevo" PopupControlID="Panel_CursoNuevo" OkControlID="Link_SalirCurso" CancelControlID="Link_CancelarCurso" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
                            
                            <asp:Button ID="btn_modalencargadonuevo" runat="server" Text="Button" CssClass="hidden" />
                            <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="btn_modalencargadonuevo" PopupControlID="Panel_EncargadoNuevo" OkControlID="Link_SalirEncargado" CancelControlID="Link_CancelarEncargado" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
                            <br />
                            <br />

                            <asp:GridView ID="GridView_cursos" runat="server"></asp:GridView>

                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br />
                    <asp:Panel ID="Panel_CursoNuevo" runat="server">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_SalirCurso" runat="server">X</asp:LinkButton>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <asp:Label ID="lbCurso" runat="server" Text="" Visible="false"></asp:Label>
                                        <br />
                                        <label for="txt_RutEncargardo_Curso" class="col-sm-4 control-label">Encargado</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txt_RutEncargardo_Curso" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_RutEncargardo_Curso" class="col-sm-4 control-label">Detalle</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txt_detalleCurso" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="Link_EditarCurso" runat="server" CssClass="btn btn-success" >Editar</asp:LinkButton>

                                    <asp:LinkButton ID="Link_GuardarCurso" runat="server" CssClass="btn btn-success" OnClick="Link_GuardarCurso_Click"><i class="fa fa-floppy-o" aria-hidden="true"></i></asp:LinkButton>
                                    <asp:LinkButton ID="Link_CancelarCurso" runat="server" CssClass="btn btn-danger" >Cancelar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Panel ID="Panel_EncargadoNuevo" runat="server">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_SalirEncargado" runat="server">X</asp:LinkButton>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="txt_RutEncargardo" class="col-sm-4 control-label">Rut</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txt_RutEncargardo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_NombreEncargado" class="col-sm-4 control-label">Nombre</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txt_NombreEncargado" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_ApellidoEncargado" class="col-sm-4 control-label">Apellido</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txt_ApellidoEncargado" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_CorreoEncargado" class="col-sm-4 control-label">Correo</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txt_CorreoEncargado" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="Link_GuardarEncargado" runat="server" CssClass="btn btn-success" OnClick="Link_GuardarEncargado_Click"><i class="fa fa-floppy-o" aria-hidden="true"></i></asp:LinkButton>
                                    <asp:LinkButton ID="Link_CancelarEncargado" runat="server" CssClass="btn btn-danger">Cancelar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>


                </asp:View>
               
                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View4_reportes" runat="server">

                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

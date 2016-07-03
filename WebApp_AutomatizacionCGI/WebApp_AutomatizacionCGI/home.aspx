<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApp_AutomatizacionCGI.home" Culture="auto" UICulture="auto" %>

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

                            <div class="col-md-3">
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_VistaDocentes" runat="server" OnClick="Link_VistaDocentes_Click" CssClass="btn btn-default">Docentes</asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_VistaEncargados" runat="server" OnClick="Link_VistaEncargados_Click" CssClass="btn btn-default">Encargados</asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="Link_VistaCursos" runat="server" OnClick="Link_VistaCursos_Click" CssClass="btn btn-default">Cursos</asp:LinkButton>
                            </div>

                            <div class="col-md-5">
                                <h3>INACAP</h3>
                            </div>

                            <div class="col-md-3></div>
                        </div>
                </asp:View>
                <%-----------------------------------VISTA DOCENTE-----------------------------------%>
                <asp:View ID="View1_Docentes" runat="server">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:TextBox ID="txt_BuscarDocente" runat="server"></asp:TextBox>
                        <asp:LinkButton ID="Link_BuscarDocente" runat="server" CssClass="btn btn-warning">Buscar</asp:LinkButton>
                        <asp:LinkButton ID="Link_AbrirModalDocente" runat="server" CssClass="btn btn-success" OnClick="Link_AbrirModalDocente_Click">Nuevo Curso</asp:LinkButton>
                        <asp:LinkButton ID="Link_Volver1" runat="server" CssClass="btn btn-default" OnClick="btn_volver_Click" >Volver</asp:LinkButton>
                        <br />
                        <br />
                        <asp:GridView ID="GridView_docentes" runat="server" AutoGenerateColumns="False" CssClass="table" OnPageIndexChanging="GridView_docentes_PageIndexChanging" AllowPaging="True" OnSelectedIndexChanging="GridView_docentes_SelectedIndexChanging" PageSize="8">
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
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido" SortExpression="Apellido">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Apellido") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo" SortExpression="Correo">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Correo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Correo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Fecha_Ingreso") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Fecha_Ingreso") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID_Estado" SortExpression="ID_Estado" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ID_Estado") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ID_Estado") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado" SortExpression="Detalle">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Detalle") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Detalle") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Modificar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Link_ModificarDocente" runat="server" CausesValidation="False" CommandName="Select" Text="" CssClass="btn btn-danger" OnClick="Link_ModificarDocente_Click"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="3px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Link_ImprimirCodigoDocente" runat="server" CausesValidation="False" CommandName="Select" Text="" CssClass="btn btn-default" OnClick="Link_ImprimirCodigoDocente_Click"><i class="fa fa-eye" aria-hidden="true"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="3px" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="btn-danger" />
                        </asp:GridView>
                    </div>
                    <div class="col-md-1"></div>

                    <%-- ----------------------------MODAL DOCENTE------------------------------%>
                    <asp:Button ID="btn_ModalDocente" runat="server" Text="Button" CssClass="hidden" />
                    <asp:ModalPopupExtender ID="ModalPopupExtender0_ModalDocente" runat="server" TargetControlID="btn_ModalDocente" PopupControlID="Panel_creardocente" OkControlID="Link_salirmodalcreardocente" CancelControlID="Link_cancelardocente" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>

                    <asp:Panel ID="Panel_creardocente" runat="server">
                        <div class="modal-dialog modal-sm ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_salirmodalcreardocente" runat="server">X</asp:LinkButton>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">                                       
                                        <label for="txt_rutDocente" class="col-sm-3 control-label">Rut</label>
                                        <div class="col-md-6">
                                            <asp:Label ID="lb_RutDocente" runat="server" Text="" Visible="false"></asp:Label>
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
                                        <label for="cb_EstadoDocente" class="col-sm-3 control-label">Estado</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="cb_EstadoDocente" runat="server" CssClass="form-control" Enabled="false"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_fechaingresoDocente" class="col-sm-3 control-label">Fecha</label>
                                        <div class="col-sm-7">
                                            <asp:TextBox ID="txt_fechaingresoDocente" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_fechaingresoDocente" PopupButtonID="Link_fechadocente" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>
                                        <div class="col-sm-2">
                                            <asp:LinkButton ID="Link_fechadocente" runat="server"><i class="fa fa-calendar" aria-hidden="true"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="Link_EditarDocente" runat="server" CssClass="btn btn-success" Visible="false" OnClick="Link_EditarDocente_Click">Editar</asp:LinkButton>
                                    <asp:LinkButton ID="Link_addDocente" runat="server" CssClass="btn btn-success" OnClick="Link_addDocente_Click">Guardar</asp:LinkButton>
                                    <asp:LinkButton ID="Link_cancelardocente" runat="server" CssClass="btn btn-danger" OnClick="btn_volver_Click">Cancelar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                </asp:View>
                 <%-----------------------------------VISTA ENCARGADOS-----------------------------------%>

                <asp:View ID="View2_Encargados" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_BuscarEncargado" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="Link_BuscarEncargado" runat="server" CssClass="btn btn-primary" OnClick="Link_BuscarEncargado_Click">LinkButton</asp:LinkButton>
                            <asp:LinkButton ID="Link_AbrirModalEncargado" runat="server" CssClass="btn btn-success" OnClick="Link_AbrirModalEncargado_Click">LinkButton</asp:LinkButton>
                            <asp:LinkButton ID="Link_VolverEncargado" runat="server" CssClass="btn btn-default" OnClick="btn_volver_Click">LinkButton</asp:LinkButton>
                            <br />
                            <br />
                            <asp:GridView ID="GridView_Encargados" runat="server"></asp:GridView>
                        </div>
                        <div class="col-md-1"></div>
                    </div>


                </asp:View>

               <%-----------------------------------VISTA CURSOS-----------------------------------%>
                <asp:View ID="View3_Cursos" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_BuscarCurso" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="Link_BuscarCurso" runat="server" CssClass="btn btn-primary" OnClick="Link_BuscarCurso_Click">Buscar</asp:LinkButton>
                            <asp:LinkButton ID="Link_AbrirModalCurso" runat="server" CssClass="btn btn-success" OnClick="Link_AbrirModalCurso_Click">Nuevo Curso</asp:LinkButton>
                            <asp:LinkButton ID="Link_VolverCurso" runat="server" CssClass="btn btn-default" OnClick="btn_volver_Click" >Volver</asp:LinkButton>
                            <br />
                            <br />
                            <asp:GridView ID="GridView_cursos" runat="server" AutoGenerateColumns="False" CssClass="table" OnSelectedIndexChanging="GridView_cursos_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="GridView_cursos_PageIndexChanging" PageSize="20">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" SortExpression="ID_Curso">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_Curso") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_Curso") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rut Encargado" SortExpression="Rut_Encargado">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Rut_Encargado") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Rut_Encargado") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nombre Encargado" SortExpression="Nombre">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apellido Encargado" SortExpression="Apellido">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Detalle Curso" SortExpression="Detalle">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Detalle") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Detalle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Información">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Link_ModalPad" runat="server" CausesValidation="False" CommandName="Select" Text="PAD" OnClick="Link_ModalPad_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Asignar">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Link_viewAsignarDocentes_Curso" runat="server" CausesValidation="False" CommandName="Select" Text="Docentes" OnClick="Link_viewAsignarDocentes_Curso_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="btn-danger" />
                            </asp:GridView>
                            <br />
                            <br />
                            <asp:Label ID="lb_idcurso" runat="server" Text=""></asp:Label>
                            <%--//visible = false--%>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <%--------------------------MODAL CURSOS------------------------%>
                    <asp:Button ID="btn_modalcursonuevo" runat="server" Text="Button" CssClass="hidden" />
                    <asp:ModalPopupExtender ID="ModalPopupExtender1_cursonuevo" runat="server" TargetControlID="btn_modalcursonuevo" PopupControlID="Panel_CursoNuevo" OkControlID="Link_SalirCurso" CancelControlID="Link_CancelarCurso" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>

                    <asp:Panel ID="Panel_CursoNuevo" runat="server">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_SalirCurso" runat="server">X</asp:LinkButton>
                                    <asp:Label ID="Label6" runat="server" Text="Crear Curso"></asp:Label>
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
                                        <label for="txt_detalleCurso" class="col-sm-4 control-label">Detalle</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txt_detalleCurso" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="Link_GuardarCurso" runat="server" CssClass="btn btn-success" OnClick="Link_GuardarCurso_Click"><i class="fa fa-floppy-o" aria-hidden="true"></i></asp:LinkButton>
                                    <asp:LinkButton ID="Link_CancelarCurso" runat="server" CssClass="btn btn-danger">Cancelar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <%-----------------------------MODAL Confirmar Encargado-------------------------%>
                    <asp:Button ID="btn_modalconfirmarEncargado" runat="server" Text="Button" CssClass="hidden" />
                    <asp:ModalPopupExtender ID="ModalPopupExtender2_ConfirmarEncargado" runat="server" TargetControlID="btn_modalconfirmarEncargado" PopupControlID="Panel_ConfirmarEncargado" OkControlID="Link_SalirConfirmar" CancelControlID="Link_no" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>

                    <asp:Panel ID="Panel_ConfirmarEncargado" runat="server">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_SalirConfirmar" runat="server">X</asp:LinkButton>
                                </div>
                                <div class="modal-body">
                                    <asp:Label ID="lb_encargadoNoencontrado" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="Link_si" runat="server" CssClass="btn btn-success" OnClick="Link_si_Click">Si</asp:LinkButton>
                                    <asp:LinkButton ID="Link_no" runat="server" CssClass="btn btn-danger">No</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <%-----------------------------MODAL ENCARGADO NUEVO-------------------------%>
                    <asp:Button ID="btn_modalencargadonuevo" runat="server" Text="Button" CssClass="hidden" />
                    <asp:ModalPopupExtender ID="ModalPopupExtender3_encargadonuevo" runat="server" TargetControlID="btn_modalencargadonuevo" PopupControlID="Panel_EncargadoNuevo" OkControlID="Link_SalirEncargado" CancelControlID="Link_CancelarEncargado" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>

                    <asp:Panel ID="Panel_EncargadoNuevo" runat="server">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_SalirEncargado" runat="server">X</asp:LinkButton>
                                    <asp:Label ID="Label7" runat="server" Text="Agregar Docente"></asp:Label>
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

                    <%-----------------------------MODAL DETALLE CURSO-------------------------%>
                    <asp:Button ID="btn_modaldetallecurso" runat="server" Text="Button" CssClass="hidden" />
                    <asp:ModalPopupExtender ID="ModalPopupExtender4_detallecurso" runat="server" TargetControlID="btn_modaldetallecurso" PopupControlID="Panel_DetalleCurso" OkControlID="Link_salirdetalle" CancelControlID="Link_Salirdetalle1" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>

                    <asp:Panel ID="Panel_DetalleCurso" runat="server">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_salirdetalle" runat="server">X</asp:LinkButton>
                                </div>
                                <div class="modal-body">
                                    <asp:GridView ID="GridView_detallePad" runat="server"></asp:GridView>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="Link_NuevoPad" runat="server" CssClass="btn btn-success" OnClick="Link_NuevoPad_Click"><i class="fa fa-plus"></i></asp:LinkButton>
                                    <asp:LinkButton ID="Link_Salirdetalle1" runat="server" CssClass="btn btn-danger">Salir</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <%-----------------------------MODAL PAD CURSO-------------------------%>
                    <asp:Button ID="btn_modalnuevopad" runat="server" Text="Button" CssClass="hidden" />
                    <asp:ModalPopupExtender ID="ModalPopupExtender5_padnuevo" runat="server" TargetControlID="btn_modalnuevopad" PopupControlID="Panel_nuevopad" OkControlID="Link_salirpad" CancelControlID="Link_Salirpad1" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>

                    <asp:Panel ID="Panel_nuevopad" runat="server">
                        <div class="modal-dialog modal-sm ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:LinkButton ID="Link_salirpad" runat="server">X</asp:LinkButton>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="txt_rutDocente" class="col-sm-4 control-label">Sala</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_numerosala" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_numerosalacoffe" class="col-sm-4 control-label">Sala Coffe</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_numerosalacoffe" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_horainicio" class="col-sm-4 control-label">Hora Inicio</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txt_horainicio" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txt_minutoinicio" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_horafin" class="col-sm-4 control-label">Hora Fin</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txt_horafin" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txt_minutofin" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="txt_fechapad" class="col-sm-4 control-label">Fecha</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txt_fechapad" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                            <asp:CalendarExtender ID="ceShippedDate" runat="server" TargetControlID="txt_fechapad" PopupButtonID="Link_fechaPad" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>
                                        <div class="col-sm-2">
                                            <asp:LinkButton ID="Link_fechaPad" runat="server"><i class="fa fa-calendar" aria-hidden="true"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="Link_GuardarPad" runat="server" CssClass="btn btn-success" OnClick="Link_GuardarPad_Click">Guardar</asp:LinkButton>
                                    <asp:LinkButton ID="Link_Salirpad1" runat="server" CssClass="btn btn-danger">Cancelar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </asp:View>
                <%-----------------------------VISTA CURSO_DOCENTE-------------------------%>
                <asp:View ID="View3_Docente_Curso" runat="server">

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_Buscar_Docente_Curso" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:GridView ID="GridView_asignardocentes" runat="server" AllowPaging="True" CssClass="table" AutoGenerateColumns="False" OnPageIndexChanging="GridView_asignardocentes_PageIndexChanging" PageSize="3">
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
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apellido" SortExpression="Apellido">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Apellido") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="btn-danger" />
                            </asp:GridView>
                            <br />
                            <br />

                            <asp:LinkButton ID="Link_AsignarDocentes" runat="server" CssClass="btn btn-success"><i class="fa fa-plus"></i></asp:LinkButton>

                            <asp:LinkButton ID="Link_volverviewcursos" runat="server" CssClass="btn btn-default" OnClick="Link_volverviewcursos_Click">Volver</asp:LinkButton>
                        </div>

                        <div class="col-md-1"></div>
                    </div>
                </asp:View>

                <%-----------------------------------VISTA REPORTES-----------------------------------%>
               

                
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

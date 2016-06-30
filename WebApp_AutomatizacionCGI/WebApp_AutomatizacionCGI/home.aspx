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
                <asp:View ID="View3_addEncuesta" runat="server">

                </asp:View>
                <%-----------------------------------Separador-----------------------------------%>
                <asp:View ID="View4_reportes" runat="server">

                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

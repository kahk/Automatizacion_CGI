<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="encuesta.aspx.cs" Inherits="WebApp_AutomatizacionCGI.encuesta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View_inicio" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1"></div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <div>
                                <asp:Label ID="Label105" runat="server" Text="Label">Marque seleccionando un circulo la nota que refleja a su parecer respecto de las afirmaciones señaladas a continuación.</asp:Label><br />
                                <asp:Label ID="Label106" runat="server" Text="Label">(1 es la nota mas baja y 7 la nota mas alta)</asp:Label><br />
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_Siguiente_Vista0" OnClick="Link_Siguiente_Vista0_Click" CssClass="btn btn-danger btn-block" runat="server">Comenzar</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                   
                </asp:View>
                <asp:View ID="View_AcercaRelatores" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1"></div>                        
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <div>
                                <b><asp:Label ID="Label5" runat="server" Text="Label">Acerca de Los Relatores</asp:Label></b><br />
                                <b><asp:Label ID="Label6" runat="server" Text="Label">Planificación de la sesión</asp:Label></b><br />
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP1" runat="server" Text="Label">1- </asp:Label><br />
                                    <asp:Label ID="lbP1" runat="server" Text="1" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">
                                    <asp:RadioButtonList ID="pregunta1" runat="server" RepeatDirection="Horizontal">                                        
                                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                    </asp:RadioButtonList>                                   
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP2" runat="server" Text="Label">2-</asp:Label><br />
                                    <asp:Label ID="lbP2" runat="server" Text="2" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta2" runat="server" RepeatDirection="Horizontal" >                                        
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>

                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP3" runat="server" Text="Label">3-</asp:Label><br />
                                    <asp:Label ID="lbP3" runat="server" Text="3" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta3" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP4" runat="server" Text="Label">4-</asp:Label><br />
                                    <asp:Label ID="lbP4" runat="server" Text="4" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta4" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <h4><asp:Label ID="lbview2" runat="server" Text="" CssClass="label label-danger"></asp:Label></h4>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_Siguiente_Vista1" OnClick="Link_Siguiente_Vista1_Click" CssClass="btn btn-danger btn-block" runat="server">Siguiente</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_Anterior_Vista2" OnClick="Link_Anterior_Vista2_Click" CssClass="btn btn-danger btn-block" runat="server">Anterior</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <div>
                               <b> <asp:Label ID="Label36" runat="server" Text="Label">Acerca de la metodología utilizada</asp:Label></b><br />
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP5" runat="server" Text="Label">5-</asp:Label><br />
                                    <asp:Label ID="lbP5" runat="server" Text="5" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta5" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP6" runat="server" Text="Label">6-</asp:Label><br />
                                    <asp:Label ID="lbP6" runat="server" Text="6" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta6" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP7" runat="server" Text="Label">7-</asp:Label><br />
                                    <asp:Label ID="lbP7" runat="server" Text="7" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta7" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP8" runat="server" Text="Label">8-</asp:Label><br />
                                    <asp:Label ID="lbP8" runat="server" Text="8" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta8" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <h4><asp:Label ID="lbview3" runat="server" Text="" CssClass="label label-danger"></asp:Label></h4>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_Siguiente_Vista2" OnClick="Link_Siguiente_Vista2_Click" CssClass="btn btn-danger btn-block" runat="server">Siguiente</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_anterior_Vista3" OnClick="Link_anterior_Vista3_Click" CssClass="btn btn-danger btn-block" runat="server">Anterior</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <div>
                               <b> <asp:Label ID="Label35" runat="server" Text="Label">Acerca de los materiales</asp:Label></b><br />
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP9" runat="server" Text="Label">9-</asp:Label><br />
                                    <asp:Label ID="lbP9" runat="server" Text="9" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta9" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP10" runat="server" Text="Label">10-</asp:Label><br />
                                    <asp:Label ID="lbP10" runat="server" Text="10" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta10" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP11" runat="server" Text="Label">11-</asp:Label><br />
                                    <asp:Label ID="lbP11" runat="server" Text="11" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta11" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP12" runat="server" Text="Label">12-</asp:Label><br />
                                    <asp:Label ID="lbP12" runat="server" Text="12" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta12" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                        <asp:ListItem Value="7">7</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <h4><asp:Label ID="lbview4" runat="server" Text="" CssClass="label label-danger"></asp:Label></h4>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_Siguiente_Vista3" OnClick="Link_Siguiente_Vista3_Click" CssClass="btn btn-danger btn-block" runat="server">Siguiente</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </asp:View>

                <asp:View ID="View5" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_Anterior_Vista4" OnClick="Link_Anterior_Vista4_Click" CssClass="btn btn-danger btn-block" runat="server">Anterior</asp:LinkButton>
                        </div>
                       <div class="col-md-1"></div>
                        <div class="col-md-7">
                            <div>
                               <b> <asp:Label ID="Label101" runat="server" Text="Label">Acerca del taller</asp:Label></b><br />
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP13" runat="server" Text="Label">13-</asp:Label><br />
                                    <asp:Label ID="lbP13" runat="server" Text="13" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta13" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP14" runat="server" Text="Label">14-</asp:Label><br />
                                    <asp:Label ID="lbP14" runat="server" Text="14" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta14" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-7">
                                    <asp:Label ID="lbBDP15" runat="server" Text="Label">15-</asp:Label><br />
                                    <asp:Label ID="lbP15" runat="server" Text="15" Visible="false"></asp:Label>
                                </div>
                                <div class="col-md-5">

                                    <asp:RadioButtonList ID="pregunta15" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="SI">SI</asp:ListItem>
                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <h4><asp:Label ID="lbview5" runat="server" Text="" CssClass="label label-danger"></asp:Label></h4>
                        </div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_Siguiente_Vista4" OnClick="Link_Siguiente_Vista4_Click" CssClass="btn btn-danger btn-block" runat="server">Siguiente</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </asp:View>
                <asp:View ID="View6" runat="server">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                                <asp:LinkButton ID="Link_Anterior_Vista5" OnClick="Link_Anterior_Vista5_Click" CssClass="btn btn-danger btn-block" runat="server">Anterior</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">                          

                            <asp:Label ID="lbError" runat="server" Text="ERROR" Visible="false"></asp:Label>
                            <div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <b><asp:Label ID="Label107" runat="server" Text="Label">Sugerencia</asp:Label></b><br />
                                        <asp:TextBox ID="txtSugerencia" CssClass="form-control" runat="server" Height="224px" placeholder="*Opcional, Máximo 300 caracteres" TextMode="MultiLine" Width="100%" MaxLength="300"></asp:TextBox>
                                     <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender_txtSugerencia" TargetControlID="txtSugerencia" Enabled="true" ValidChars="abcdefghijklmnñopqrstuvwxyz ABCDEFGHIJKLMNÑOPQRSTUVWXYZ,." runat="server"></asp:FilteredTextBoxExtender>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <br />
                            
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="Link_EnviarEncuesta" runat="server" CssClass="btn btn-danger btn-block" OnClick="Link_EnviarEncuesta_Click">Enviar</asp:LinkButton>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

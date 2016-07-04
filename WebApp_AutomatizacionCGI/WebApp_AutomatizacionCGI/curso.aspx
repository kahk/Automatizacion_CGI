<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="curso.aspx.cs" Inherits="WebApp_AutomatizacionCGI.curso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <asp:LinkButton ID="Link_AbrirAsistencia" runat="server" OnClick="Link_AbrirAsistencia_Click">AbrirAsistencia</asp:LinkButton>
    <br />
    <br />
    <asp:TextBox ID="txt_CodigoDocentes" runat="server"></asp:TextBox>
    <asp:LinkButton ID="txt_ConfirmarCodigo" runat="server">Asistir</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="Link_CerrarCurso" runat="server" OnClick="Link_CerrarCurso_Click">CerrarCurso</asp:LinkButton>
</asp:Content>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<s:url action="a_homepage"  var="cambiarIdioma_EEUUUrl">
	<s:param name="request_locale">en</s:param>
</s:url>
<s:url action="a_homepage" var="cambiarIdioma_FranciaUrl">
	<s:param name="request_locale">fr</s:param>
</s:url>
<s:url action="a_homepage" var="cambiarIdioma_PeruUrl">
	<s:param name="request_locale"></s:param>
</s:url>
<s:url action="a_homepage" var="cambiarIdioma_ArabeUrl">
	<s:param name="request_locale">ar</s:param>
</s:url>


<s:url value="/images/USA.png" var="USAImgUrl"/>
<s:url value="/images/France.png" var="FranciaImgUrl"/>
<s:url value="/images/Peru.png" var="PeruImgUrl"/>
<s:url value="/images/Arabe.png" var="ArabeImgUrl"/>

<body>
    <h1><s:text name="app.tituloaplicacion"/></h1>
    <div style="margin-top: 15px">
    	<a href="${cambiarIdioma_PeruUrl}" title="<s:text name="pages.guicomun.idioma.espanol"/>"><img alt="Perú" src="${PeruImgUrl}"></a> 
    	<a href="${cambiarIdioma_FranciaUrl}" title="<s:text name="pages.guicomun.idioma.frances"/>"><img alt="Francia" src="${FranciaImgUrl}"></a> 
    	<a href="${cambiarIdioma_EEUUUrl}" title="<s:text name="pages.guicomun.idioma.ingles"/>"><img alt="EEUU" src="${USAImgUrl}"></a> 
    	<a href="${cambiarIdioma_ArabeUrl}" title="<s:text name="pages.guicomun.idioma.arabe"/>"><img alt="Arabe" src="${ArabeImgUrl}"></a> 
    </div>
</body>
</html>
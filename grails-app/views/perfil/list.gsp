
<%@ page import="norris.Perfil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'perfil.label', default: 'Perfil')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'perfil.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="tipo" title="${message(code: 'perfil.tipo.label', default: 'Tipo')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${perfilInstanceList}" status="i" var="perfilInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${perfilInstance.id}">${fieldValue(bean: perfilInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: perfilInstance, field: "tipo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${perfilInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

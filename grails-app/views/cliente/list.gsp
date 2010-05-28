
<%@ page import="norris.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'cliente.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'cliente.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="documento" title="${message(code: 'cliente.documento.label', default: 'Documento')}" />
                        
                            <g:sortableColumn property="url" title="${message(code: 'cliente.url.label', default: 'Url')}" />
                        
                            <g:sortableColumn property="ativo" title="${message(code: 'cliente.ativo.label', default: 'Ativo')}" />
                        
                            <g:sortableColumn property="razao" title="${message(code: 'cliente.razao.label', default: 'Razao')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "documento")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "url")}</td>
                        
                            <td><g:formatBoolean boolean="${clienteInstance.ativo}" /></td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "razao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

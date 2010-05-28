
<%@ page import="norris.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${clienteInstance}">
            <div class="errors">
                <g:renderErrors bean="${clienteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${clienteInstance?.id}" />
                <g:hiddenField name="version" value="${clienteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="cliente.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${clienteInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="documento"><g:message code="cliente.documento.label" default="Documento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'documento', 'errors')}">
                                    <g:textField name="documento" value="${fieldValue(bean: clienteInstance, field: 'documento')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="url"><g:message code="cliente.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${clienteInstance?.url}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ativo"><g:message code="cliente.ativo.label" default="Ativo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'ativo', 'errors')}">
                                    <g:checkBox name="ativo" value="${clienteInstance?.ativo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="razao"><g:message code="cliente.razao.label" default="Razao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'razao', 'errors')}">
                                    <g:textField name="razao" value="${clienteInstance?.razao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone"><g:message code="cliente.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" value="${clienteInstance?.telefone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="projetos"><g:message code="cliente.projetos.label" default="Projetos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'projetos', 'errors')}">
                                    <g:select name="projetos" from="${norris.Projeto.list()}" multiple="yes" optionKey="id" size="5" value="${clienteInstance?.projetos*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endereco"><g:message code="cliente.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'endereco', 'errors')}">
                                    <g:textField name="endereco" value="${clienteInstance?.endereco}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuarios"><g:message code="cliente.usuarios.label" default="Usuarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'usuarios', 'errors')}">
                                    
<ul>
<g:each in="${clienteInstance?.usuarios?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="usuario" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

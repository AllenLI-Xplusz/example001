
<%@ page import="example001.Record" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'record.label', default: 'Record')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-record" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-record" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="starttime" title="${message(code: 'record.starttime.label', default: 'Starttime')}" />
					
						<g:sortableColumn property="endtime" title="${message(code: 'record.endtime.label', default: 'Endtime')}" />
					
						<g:sortableColumn property="types" title="${message(code: 'record.types.label', default: 'Types')}" />
					
						<g:sortableColumn property="reason" title="${message(code: 'record.reason.label', default: 'Reason')}" />
					
						<th><g:message code="record.users.label" default="Users" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recordInstanceList}" status="i" var="recordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recordInstance.id}">${fieldValue(bean: recordInstance, field: "starttime")}</g:link></td>
					
						<td><g:formatDate date="${recordInstance.endtime}" /></td>
					
						<td>${fieldValue(bean: recordInstance, field: "types")}</td>
					
						<td>${fieldValue(bean: recordInstance, field: "reason")}</td>
					
						<td>${fieldValue(bean: recordInstance, field: "users")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recordInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

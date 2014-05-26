
<%@ page import="example001.Record" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'record.label', default: 'Record')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-record" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
               <g:if test="${flash.isadmin=='true'}">

				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>

               </g:if>

				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-record" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list record">
			
				<g:if test="${recordInstance?.starttime}">
				<li class="fieldcontain">
					<span id="starttime-label" class="property-label"><g:message code="record.starttime.label" default="Starttime" /></span>
					
						<span class="property-value" aria-labelledby="starttime-label"><g:formatDate date="${recordInstance?.starttime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recordInstance?.endtime}">
				<li class="fieldcontain">
					<span id="endtime-label" class="property-label"><g:message code="record.endtime.label" default="Endtime" /></span>
					
						<span class="property-value" aria-labelledby="endtime-label"><g:formatDate date="${recordInstance?.endtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recordInstance?.types}">
				<li class="fieldcontain">
					<span id="types-label" class="property-label"><g:message code="record.types.label" default="Types" /></span>
					
						<span class="property-value" aria-labelledby="types-label"><g:fieldValue bean="${recordInstance}" field="types"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recordInstance?.reason}">
				<li class="fieldcontain">
					<span id="reason-label" class="property-label"><g:message code="record.reason.label" default="Reason" /></span>
					
						<span class="property-value" aria-labelledby="reason-label"><g:fieldValue bean="${recordInstance}" field="reason"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recordInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="record.users.label" default="Users" /></span>
					
						<span class="property-value" aria-labelledby="users-label"><g:link controller="users" action="show" id="${recordInstance?.users?.id}">${recordInstance?.users?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
<g:if test="${flash.isadmin=='true'}">
			<g:form url="[resource:recordInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${recordInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
    </g:if>
		</div>
	</body>
</html>

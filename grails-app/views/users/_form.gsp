<%@ page import="example001.Users" %>



<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="users.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${usersInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="users.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${usersInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'record', 'error')} " hidden="true">
	<label for="record">
		<g:message code="users.record.label" default="Record" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usersInstance?.record?}" var="r">
    <li><g:link controller="record" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="record" action="create" params="['users.id': usersInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'record.label', default: 'Record')])}</g:link>
</li>
</ul>

</div>


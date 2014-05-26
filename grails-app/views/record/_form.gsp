<%@ page import="example001.Record" %>



<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'starttime', 'error')} required">
	<label for="starttime">
		<g:message code="record.starttime.label" default="Starttime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="starttime" precision="day"  value="${recordInstance?.starttime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'endtime', 'error')} required">
	<label for="endtime">
		<g:message code="record.endtime.label" default="Endtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endtime" precision="day"  value="${recordInstance?.endtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'types', 'error')} ">
	<label for="types">
		<g:message code="record.types.label" default="Types" />
		
	</label>
	<g:select name="types" from="${recordInstance.constraints.types.inList}" value="${recordInstance?.types}" valueMessagePrefix="record.types" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'reason', 'error')} required">
	<label for="reason">
		<g:message code="record.reason.label" default="Reason" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reason" maxlength="20" required="" value="${recordInstance?.reason}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'users', 'error')} required" hidden="true">
	<label for="users">
		<g:message code="record.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="users" name="users.id" from="${example001.Users.list()}" optionKey="id" required="" value="${recordInstance?.users?.id}" class="many-to-one"/>
</div>


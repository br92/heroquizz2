<%@ page import="heroquizz.Quizz" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'quizz.label', default: 'Quizz')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<ul class="nav nav-pills">
  <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
  <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
</ul>

<div class="row">
  <div class="span12">

    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${quizzInstance}">
      <ul class="errors" role="alert">
      <g:eachError bean="${quizzInstance}" var="error">
        <li<g:if
          test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
          error="${error}"/></li>
      </g:eachError>
      </ul>
    </g:hasErrors>
  </div>
</div>

<div class="row">
  <div class="span12">
    <g:form method="post" class="form-horizontal">
      <fieldset>
        <legend><g:message code="default.edit.label" args="[entityName]"/></legend>

        <g:render template="form"/>

        <div class="form-actions">
          <g:actionSubmit class="btn btn-primary" action="update"
                          value="${message(code: 'default.button.update.label', default: 'Update')}"/>
          <g:actionSubmit class="btn btn-danger" action="delete"
                          value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                          onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </div>

        <g:hiddenField name="id" value="${quizzInstance?.id}"/>
        <g:hiddenField name="version" value="${quizzInstance?.version}"/>
      </fieldset>
    </g:form>
  </div>
</div>
</body>
</html>

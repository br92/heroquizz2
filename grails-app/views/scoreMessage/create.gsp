<%@ page import="heroquizz.ScoreMessage" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'scoreMessage.label', default: 'ScoreMessage')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<ul class="nav nav-pills">
  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
  <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
</ul>

<div id="create-scoreMessage" class="content scaffold-create" role="main">
  <h1><g:message code="default.create.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${scoreMessageInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${scoreMessageInstance}" var="error">
        <li<g:if
               test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
            error="${error}"/></li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:form action="save">
    <fieldset class="form">
      <g:render template="form"/>
    </fieldset>
    <fieldset class="form-actions">
      <g:submitButton name="create" class="btn btn-primary"
                      value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
  </g:form>
</div>
</body>
</html>

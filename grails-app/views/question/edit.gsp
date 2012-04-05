<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div class="row">
  <div class="span12">

    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${questionInstance}">
      <ul class="errors" role="alert">
      <g:eachError bean="${questionInstance}" var="error">
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
      <legend><g:message code="default.edit.label" args="[entityName]"/></legend>

      <fieldset class="form">
        <g:render template="form"/>

        <g:hiddenField name="id" value="${questionInstance?.id}"/>
        <g:hiddenField name="version" value="${questionInstance?.version}"/>

        <div class="form-actions">
          <g:actionSubmit class="btn btn-primary" action="update"
                          value="${message(code: 'default.button.update.label', default: 'Update')}"/>
          <g:actionSubmit class="btn btn-danger" action="delete"
                          value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                          onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </div>
      </fieldset>

    </g:form>
  </div>
</body>

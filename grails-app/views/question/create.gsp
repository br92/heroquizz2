<%@ page import="heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div class="row">
  <div class="span12">
    <ul class="breadcrumb">
      <li>
        <g:link controller="quizz" action="show" id="${forQuizz.id}">${forQuizz.name}</g:link>
        <span class="divider">/</span>
      </li>
      <li class="active">
        <a href="#">Create question</a>
      </li>
    </ul>
  </div>
</div>


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
    <g:form action="save" class="form-horizontal">
      <fieldset>
        <legend><g:message code="default.create.label" args="[entityName]"/></legend>

        <g:render template="form"/>

        <div class="form-actions">
          <g:submitButton name="create" class="btn btn-primary"
                          value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </div>
      </fieldset>

    </g:form>
  </div>
</div>
</body>
</html>

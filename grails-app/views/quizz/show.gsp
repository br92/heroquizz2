<%@ page import="heroquizz.Quizz" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'quizz.label', default: 'Quizz')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<ul class="nav nav-pills">
  <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
  <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
</ul>

<div class="row">
  <div class="span12">

    <legend><g:message code="default.show.label" args="[entityName]"/></legend>

    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <dl class="dl-horizontal quizz">

      <g:if test="${quizzInstance?.name}">
        <dt>
          <span id="name-label" class="property-label"><g:message code="quizz.name.label" default="Name"/></span>
        </dt>
        <dd>
          <span class="property-value" aria-labelledby="name-label">
            <g:fieldValue bean="${quizzInstance}" field="name"/>
          </span>
        </dd>
      </g:if>

      <g:if test="${quizzInstance?.description}">
        <dt>
          <span id="description-label" class="property-label"><g:message code="quizz.description.label"
                                                                         default="Description"/></span>
        </dt>
        <dd>
          <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${quizzInstance}"
                                                                                         field="description"/></span>
        </dd>
        </li>
      </g:if>

      <g:if test="${quizzInstance?.questions}">
        <dt>
          <span id="questions-label" class="property-label"><g:message code="quizz.questions.label"
                                                                       default="Questions"/></span>
        </dt>
        <dd>
          <ol>
            <g:each in="${quizzInstance.questions}" var="q">
              <li><g:link controller="question" action="show" id="${q.id}">${q?.text?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ol>

        </dd>
      </g:if>

      <g:if test="${quizzInstance?.scoreMessages}">
        <dt>
          <span id="scores-label" class="property-label"><g:message code="quizz.scores.label"
                                                                    default="Score messages"/></span>
        </dt>
        <dd>
          <ul>
            <g:each in="${quizzInstance.scoreMessages}" var="q">
              <li><g:link controller="scoreMessage" action="show"
                          id="${q.id}">${q?.message?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>

        </dd>
      </g:if>

    </dl>
    <g:form>
      <fieldset>
        <g:hiddenField name="id" value="${quizzInstance?.id}"/>
        <div class="form-actions">
          <g:link class="btn btn-primary" action="edit" id="${quizzInstance?.id}"><g:message
              code="default.button.edit.label"
              default="Edit"/></g:link>
          <g:link class="btn btn-info" controller="question" action="create"
                  id="${quizzInstance?.id}">Add question</g:link>

          <g:link class="btn btn-info" controller="scoreMessage" action="create"
                  id="${quizzInstance?.id}">Add score message</g:link>

          <g:actionSubmit class="btn btn-success" action="publish" id="${quizzInstance?.id}"
                          value="Publish"
                          onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>

          <g:actionSubmit class="btn btn-dark" action="delete"
                          value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                          onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>

        </div>
      </fieldset>
    </g:form>
  </div>
</div>
</body>
</html>

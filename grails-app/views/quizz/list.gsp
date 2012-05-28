<%@ page import="heroquizz.Quizz" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'quizz.label', default: 'Quizz')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<ul class="nav nav-pills">
  <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
</ul>

<div class="row">
  <div class="span12">

    <legend><g:message code="default.list.label" args="[entityName]"/></legend>

    <g:if test="${flash.message}">
      <div class="label label-info" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-bordered">
      <thead>
      <tr>

        <g:sortableColumn property="name" title="${message(code: 'quizz.name.label', default: 'Name')}"/>

        <g:sortableColumn property="description"
                          title="${message(code: 'quizz.description.label', default: 'Description')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${quizzInstanceList}" status="i" var="quizzInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show"
                      id="${quizzInstance.id}">${fieldValue(bean: quizzInstance, field: "name")}</g:link></td>

          <td>${fieldValue(bean: quizzInstance, field: "description")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>

    <div class="pagination">
      <g:paginate total="${quizzInstanceTotal}"/>
    </div>
  </div>
</div>
</body>
</html>

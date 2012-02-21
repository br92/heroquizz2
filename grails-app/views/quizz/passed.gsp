<%@ page import="heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div>
  <h1>Resultat</h1>

  <g:form>
    <ol class="property-list question">

      <li class="fieldcontain">
        ${session.currentScore}

      </li>

  </g:form>
</div>
</body>
</html>

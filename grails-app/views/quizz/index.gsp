<%@ page import="heroquizz.Quizz; heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="canvas">
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="hero-unit">
<h1>
 Quizz technique
</h1>
  <p>Mess with the best, die like the rest</p>
  
  <g:each in="${Quizz.findByPublished(true)}" var="quizzInstance">
    <g:link action="take" id="${quizzInstance?.id}">${quizzInstance?.name?.encodeAsHTML()}</g:link>
  </g:each>
</div>

</body>
</html>


<%@ page import="heroquizz.ScoreMessage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scoreMessage.label', default: 'ScoreMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-scoreMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-scoreMessage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="message" title="${message(code: 'scoreMessage.message.label', default: 'Message')}" />
					
						<g:sortableColumn property="minimum" title="${message(code: 'scoreMessage.minimum.label', default: 'Minimum')}" />
					
						<th><g:message code="scoreMessage.quizz.label" default="Quizz" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${scoreMessageInstanceList}" status="i" var="scoreMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${scoreMessageInstance.id}">${fieldValue(bean: scoreMessageInstance, field: "message")}</g:link></td>
					
						<td>${fieldValue(bean: scoreMessageInstance, field: "minimum")}</td>
					
						<td>${fieldValue(bean: scoreMessageInstance, field: "quizz")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${scoreMessageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

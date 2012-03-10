<%@ page import="heroquizz.Quizz" %>

<div class="fieldcontain ${hasErrors(bean: quizzInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="quizz.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="100" value="${quizzInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: quizzInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="quizz.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="255" value="${quizzInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: quizzInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="quizz.questions.label" default="Questions" />
		
	</label>
	<g:select name="questions" from="${heroquizz.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${quizzInstance?.questions*.id}" class="many-to-many"/>
</div>


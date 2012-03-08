<%@ page import="heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="canvas">
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<r:require module="jwplayer"/>

<div class="hero-unit">
  <div style=" width: 100%">
  <div id='mediaplayer' style="text-align: center;"></div>
  </div>
  <r:script>
    jwplayer('mediaplayer').setup({
      'flashplayer': '${resource(dir: 'flash', file: 'player.swf')}',
      'id': 'playerID',
      'autostart': true,
      'width': '480',
      'height': '270',
      'file': 'https://s3-eu-west-1.amazonaws.com/xebia-video/2011-10-elastic-search-vs-solr.mp4'
    });
  </r:script>

  <p><g:fieldValue bean="${questionInstance}" field="text"/></p>

  <g:form action="answer">
    <fieldset>
      <g:hiddenField name="currentQuestionId" value="${questionInstance?.id}"/>
      <div class="clearfix">
        <div class="input">
          <ul class="inputs-list">
            <g:each in="${questionInstance.answers}" var="a">
              <li>
                <label>
                  <g:checkBox name="answers" value="${a.id}" checked="${false}"/>
                  <span>${a?.text?.encodeAsHTML()}</span>
                </label>
              </li>
            </g:each>

          </ul>
        </div>
      </div>
    </fieldset>

    <div class="actions">
      <g:submitButton name="submit" value="Valider" class="btn primary" />
    </div>
  </g:form>
</div>

</body>
</html>

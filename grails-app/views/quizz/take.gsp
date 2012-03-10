<head>
  <meta name="layout" content="canvas">
</head>

<body>
<r:require module="jwplayer"/>

<div class="hero-unit">
  <g:if test="${questionInstance.videoUrl}">
    <div class="video-container">
      <div id='mediaplayer'></div>
    </div>
    <r:script>
    jwplayer('mediaplayer').setup({
      'flashplayer': '${resource(dir: 'flash', file: 'player.swf')}',
      'id': 'playerID',
      'width': '640',
      'autostart': false,
      'backgroundColor': 'transparent',
      'file': '${questionInstance.videoUrl}'
    });
    </r:script>
  </g:if>
  <g:else>
    <p><g:fieldValue bean="${questionInstance}" field="text"/></p>
  </g:else>

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
      <g:submitButton name="submit" value="Valider" class="btn primary"/>
    </div>
  </g:form>
</div>

</body>
</html>

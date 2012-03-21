<head>
  <meta name='layout' content='main'/>
  <title><g:message code="springSecurity.login.title"/>
  </title>
</head>

<body>

<div class="row">
  <div class="span8 offset2">
    <div class="hero-unit">

      <form action='${postUrl}' method='POST' id='loginForm' class='form-horizontal'>

        <div class="clearfix">
          <label for='username'><g:message
              code="springSecurity.login.username.label"/>:</label>

          <div class="input">
            <input type='text' class='text_' name='j_username' id='username'/>
          </div>
        </div>

        <div class="clearfix">
          <label for='password'><g:message
              code="springSecurity.login.password.label"/>:</label>

          <div class="input">
            <input type='password' class='text_' name='j_password'
                   id='password'/>
          </div>
        </div>

        <div class="clearfix">
          <label for='remember_me'><g:message
              code="springSecurity.login.remember.me.label"/>
          </label>

          <div class="input">
            <input type='checkbox'
                   class='chk'
                   name='${rememberMeParameter}'
                   id='remember_me'
                   <g:if test='${hasCookie}'>checked='checked'</g:if>/>
          </div>
        </div>

        <div class="actions">
          <input type='submit'
                 class="btn primary"
                 id="submit"
                 value='${message(code: "springSecurity.login.button")}'/>

          <g:render template="/commons/facebook-button"/>
        </div>

      </form>
    </div>
  </div>
</div>


<r:script>
  $('#username').focus();
</r:script>

</body>
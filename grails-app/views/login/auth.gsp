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

          <div id="fb-root"></div>
          <script>
            window.fbAsyncInit = function() {
              FB.init({
                appId  : '302026516518035',
                status : true,
                cookie : true,
                xfbml  : true,
                oauth  : true
              });

              FB.Event.subscribe('auth.authResponseChange', function(response) {
                alert('connected');
                location = '<g:createLink controller="quizz"/>';
              });

              FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
                  alert('connected');
                  var uid = response.authResponse.userID;
                  var accessToken = response.authResponse.accessToken;
                } else if (response.status === 'not_authorized') {
                  alert('not auth');
                  // the user is logged in to Facebook,
                  // but has not authenticated your app
                } else {
                  // the user isn't logged in to Facebook.
                  alert('not at all');
                }
              });
            };
            (function(d){var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}js = d.createElement('script'); js.id = id; js.async = true;js.src = "//connect.facebook.net/en_US/all.js";d.getElementsByTagName('head')[0].appendChild(js);}(document));
          </script>
          <div class="fb-login-button" data-scope="email,publish_stream" data-show-faces="false">Login with Facebook</div>
        </div>

      </form>
    </div>
  </div>
</div>


<r:script>
  $('#username').focus();
</r:script>

</body>
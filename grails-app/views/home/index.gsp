<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

	</head>
	<body>

		<div id="page-body" role="main">
			<h1>Welcome to HeroQuizz</h1>
			<p>Application démonstratrice Grails Heroku</p>
			<p>
      <fb:login-button scope="email,publish_stream" onlogin="facebookLogin();" size="large">
        <g:message code="auth.login.facebook" default="Connect with Facebook"/>
      </fb:login-button></p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>

      <fbg:resources/>
		</div>
	</body>
</html>

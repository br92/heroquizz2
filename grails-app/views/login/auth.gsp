<head>
    <meta name='layout' content='main'/>
    <title>
        <g:message code="app.title"/> - <g:message code="springSecurity.login.title"/>
    </title>
</head>

<body>
<div class="row">
    <div class="span6 offset3 well">

        <form action="${postUrl}" method="POST" class="form-horizontal">

            <fieldset>
                <div class="control-group">
                    <label class="control-label">
                        <h1>Connexion</h1>
                    </label>

                </div>

                <div class="control-group">
                    <div class="controls">
                        <g:render template="/commons/facebook-button"/>
                    </div>
                </div>

                <div class="control-group">

                    <div class="controls">
                        ou
                    </div>
                </div>


                <div class="control-group">
                    <label for="username" class="control-label">
                        <g:message code="springSecurity.login.username.label"/> :
                    </label>

                    <div class="controls">
                        <input type="text" name="j_username" id="username"/>
                    </div>
                </div>

                <div class="control-group">
                    <label for="password" class="control-label">
                        <g:message code="springSecurity.login.password.label"/> :
                    </label>

                    <div class="controls">
                        <input type="password" class="input-large" name="j_password" id="password"/>
                    </div>
                </div>

                <div class="control-group">
                    <label for='remember_me' class="control-label">
                        <g:message code="springSecurity.login.remember.me.label"/>
                    </label>

                    <div class="controls">
                        <input type='checkbox'
                               name='${rememberMeParameter}'
                               id='remember_me'
                               <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                    </div>
                </div>

                <div class="form-actions">
                    <input type='submit'
                           class="btn btn-primary"
                           id="submit"
                           value='${message(code: "springSecurity.login.button")}'/>

                </div>
            </fieldset>
        </form>
    </div>
</div>

<r:script>
    $(function () {
        $('#username').focus();
    });
</r:script>

</body>
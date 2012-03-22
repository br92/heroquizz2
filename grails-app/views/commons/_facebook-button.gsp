<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId:'${grailsApplication.config.grails.plugins.springsecurity.facebook.appId}',
            status:true,
            cookie:true,
            xfbml:true,
            oauth:true
        });

        FB.Event.subscribe('auth.authResponseChange', function (response) {
            $('#facebook-connect').hide();
            $('#facebook-like').show();
        });

        FB.getLoginStatus(function (response) {
            if (response.status === 'connected') {
                var uid = response.authResponse.userID;
                var accessToken = response.authResponse.accessToken;
                $('#facebook-connect').hide();
                $('#facebook-like').show();
            }
        });
    };
    (function (d) {
        var js, id = 'facebook-jssdk';
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement('script');
        js.id = id;
        js.async = true;
        js.src = "//connect.facebook.net/en_US/all.js";
        d.getElementsByTagName('head')[0].appendChild(js);
    }(document));
</script>

<div class="fb-login-button" data-scope="email,publish_stream" data-show-faces="false"><g:message
        code="facebook.connect.button"/></div>
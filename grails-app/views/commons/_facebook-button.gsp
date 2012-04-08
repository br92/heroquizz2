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

    FB.Event.subscribe('auth.login', function (response) {
      $('#facebook-connect').hide();
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

<div class="fb-login-button" data-scope="email,publish_stream" data-show-faces="true">
  <g:message code="facebook.connect.button"/>
</div>
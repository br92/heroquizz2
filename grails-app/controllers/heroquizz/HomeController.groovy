package heroquizz

class HomeController {

  def facebookGraphService

  def index() {
    def profile = facebookGraphService.getFacebookProfile()
    println ("profile : $profile")
    [profile: profile]
  }
}

import Common from "./common.js"

class YoutubeSuccess extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.showClock()
    this.fillform()
    this.showTab(this.currentTab);
    this.openPopup()

    $( "#btn-continue" ).click(() => {
      CI.nextStep(1)
    });
    $( "#btn-back" ).click(function() {
      CI.backStep(-1)
    });
  }

  openPopup(){
    var CI = this;
    $('.open-popup').click(function(event) {
      CI.details.success_url = event.currentTarget.href
      event.preventDefault()
      $('#deal-form-modal').modal('show')
    });
  }
}
export default new YoutubeSuccess();

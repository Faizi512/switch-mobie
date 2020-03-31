import Common from "./common.js"

class NewMmd extends Common {
  constructor() {
    super();
    var CI = this;
    this.getFormDetails('.mt-footer')
    this.postData()
    this.showToolTip()
    this.showClock()

    $('.submit-mmd-form').click(function(event) {
      window.location = CI.details.success_url+CI.additionalParams();
    });
  }
  successUrl(){
  }
}

export default new NewMmd();

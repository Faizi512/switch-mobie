import Common from "./common.js"

class NewMmd extends Common {
  constructor() {
    super();
    var CI = this;
    this.getFormDetails('.mt-footer')
    this.showToolTip()
    this.showClock()
    $('.submit-mmd-form').click(function(event) {
      $('.but_loader').show()
      event.preventDefault();
      if (CI.submtForm == false) {
        CI.submtForm = true;
        CI.postData()
      }
    });
  }
  successUrl(){
    var CI = this;
    setTimeout(function(){
      window.location = CI.details.success_url+"/?s1=" + CI.getSource() + "&s2=" + CI.getC1();
    }, 1000)
  }
}

export default new NewMmd();

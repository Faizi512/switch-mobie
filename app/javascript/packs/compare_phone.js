import Common from "./common.js"

class ComparePhone extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.showClock()
    this.fillform()
    this.showTab(this.currentTab);

    $( "#btn-continue" ).click(() => {
      CI.nextStep(1)
    });
    $( "#btn-back" ).click(function() {
      CI.backStep(-1)
    });

    $('.open-form').click((event) => {
      $('#deal-form-modal').modal('show')
      $('.clock').hide()
      event.preventDefault();
    });
  }

  successUrl(){
    var CI = this;
    setTimeout(function(){
      window.location = CI.details.success_url+"/?s1=" + CI.getSource() + "&s2=" + CI.getC1();
    }, 1000)
  }
}
export default new ComparePhone();

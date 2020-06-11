import Common from "./common.js"

class SimDealOnly extends Common {
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

    $(document).on("click", '.open-form', function() {
      $('#deal-form-modal').modal('show')
      $('.clock').hide()
      event.preventDefault();
    });
  }
  additionalParams(){
    return "&s1=" + this.getSource() + "&s2=" + this.getC1() + "&s3=" + this.getEmail() + "&s4=" + this.getPhone1() ;
  }
}
export default new SimDealOnly();

import Common from "./common.js"

class ReturningLoans extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.showClock()
    this.showTab(this.currentTab);
    this.openPopup()
    this.continueButton()
  }


  openPopup(){
    var CI = this;
    $('.open-form').click(function(event) {
      event.preventDefault()
      $('#deal-form-modal').modal('show')
    });
  }

  continueButton(){
    var CI = this;
    $('.form-submit').click(function () {
      $('#dealform').parsley().whenValidate({
          group: 'block-2'
      }).done(function() {
        if (CI.submtForm == false) {
          CI.submtForm = true;
          event.preventDefault();
          $('.form-submit').prop('disabled', true);
          CI.postData()
        }
      })
    })
  }

  successUrl(){
    var CI = this;
    setTimeout(function(){
      if( CI.isBadCustomer(CI.getUrlParameter('keyword')) ||  (CI.getUrlParameter('bc') == "yes")){
        window.location = "https://www.megamobiledeals.com/no-credit-check-deals/?s1=" + CI.getSource() + "&s2=" + CI.getC1();
      }else{
        window.location = CI.details.success_url+"/?s1=" + CI.getSource() + "&s2=" + CI.getC1();
      }
    }, 1000)
  }
}
export default new ReturningLoans();

import Common from "./common.js"

class MmdLoanTwo extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.showTab(this.currentTab);
    this.openPopup()
    this.acceptTerms()
    this.redirectUrl()
    $("#name").html(this.getUrlParameter("firstname"));
  }

  successUrl(){}

  openPopup(){
    var CI = this;
    $('.open-popup').click(function(event) {
      CI.details.success_url = event.currentTarget.href
      let img_source = $(this).find('input').val()
      $("#clicked_img").attr("src",img_source)
      event.preventDefault()
      $('#deal-form-modal').modal('show')
    });
  }

  acceptTerms(){
    var CI = this;
    $('.terms-and-conditions').click(function () {
      if ($('.terms-and-conditions').prop("checked")){
        if (CI.submtForm == false) {
          CI.submtForm = true;
          CI.postData()
        }
        $('.redirect-to-success').prop('disabled', false);
      }
    })
  }

  redirectUrl(){
    var CI = this;
    $('.redirect-to-success').click(function() {
      if ($('.terms-and-conditions').prop("checked")){
        event.preventDefault();
        window.location = CI.details.success_url;
      }
    });
  }
}
export default new MmdLoanTwo();


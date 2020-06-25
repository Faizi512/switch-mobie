import Common from "./common.js"

class EDeals extends Common {
  constructor() {
    super();
    var CI = this;
    this.getFormDetails('#dealform')
    this.showToolTip()

    $( ".save-energy" ).change(function() {
      if ($("input[name='save-energy']:checked").val() == "yes") {
        $(".form").addClass("in-progress")
        window.location = CI.details.success_url + CI.paramsforSuccess()
      }else {
        $(".form").addClass("in-progress")
        window.location = CI.details.bad_success_url + CI.additionalParamsFoBC()
      }
    });
  }
}
export default new EDeals();

import Common from "./common.js"

class MmdSuccess extends Common {
  constructor() {
    super();
    var CI = this
    this.getFormDetails('#dealform')
    this.postData()
    $('a').click((event) => {
      event.preventDefault();
      window.location = CI.details.success_url+CI.additionalParams()
    });
  }
  successUrl(){}

}
export default new MmdSuccess();


import Common from "./common.js"

class Returning extends Common {
  constructor() {
    super();
    var CI = this;
    this.getFormDetails('#dealform')
    this.postData()
    this.showToolTip()
    this.showClock()

    $('.open-form').click((event) => {
      window.location = CI.details.success_url+CI.additionalParams()
    });
  }

  successUrl(){
  }

}
export default new Returning();

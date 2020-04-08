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
      CI.urlSelection()
    });
  }

  successUrl(){
  }

}
export default new Returning();

import Common from "./common.js"

class Returning extends Common {
  constructor() {
    super();
    var CI = this;
    this.getFormDetails('#dealform')
    this.postData()
    this.showToolTip()
    this.showClock()

    $(document).on("click", '.open-form', function() {
      CI.urlSelection()
    });
  }

  successUrl(){
  }

}
export default new Returning();

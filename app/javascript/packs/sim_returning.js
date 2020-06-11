import Common from "./common.js"

class SimReturning extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.showClock()
    this.fillform()
    this.showTab(this.currentTab);

    $(document).on("click", '.open-form', function() {
      event.preventDefault();
      if (CI.submtForm == false) {
        CI.submtForm = true;
        CI.postData()
      }
    });
  }
}
export default new SimReturning();

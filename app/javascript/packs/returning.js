import Common from "./common.js"

class Returning extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.showClock()
    this.fillform()
    this.showTab(this.currentTab);

    $('.open-form').click((event) => {
      event.preventDefault();
      if (CI.submtForm == false) {
        CI.submtForm = true;
        CI.postData()
      }
    });
  }

  successUrl(){
    var CI = this;
    setTimeout(function(){
      window.location = CI.details.success_url+"/?s1=" + CI.getSource() + "&s2=" + CI.getC1();
    }, 1000)
  }

}
export default new Returning();

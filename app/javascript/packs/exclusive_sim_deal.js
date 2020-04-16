import Common from "./common.js"

class ExclusiveSimDeal extends Common {
  constructor() {
    super();
    var CI = this
    this.getFormDetails('#dealform')
    this.postData()
    $('a').click((event) => {
      event.preventDefault();
      CI.urlSelection()
    });
  }
  successUrl(){}
}
export default new ExclusiveSimDeal();
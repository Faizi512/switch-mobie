import Common from "./common.js"

class RmktgAwin extends Common {
  constructor() {
    super();
    var CI = this
    this.getFormDetails('#dealform')
    this.postData()
    $('a').click((event) => {
    });
  }
  successUrl(){}
}
export default new RmktgAwin();

import Common from "./common.js"

class RmktgAwin extends Common {
  constructor() {
    super();
    var CI = this
    this.getFormDetails('#dealform')
    
    if (this.getUrlParameter('sms') == 'true') {
      this.postData()
    }
    
  }
  successUrl(){}
}
export default new RmktgAwin();

import Common from "./common.js"

class RmktgSweet extends Common {
  constructor() {
    super();
    var CI = this
    this.getFormDetails('#dealform')
    this.postData()
    
  }
  successUrl(){}
}
export default new RmktgSweet();

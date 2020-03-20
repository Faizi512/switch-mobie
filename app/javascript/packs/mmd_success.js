import Common from "./common.js"

class MmdSuccess extends Common {
  constructor() {
    super();
    this.getFormDetails('#dealform')
    this.postData()
  }
  successUrl(){}
}
export default new MmdSuccess();


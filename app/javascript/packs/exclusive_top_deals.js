import Common from "./common.js"

class ExclusiveTopDeals extends Common {
  constructor() {
    super();
    this.getFormDetails('#dealform')
    this.postData()
    $('.color-box').click((event) => {
      $('#s10-img').attr("src", $(event.currentTarget).data("image"));
      $('#deal-link').attr("href", $(event.currentTarget).data("url"));
    });
  }
  successUrl(){}
}
export default new ExclusiveTopDeals();
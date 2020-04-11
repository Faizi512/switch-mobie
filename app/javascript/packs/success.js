import Common from "./common.js"

class Success extends Common {
  constructor() {
    super();
    var CI = this;
    $('.color-box').click((event) => {
      $('#s10-img').attr("src", $(event.currentTarget).data("image"));
      $('#deal-link').attr("href", $(event.currentTarget).data("url"));
    });
  }
}
export default new Success();
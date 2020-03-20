import Common from "./common.js"

class Youtube extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#mmd-deals")
    this.showToolTip()
    this.showTab(this.currentTab);
    this.acceptTerms()
    this.redirectUrl()
    $("#name").html(this.getUrlParameter("firstname"));
  }

  acceptTerms(){
    var CI = this;
    $('.terms-and-conditions').click(function () {
      if ($('.terms-and-conditions').prop("checked") && CI.isPhone){
        if (CI.submtForm == false) {
          CI.submtForm = true;
          CI.postData()
        }
        $('.redirect-to-success').prop('disabled', false);
      }else{
        $('#mmd-deals').parsley().validate();
      }
    })
  }

  redirectUrl(){
    var CI = this;
    $('.redirect-to-success').click(function() {
      if ($('.terms-and-conditions').prop("checked") && CI.isPhone == true){
        var phoneValue = $("#phone-num").val();
        window.location = "/youtube-success/?phone1=" + phoneValue +"&source="+ CI.getSource() + "&c1=" +CI.getC1();
      }
    });
  }

  getData() {
    var customer_type = this.isBadCustomer( this.getUrlParameter('keyword')) || (this.getUrlParameter('bc') == "yes");
    return {
      phone1: $("#phone-num").val(),
      sid: this.getUrlParameter('sid') || 1,
      ssid: this.getUrlParameter('ssid') || 1,
      ad_set:this.getUrlParameter('ad_set') || 1,
      source: this.getUrlParameter('source') || 'google3',
      c1: this.getUrlParameter('c1') || '',
      adgroupid: this.getUrlParameter('adgroupid') || '',
      campaign: this.getUrlParameter('campaign') || '',
      keyword: this.getUrlParameter('keyword') || '',
      bad_credit_customer: (customer_type) ? "yes" : "no",
      campaignkey: 'E9F2N6A3R5',
      optindate: this.getFormattedCurrentDate(),
      optinurl: 'deals.megamobiledeals.com/youtube',
      ipaddress: this.ip_Address,
      trafficid: this.getUrlParameter('trafficid') || "MMD-M",
      prize: this.getUrlParameter('prize') || 35,
      timestamp: new Date,
      user_agent: window.navigator.userAgent,
    };
  }

  postData() {
    var data = this.getData();
    $.ajax({
      type: "POST",
      url: "https://go.webformsubmit.com/dukeleads/waitsubmit?key=eecf9b6b61edd9e66ca0f7735dfa033a&campid=MMD-M",
      data: data,
      dataType: "json",
      success: function(e) {
      }
    })
  }

  validatePhone(){
    var CI = this
    window.Parsley.addValidator('validphone', {
      validateString: function(value){
        var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/mobile?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.phone-num').val())
        return xhr.then(function(json) {
          if (json.status == "Valid") {
            CI.isPhone = true
            if ($('#checkbox').prop("checked") && CI.isPhone == true && CI.submtForm == false){
              CI.postData()
              $('.btn-deals').prop('disabled', false);
            }
            return true
          }else{
            return $.Deferred().reject("Please Enter Valid UK Phone Number");
          }
        })
      },
      messages: {
         en: 'Please Enter Valid UK Phone Number',
      }
    });
  }

}
export default new Youtube();

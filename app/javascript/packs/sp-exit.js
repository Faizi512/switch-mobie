import Common from "./common.js"

class SpExit extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#energyform")
    this.getFormDetails('#energyform')
    this.showToolTip()

    $('#btn-submit').click(function(event) {
      CI.showCircle();
      $('#energyform').parsley().whenValidate().done(() =>{
      CI.postData();
      })
    });

    window.Parsley.on('field:error', function() {
      $(".btn-success").removeClass("in-progress")
    });

  }

  successUrl(){
    var CI = this;
    setTimeout(function(){
      window.location = CI.details.success_url+CI.additionalParams();
    }, 1000)
  }

  getData() {
    return {
      postcode: this.getUrlParameter('postcode') || $(".postcode").val() || '',
      firstname: this.getUrlParameter('firstname') || $(".first_name").val() || '',
      lastname: this.getUrlParameter('lastname') || $(".last_name").val() || '',
      email: this.getUrlParameter('email') || $(".email").val() || '',
      phone1: this.getUrlParameter('phone1') || $(".phone").val() || '',
      street1: this.getUrlParameter("street1") || $(".address").val() || 'unknown',
      title:  this.getUrlParameter('title') || $( "#title option:selected" ).val() || "Mr",
      lead_id: this.getUrlParameter('lead_id')|| 'unknown',
      sid: this.getUrlParameter('sid')|| this.details.sid || 1,
      source: this.getUrlParameter('source') || this.details.source || 'unknown',
      ssid: this.getUrlParameter('ssid') || 'unknown',
      keyword: this.getUrlParameter('keyword') || '',
      paymentmethod: this.getUrlParameter('paymentmethod') || $("input[name='currently-payment-type']:checked").val() || 'unknown',
      currentprovider: this.getUrlParameter('currentprovider') || $("input[name='energy-provider']:checked").val() || 'unknown',
      prize: this.getUrlParameter('prize')|| '2',
      trafficid: this.getUrlParameter('trafficid')|| 'Bill-Switchers',
      towncity: this.getUrlParameter('towncity')|| 'unknown',
      c1: this.getUrlParameter('transid')|| this.getUrlParameter('c1') || 'unknown',
      optindate: this.getFormattedCurrentDate(),
      optinurl: 'http://deals.megamobiledeals.com/sp-exit',
      ipaddress: this.ip_Address,
      tps_result: this.tps_result,
      timestamp: new Date,
      user_agent: window.navigator.userAgent,
    }
  }
}

export default new SpExit();

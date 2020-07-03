import Common from "./common.js"

class Handset extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.showClock()
    this.fillform()
    this.showTab(this.currentTab);

    $( ".property" ).change(function() {
      var tabs = $(".tab");
      tabs[CI.currentTab].style.display = "none";
      CI.currentTab = CI.currentTab + 1;
      CI.showTab(CI.currentTab);
      $('.towncity').val($(this).find("option:selected").data("city"))
      $('.street1').val($(this).find("option:selected").data("street"))
      $('.county').val($(this).find("option:selected").data("province"))
      $('.houseNumber').val($(this).find("option:selected").data("housenum"))
    });

    window.Parsley.on('field:error', function() {
      $(".btn-success").removeClass("in-progress")
      $(".tab").removeClass("in-progress")
    });

    $( "#btn-continue" ).click(() => {
      CI.nextStep(1)
    });

    $( "#btn-back" ).click(function() {
      CI.backStep(-1)
    });

    $("input[name='save-energy-bc-no']").click(function() {
      if (this.value == "yes") {
        CI.nextStep(1);
        $( "#btn-continue").show()
      }else{
        if(CI.getBcFromParams()){
           CI.nextStep(2);
        }else{
          CI.successUrl()
        }
      }
    });

    $("input[name='finance']").click(function() {
      console.log("fance")
      if (this.value == "yes") {
        CI.financeLead()
      }
      CI.successUrl()
    });

    $(document).on("click", '.open-form', function() {
      CI.phoneName = $(this).find('input').val()
      $('#deal-form-modal').modal('show')
      $('.clock').hide()
      event.preventDefault();
    });
  }

  urlSelection(){

    if(this.deliveryName == "Exit 1 (Energy)"){
      window.location = this.details.success_url+this.paramsforSuccess()
    }else if(this.deliveryName == "Exit 2 (Credit)"){
      window.location = this.details.success_url+this.paramsforSuccess()
    }else if(this.deliveryName == "Exit 4 (sweetmobile)"){
      window.location = this.details.success_url
    }else if(this.deliveryName == "Exit 5 (UK Credit Ratings)"){
      window.location = this.details.success_url+this.paramsforSuccess()
    }else{
      window.location = this.details.success_url+this.additionalParamsFoBC()
    }
  }

  successUrl(){
    var CI = this;
    $("#loaderPopup").css('height', '100%')
    setTimeout(function(){
      if (CI.redirectUrl) {
        CI.urlSelection()
      }else {
        CI.successUrl()
      }
    }, 1000)
  }

  nextStep(n) {
    this.showCircle()
    var CI = this;
    $('#dealform').parsley().whenValidate({
      group: 'block-' + this.currentTab
    }).done(() =>{
      var tabs = $(".tab");
      tabs[CI.currentTab].style.display = "none";
      CI.handleBadCustomerForm()
      CI.currentTab = CI.currentTab + n;
      CI.showTab(CI.currentTab);
    })
  }

  mmdLead(){
    if (this.customValidator('#dealform') == true && this.isPhone == true && this.isEmail == true){
      this.postMMDData()
    }else{
      $('#dealform').parsley().validate()
    }
  }

  postMMDData() {
    this.firePixel()
    var data = this.getData();
    $( "#btn-continue").hide()
    $( "#btn-back").hide()
    $( ".progress").hide()
    $(".postcode_holder").html($(".postcode").val() || this.getUrlParameter("postcode")  || "");
    // Form Submisson
    this.updateFacebookAudience(data)
    this.sendMmdExitLead()
    this.submitLead(data, this.details.camp_id)
    if(!this.getBcFromParams()){
      this.successUrl()
    }
  }

  energyLead(){
    var data = this.getDataEnergy();
    this.submitLead(data, "ENERGY")
    if(!this.getBcFromParams()){
      this.currentTab  = 3
      this.successUrl()
    }
  }

  financeLead(){
    var data = this.getData();
    this.submitLead(data, "MMD-finance")
  }

  handleBadCustomerForm(){
    if (this.currentTab == 2) {
      this.mmdLead()
    }
    if (this.currentTab == 4) {
      $( "#btn-continue").hide()
      $( "#btn-back").hide()
      this.energyLead()
    }
  }

  getDataEnergy() {
    return {
      postcode: this.getUrlParameter('postcode') || $(".postcode").val() || '',
      firstname: this.getUrlParameter('firstname') || $(".first_name").val() || '',
      lastname: this.getUrlParameter('lastname') || $(".last_name").val() || '',
      email: this.getUrlParameter('email') || $(".email").val() || '',
      phone1: this.getUrlParameter('phone1') || $(".phone").val() || '',
      street1: this.getUrlParameter('street1')|| $(".street1").val(),
      lead_id: this.getUrlParameter('lead_id')|| '',
      sid: 1,
      source: 'MMD',
      ssid: this.getUrlParameter('ssid') || 'unknown',
      paymentmethod: this.getUrlParameter('paymentmethod')|| 'prepayment',
      currentprovider: this.getUrlParameter('currentprovider')|| 'other',
      prize: this.getUrlParameter('prize')|| 'mobilephone',
      trafficid: this.getUrlParameter('trafficid')|| 'Save Energy Bill',
      towncity: this.getUrlParameter('towncity')|| 'unknown',
      title: this.getUrlParameter('title')|| 'Mr',
      optindate: this.getFormattedCurrentDate(),
      optinurl: 'http://deals.megamobiledeals.com/handset',
      ipaddress: this.ip_Address,
      tps_result: this.tps_result,
      timestamp: new Date,
      user_agent: window.navigator.userAgent,
    };
  }

  getData() {
    var customer_type = this.isBadCustomer( this.getUrlParameter('keyword')) || (this.getUrlParameter('bc') == "yes");
    return {
      postcode: this.getUrlParameter('postcode') || $(".postcode").val() || '',
      firstname: this.getUrlParameter('firstname') || $(".first_name").val() || '',
      lastname: this.getUrlParameter('lastname') || $(".last_name").val() || '',
      email: this.getUrlParameter('email') || $(".email").val() || '',
      phone1: this.getUrlParameter('phone1') || $(".phone").val() || '',
      street1: this.getUrlParameter('street1') || $(".street1").val() || '',
      towncity: this.getUrlParameter('towncity') || $(".towncity").val() || '',
      sid: this.getUrlParameter('sid') || this.details.sid ||1,
      ssid: this.getUrlParameter('ssid') || this.details.ssid ||1,
      handset:this.getUrlParameter('handset') || this.phoneName || '',
      ad_set:this.getUrlParameter('ad_set') || 1,
      source: this.getUrlParameter('source') || this.details.source || 'google3',
      c1: this.getUrlParameter('c1') || this.getUrlParameter('bstransid') || this.getUrlParameter('transid') || '',
      adgroupid: this.getUrlParameter('adgroupid') || '',
      campaign: this.getUrlParameter('campaign') || '',
      keyword: this.getUrlParameter('keyword') || '',
      bad_credit_customer: (customer_type) ? "yes" : "no",
      campaignkey: 'E9F2N6A3R5',
      optindate: this.getFormattedCurrentDate(),
      optinurl: 'deals.megamobiledeals.com/handset'+ this.details.optin_url,
      url_with_params: window.location.href,
      ipaddress: this.ip_Address,
      trafficid: this.getUrlParameter('trafficid') || this.details.form_name,
      prize: this.getUrlParameter('prize') || 35,
      timestamp: new Date,
      tps_result: this.tps_result,
      apidown: this.apiDown,
      user_agent: window.navigator.userAgent,
    };
  }

  validatePostcode(){
    window.Parsley.addValidator('validpostcode', {
      validateString: function(value){
        $(".tab").addClass("in-progress")

        var xhr = $.ajax(`https://api.getAddress.io/find/${$(".postcode").val()}?api-key=2WZa6lOOxEq05ARUhPhQEA26785&expand=true`)
        return xhr.then(function(json) {
          if (json.addresses.length > 0) {
            var result = json.addresses
            var adresses = []
             adresses.push( `
              <option
              disabled=""
              selected=""
              >
              Select Your Property
              </option>
            `)
            for (var i = 0; i < result.length; i++) {
              adresses.push( `
                  <option
                  data-street="${result[i].line_1}"
                  data-city="${result[i].town_or_city}"
                  data-province="${result[i].county}"
                  data-housenum="${result[i].building_number}"
                  >
                  ${result[i].formatted_address.join(" ").replace(/\s+/g,' ')}
                  </option>
                `)
              }
              $('#property').html(adresses)
              $(".tab").removeClass("in-progress")
              $('#address').show()
              $('.towncity').val($("#property").find("option:selected").data("city"))
              $('.street1').val($("#property").find("option:selected").data("street"))
              $('.county').val($("#property").find("option:selected").data("province"))
              $('.houseNumber').val($("#property").find("option:selected").data("housenum"))


            return true
          }else{
            $(".tab").removeClass("in-progress")
            return $.Deferred().reject("Please Enter Valid Postcode");
          }
        })
      },
      messages: {
         en: 'Please Enter Valid Postcode',
      }
    });
  }

}
export default new Handset();

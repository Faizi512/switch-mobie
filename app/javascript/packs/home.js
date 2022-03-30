import Common from "./common.js"
import _ from 'lodash'

class Home extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.fillform()
    this.popupTerms()
    this.popupPrivacy()
    this.showClock()
    this.showTab(this.currentTab);
    this.togglePopUp()
    this.toggleCheckBox()

    $('.carousel').carousel({
      interval: 2000
    })

    $( ".property" ).change(function() {
      var tabs = $(".tab");
      tabs[CI.currentTab].style.display = "none";
      CI.currentTab = CI.currentTab + 1;
      $(".below-header").addClass("min-h-600");
      CI.showTab(CI.currentTab);
      $('.towncity').val($(this).find("option:selected").data("city"))
      $('.street1').val($(this).find("option:selected").data("street"))
      $('.county').val($(this).find("option:selected").data("province"))
      $('.houseNumber').val($(this).find("option:selected").data("housenum"))
      $('.street2').val($(this).find("option:selected").data("street2"))
      $('.building').val($(this).find("option:selected").data("building"))
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

    $(document).on("click", '.open-form', function() {
      var user = localStorage.getItem("user_data")
      if (user != null) {
        $("#loaderPopup").css('height', '100%')
        CI.postMMDData()
        event.stopPropagation()
      } else {
        CI.phoneName = $(this).find('input').val()
        $('#deal-form-modal').modal('show')
        $('.clock').hide()
        event.stopPropagation();
      }
    });
  }

  showClock(){
    var clockElement = $(".clock");
    var d = new Date();
    var localTime = d.getTime();
    var localOffset = d.getTimezoneOffset() * 60000;
    var utc = localTime + localOffset;
    var offset = 0;
    var uktime = utc + (3600000*offset);
    var nd = new Date(uktime);
    var h = nd.getHours();
    var m = nd.getMinutes();
    var s = nd.getSeconds();
    var secondsUntilEndOfDate = (24*60*60) - (h*60*60) - (m*60) - s;
    var cookie = this.getCookie("timerEndDate");
    var counter = cookie-s;
    var clock = new FlipClock( clockElement,  counter,{
      countdown: true,
    });
    clock.setTime(counter);
    clock.setCountdown(true);
    clock.start();
  }

  getCookie(c_name) {
    if (document.cookie.length > 0) {
      var c_start = document.cookie.indexOf(c_name + "=");
      if (c_start != -1) {
        c_start = c_start + c_name.length + 1;
        var c_end = document.cookie.indexOf(";", c_start);
        if (c_end == -1) {
          c_end = document.cookie.length;
        }
        return unescape(document.cookie.substring(c_start, c_end));
      }
    }
    return "";
  }

  updateUserInStorage(){
    var CI=this
    var previousData = this.getItemFromStorage("user_data")
    var currentData = this.getData();
    var userData = _.mergeWith(currentData,previousData, (current, previous) => current == "" || current == "unknown"  ? previous : current)
    CI.setItemToStorage("user_data", userData)
  }

  getItemFromStorage(name){
    return JSON.parse(localStorage.getItem(name))
  }

  setItemToStorage(name, data){
    if (data.adopted_url == "" ||  data.adopted_url == null) {
      data.adopted_url = data.optinurl
    }else{
      this.adoptedUrl = data.adopted_url
    }
    return localStorage.setItem(name, JSON.stringify(data))
  }

  successUrl(){
    var CI = this;
    $("#loaderPopup").css('height', '100%')
    setTimeout(function(){
      window.location = "/success2"
    }, 2000)
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
    var CI = this;
    this.checkCookieExist()
    if( this.getItemFromStorage("user_data") != null){
      CI.userStorage = true
      this.USTransaction();
      this.updateUserInStorage()
      this.submitLead(this.getItemFromStorage("user_data"), this.details.camp_id)
    }
    else{
      var data = this.getData();
      if (CI.saveCookie != null)
      {
        CI.setItemToStorage("user_data", data)
      }
      console.log("Postdata: "+new Date())
      this.submitLead(data, this.details.camp_id)
    }

    $( "#btn-continue").hide()
    $( "#btn-back").hide()
    $( ".progress").hide()
    $(".postcode_holder").html($(".postcode").val() || this.getUrlParameter("postcode")  || "");
    // Form Submisson
    this.updateFacebookAudience(data)
  }

  handleBadCustomerForm(){
    var CI = this;
    if (this.currentTab == 2) {
      this.mmdLead()
      CI.successUrl();
    }
  }

  getData() {
    var track = "";
    try {
      track = AnyTrack('formSubmit') || "";
    }
    catch (e) {}
    var customer_type = this.isBadCustomer( this.getUrlParameter('keyword')) || (this.getUrlParameter('bc') == "yes");
    return {
      postcode: this.getUrlParameter('postcode') || $(".postcode").val() || '',
      firstname: this.getUrlParameter('firstname') || $(".first_name").val() || '',
      lastname: this.getUrlParameter('lastname') || $(".last_name").val() || '',
      email: this.getUrlParameter('email') || $(".email").val() || '',
      phone1: this.getUrlParameter('phone1') || $(".phone").val() || '',
      street1: this.getUrlParameter('street1') || $(".street1").val() || $(".address").val() || 'unknown',
      street2: this.getUrlParameter('street2') || $(".street2").val() || 'unknown',
      building: this.getUrlParameter('building') || $(".building").val() || 'unknown',
      towncity: this.getUrlParameter('towncity') || $(".towncity").val() || 'unknown',
      sid: this.getUrlParameter('sid') || 202,
      ssid: this.getUrlParameter('ssid') || 1,
      ad_set: this.getUrlParameter('ad_set') || 1,
      source: this.getUrlParameter('source') || 'social',
      traffictype: 'social',
      handset:this.getUrlParameter('handset') || this.phoneName || '',
      c1: this.getUrlParameter('c1') || this.getUrlParameter('bstransid') || this.getUrlParameter('transid') || '',
      adgroupid: this.getUrlParameter('adgroupid') || '',
      campaign: this.getUrlParameter('campaign') || '',
      keyword: this.getUrlParameter('keyword') || '',
      bad_credit_customer: (customer_type) ? "yes" : "no",
      campaignkey: 'E9F2N6A3R5',
      optindate: this.getFormattedCurrentDate(),
      optinurl: 'switch-mobile.co.uk'+ this.details.optin_url,
      url_with_params: window.location.href,
      ipaddress: this.details.ipaddress,
      uu_id: this.details.uu_id || '',
      trafficid: this.getUrlParameter('trafficid') || this.details.form_name,
      prize: this.getUrlParameter('prize') || 35,
      timestamp: new Date,
      anytrack: track,
      utm_source: this.getUrlParameter('utm_source'),
      matchtype: this.getUrlParameter('matchtype') || "",
      tps_result: this.tps_result,
      apidown: this.apiDown,
      conversion_token: this.details.token,
      user_agent: window.navigator.userAgent,
      lead_from_local_storage: this.userStorage,
      adopted_url: this.adoptedUrl,
      campaign_name: this.details.camp_id,
      device:this.device || '',
      device_browser:this.deviceBrowser || '',
      devive_search_engine:this.deviveSearchEngine || '',
      device_brand:this.deviceBrand || '',
      device_name:this.deviceName || '',
      income_type: this.getUrlParameter("income_type") || '' ,
      residentialstatus: this.getUrlParameter("residentialstatus") || '' ,
    };
  }

}
export default new Home();

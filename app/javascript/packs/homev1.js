import Common from "./common.js"
import _ from 'lodash'

class Homev1 extends Common {
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
    this.togglePopUp()
    this.toggleCheckBox()
    this.checkCookieExist()
    this.currentState = 0
    var current_fs, next_fs, previous_fs;

    $('.carousel').carousel({
      interval: 2000
    })

    // Next button
    $(".next-button").click(function(){
      $('#dealform').parsley().whenValidate({
        group: 'block-' + CI.currentState
      }).done(() =>{
        current_fs = $(this).parent().parent();
        next_fs = $(this).parent().parent().next();
        $(".prev").css({ 'display' : 'block' });
        $(current_fs).removeClass("show");
        $(next_fs).addClass("show");
        $("#progressbar li").eq($(".card2").index(next_fs)).addClass("active");
        current_fs.animate({}, {
          step: function() {
            current_fs.css({
              'display': 'none',
              'position': 'relative'
            });
            next_fs.css({
              'display': 'block'
            });
          }
        });
        if (CI.currentState == 2) {
          if (CI.isPhone == true && CI.isEmail == true){
            CI.postData()
          }else{
            $('#dealform').parsley().validate()
          }
          return true
        }
        CI.currentState += 1
        CI.handleBadCustomerForm()
      })
    });

    // Previous button
    $(".prev").click(function(){
      CI.currentState -= 1
      current_fs = $(this).parent().parent();
      previous_fs = $(this).parent().parent().prev();
      $(current_fs).removeClass("show");
      $(previous_fs).addClass("show");
      $(".prev").css({ 'display' : 'block' });
      if($(".show").hasClass("first-screen")) {
        $(".prev").css({ 'display' : 'none' });
      }
      $("#progressbar li").eq($(".card2").index(current_fs)).removeClass("active");
      current_fs.animate({}, {
        step: function() {
          current_fs.css({
            'display': 'none',
            'position': 'relative'
          });
          previous_fs.css({
            'display': 'block'
          });
        }
      });
    });

    $( ".property" ).change(function() {
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

    $(document).on("click", '.open-form', function() {
      var user = localStorage.getItem("user_data")
      if (user != null) {
        $("#loaderPopup").css('height', '100%')
        CI.postMMDData()
        event.stopPropagation()
      } else {
        $('#deal-form-modal').modal('show')
        $('.clock').hide()
        event.stopPropagation();
      }
    });
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

  mmdLead(){
    if (this.customValidator('#dealform') == true && this.isPhone == true && this.isEmail == true){
      this.postMMDData()
    }else{
      $('#dealform').parsley().validate()
    }
  }

  postMMDData() {
    var CI = this;
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
    $(".load").removeClass("d-none");
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
      uu_id: this.saveCookie || '',
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
export default new Homev1();

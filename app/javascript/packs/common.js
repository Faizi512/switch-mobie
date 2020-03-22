import 'flipclock/dist/flipclock.min.js'
import 'bootstrap/dist/js/bootstrap.js'
import "@fortawesome/fontawesome-free/js/all"
import "parsleyjs";

class Common {
  constructor() {
    var CI = this;
    this.formValidation = {}
    this.isEmail =false
    this.isPhone =false
    this.ip_Address = '';
    this.currentTab = 0;
    this.submtForm = false;
    this.details = {};

    $.getJSON('https://ipapi.co/json/', function(data) {
      if (data != null && data.ip != undefined && typeof (data.ip) == "string") {
        CI.ip_Address = data.ip;
      }
    });

    $('#deal-form-modal').on('hide.bs.modal', function (e) {
      $('.clock').show()
    });

    window.FontAwesomeConfig = {
      searchPseudoElements: true
    }
  }


  getFormDetails(form){
    var data = $(form)[0].dataset.details
    this.details = JSON.parse(data)
  }

  showToolTip(){
    $('[data-toggle="tooltip"]').tooltip();
  }

  showClock(){
    var clockElement = $(".clock");
    var clock = new FlipClock(clockElement, 6600, {
        countdown: true
    })
  }

  getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;
    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');
      if (sParameterName[0] === sParam) {
          return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
      }
    }
  }

  getFormattedCurrentDate() {
    var date = new Date();
    var day = this.addZero(date.getDate());
    var monthIndex = this.addZero(date.getMonth() + 1);
    var year = date.getFullYear();
    var min = this.addZero(date.getMinutes());
    var hr = this.addZero(date.getHours());
    var ss = this.addZero(date.getSeconds());

    return day + '/' + monthIndex + '/' + year + ' ' + hr + ':' + min + ':' + ss;
  }

  addZero(i) {
    if (i < 10) {
      i = "0" + i;
    }
    return i;
  }

  isBadCustomer(query) {
    if(query){
      var keywords = ["credit", "accepted", "bad", "score", "sunshine"];
      query = query.toLowerCase();
      for(var index in keywords) {
        var word = keywords[index];
        var matchedIndex = query.indexOf(word);
        if (matchedIndex != -1) {
          return true;
          break;
        }
      }
      return false;
    }
  }

  validate(form){
    this.formValidation = $(form).parsley({
        trigger: "focusout",
        errorClass: 'error',
        successClass: 'valid',
        errorsWrapper: '<div class="parsley-error-list"></div>',
        errorTemplate: '<label class="error"></label>',
        errorsContainer (field) {
          if(field.$element.hasClass('approve')){
            return $('.error-checkbox')
          }
          return field.$element.parent()
        },
    })

    this.validatePhone()
    this.validateEmail()
    this.validatePostcode()

  }

  validatePhone(){
    var CI = this
    window.Parsley.addValidator('validphone', {
      validateString: function(value){
        var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/mobile?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.phone').val())
        return xhr.then(function(json) {
          if (json.status == "Valid") {
            CI.isPhone = true
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

  validateEmail(){
    var CI = this
    window.Parsley.addValidator('validemail', {
      validateString: function(value){
        var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/email?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.email').val())
        return xhr.then(function(json) {
          if (json.status == "Valid") {
            CI.isEmail = true
            return true
          }else{
            return $.Deferred().reject("Please Enter Valid Email Address");
          }
        })
      },
      messages: {
         en: 'Please Enter Valid Email Address',
      }
    });
  }

  validatePostcode(){
    window.Parsley.addValidator('validPostcode', {
      validateString: function(value){
       return /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/i.test(value);
      },
      messages: {
         en: 'Please Enter Valid UK Postcode',
      }
    });
  }

  showTab(n=0) {
    var tabs = $(".tab");
    if (!tabs[n]) return;
    tabs[n].style.display = "block";
    this.fixStepIndicator(n)
  }

  fillform(){
    $(".first_name").val(this.getUrlParameter("firstname") || "");
    $(".last_name").val(this.getUrlParameter("lastname")  || "");
    $(".postcode").val(this.getUrlParameter("postcode")  || "");
    $(".email").val(this.getUrlParameter("email")  || "");
    $(".telephone").val(this.getUrlParameter("phone1") || this.getUrlParameter("mobile") || "");
  }

  customValidator(form){
    var tabs = $(".tab");
    if ($('.first_name').val().length < 1
      || $('.last_name').val().length < 1
    ){
      tabs[0].style.display = "block";
      tabs[1].style.display = "none";
      tabs[2].style.display = "none";
      this.currentTab = 0
      $(form).parsley().validate()
      return false
    }else if( $('.postcode').val().length < 3){
      tabs[1].style.display = "block";
      tabs[0].style.display = "none";
      tabs[2].style.display = "none";
      this.currentTab = 1
      $(form).parsley().validate()
      return false
    }else if($('.email').val().length < 3
      || $('.phone').val().length < 3){
      tabs[2].style.display = "block";
      tabs[0].style.display = "none";
      tabs[1].style.display = "none";
      this.currentTab = 2
      $(form).parsley().validate()
      return false
    }
    return true
  }

  fixStepIndicator(num) {
    var progress = document.getElementById('progressBar');
    if(num >= 0) {
      progress.style.width = (num*33)+"%";
      progress.innerText = "Progress " + (num*33) + "%";
      if( num ==  0){
        progress.innerText = '';
      }
    }
  }
  backStep(n){
    if (this.currentTab > 0) {
      $('.nextStep').prop('disabled', false);
      var tabs = $(".tab");
      tabs[this.currentTab].style.display = "none";
      this.currentTab = this.currentTab + n;
      this.showTab(this.currentTab);
    }
  }

  nextStep(n) {
    var CI = this;
    $('#dealform').parsley().whenValidate({
      group: 'block-' + this.currentTab
    }).done(() =>{
      var tabs = $(".tab");
      tabs[CI.currentTab].style.display = "none";
      CI.currentTab = CI.currentTab + n;
      if (CI.currentTab >= tabs.length) {
        if (CI.customValidator('#dealform') == true && CI.isPhone == true && CI.isEmail == true){
          $('.but_loader').show()
          $('.nextStep').prop('disabled', true);
          CI.postData()
        }else{
          $('#dealform').parsley().validate()
        }
        return true
      }
      CI.showTab(CI.currentTab);
    })
  }

  getData() {
    var customer_type = this.isBadCustomer( this.getUrlParameter('keyword')) || (this.getUrlParameter('bc') == "yes");
    return {
      postcode: this.getUrlParameter('postcode') || $(".postcode").val() || '',
      firstname: this.getUrlParameter('firstname') || $(".first_name").val() || '',
      lastname: this.getUrlParameter('lastname') || $(".last_name").val() || '',
      email: this.getUrlParameter('email') || $(".email").val() || '',
      phone1: this.getUrlParameter('phone1') || $(".phone").val() || '',
      sid: this.getUrlParameter('sid') || this.details.sid ||1,
      ssid: this.getUrlParameter('ssid') || this.details.ssid ||1,
      ad_set:this.getUrlParameter('ad_set') || 1,
      source: this.getUrlParameter('source') || this.details.source || 'google3',
      c1: this.getUrlParameter('c1') || this.getUrlParameter('bstransid') || this.getUrlParameter('transid') || '',
      adgroupid: this.getUrlParameter('adgroupid') || '',
      campaign: this.getUrlParameter('campaign') || '',
      keyword: this.getUrlParameter('keyword') || '',
      bad_credit_customer: (customer_type) ? "yes" : "no",
      campaignkey: 'E9F2N6A3R5',
      optindate: this.getFormattedCurrentDate(),
      optinurl: 'deals.megamobiledeals.com'+ this.details.optin_url,
      ipaddress: this.ip_Address,
      trafficid: this.getUrlParameter('trafficid') || this.details.form_name,
      prize: this.getUrlParameter('prize') || 35,
      timestamp: new Date,
      user_agent: window.navigator.userAgent,
    };
  }

  firePixel(){
    if (this.details.camp_id == 'MEGA-MOBILE-DEALS'){
      dataLayer.push({'event': 'transaction'})
    }
  }

  postData() {
    // Getting Data
    this.firePixel()
    var CI = this;
    var data = this.getData();
    // Form Submisson
    this.updateFacebookAudience(data)
    this.submitLead(data, this.details.camp_id)
    // Redirection after submisson
    this.successUrl()
  }

  successUrl(){
    var CI = this;
    setTimeout(function(){
      if( CI.isBadCustomer(CI.getUrlParameter('keyword')) ||  (CI.getUrlParameter('bc') == "yes")){
        window.location = "https://www.megamobiledeals.com/no-credit-check-deals/?s1=" + CI.getSource() + "&s2=" + CI.getC1();
      }else{
        window.location = CI.details.success_url
      }
    }, 1000)
  }

  updateFacebookAudience(data){
    $.ajax({
      type: "POST",
      url: '/facebook_custom_audience',
      data: data,
      dataType: "json",
      success: function(e) {
        console.log(e.response);
      }
    })
  }

  submitLead(data, campid){
    $.ajax({
      type: "POST",
      url: "https://go.webformsubmit.com/dukeleads/waitsubmit?key=eecf9b6b61edd9e66ca0f7735dfa033a&campid=" + campid,
      data: data,
      success: function(e) {
        console.log(e)
      },
      dataType: "json"
    })
  }

  getC1(){
    return this.getUrlParameter('c1') || this.getUrlParameter('bstransid') || this.getUrlParameter('transid') || '';
  }

  getSource(){
    return this.getUrlParameter('source') || this.details.source || 'google3';
  }
}

export default Common;
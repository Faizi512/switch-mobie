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
    this.apiDown = false
    this.ip_Address = '';
    this.currentTab = 0;
    this.submtForm = false;
    this.details = {};
    this.tps_result = null
    this.redirectUrl = null
    this.fetchRequest = 0
    this.deliveryName = null
    this.phoneName = null;
    this.userStorage = false
    this.adoptedUrl = ""
    this.device=null
    this.deviceBrowser=null
    this.deviveSearchEngine=null
    this.debiceBrand=null
    this.deviceName=null
    CI.saveCookie=null
    this.deviceDetection()

    $('#deal-form-modal').on('hide.bs.modal', function (e) {
      $('.clock').show()
    });

    $(window).on("load", function(){
      if (localStorage.getItem('user_data') != null) {
        var adopted_url = JSON.parse(localStorage.getItem('user_data')).adopted_url.split(/[: /]+/)
        adopted_url = adopted_url.length > 1 ? adopted_url[1] : adopted_url[0]
        if (adopted_url == '') {
          adopted_url = adopted_url[0]
        }
        var clearStorgaeData = JSON.parse(localStorage.getItem('user_data')).clearStorage
        if( (adopted_url == 'switch-mobile.co.uk' || adopted_url == 'bill-switchers.com') && ( clearStorgaeData == undefined)){
          localStorage.removeItem('user_data')
        }
      }
    })
    window.FontAwesomeConfig = {
      searchPseudoElements: true
    }
  }

  deviceDetection(){
    this.device=FRUBIL.device.class_code   //Desktop
    this.deviceBrowser=FRUBIL.client.class_code // Browser
    this.deviveSearchEngine=FRUBIL.client.name_code // Chrome
    this.deviceBrand=FRUBIL.device.brand_code // Samsung
    this.deviceName=FRUBIL.device.marketname // Galaxy A5
  }

  togglePopUp() {
    $( ".close-btn1" ).click(function() {
     $('.modal4').hide();
    })

    $('.partner-text').click(function(){
      $('.modal4').show();
    })
  }

  toggleCheckBox(){
    var chk1 = $("input[type='checkbox'][name='agree']");
    var chk2 = $("input[type='checkbox'][name='partners-tp']");

    chk1.on('change', function(){
      chk2.prop('checked',this.checked);
    });
  }

  popupTerms(){
    $( ".close-b" ).click(function() {
      $('.modal2').hide();
    });

    $('.term-text').click(function(){
      $('.modal2').show();
    });
  }

  popupPrivacy(){
    $( ".close-bu" ).click(function() {
      $('.modal3').hide();
    });

    $('.privacy-text').click(function(){
      $('.modal3').show();
    });
  }

  getFormDetails(form){
    var data = $(form)[0].dataset.details
    this.details = JSON.parse(data)
  }
  showCircle(){
    $(".btn-success").addClass("in-progress")
  }
  showToolTip(){
    $('[data-toggle="tooltip"]').tooltip();
  }

  showClock(){
    var clockElement = $(".clock");
    var clockMobileElement = $(".mob-clock");
    var clock = new FlipClock(clockElement, 198000, {
        countdown: true
    })
    var clock = new FlipClock(clockMobileElement, 198000, {
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
      var keywords = ["credit", "accepted", "bad", "score", "sunshine",
                       "no credit", "free", "guaranteed", "gift", "win", "wining", "very",
                       "phone check", "check" , "no upfront", "cheap", "catalogues", "later",
                       "sun", "no deposit", "accepted", "No deposit", "0 deposit"]
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
          if(field.$element.hasClass('postcode')){
            return $('.postcode-error')
          }
          if(field.$element.hasClass('error-on-button')){
            return $(field.element.closest(".tab").querySelector(".error-box"))
          }
          return field.$element.parent()
        },
    })

    this.validatePhone()
    this.validateEmail()
    this.validatePostcode()
    this.validateApiPostcode()
  }

  validatePhone(){
    var CI = this
    window.Parsley.addValidator('validphone', {
      validateString: function(value){
        var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/mobile?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.phone').val())
        return xhr.then(function(json) {
          CI.validateTsp()
          var skipresponse = ["EC_ABSENT_SUBSCRIBER", "EC_ABSENT_SUBSCRIBER_SM", "EC_CALL_BARRED", "EC_SYSTEM_FAILURE","EC_SM_DF_memoryCapacityExceeded", "EC_NO_RESPONSE", "EC_NNR_noTranslationForThisSpecificAddress", "EC_NNR_MTPfailure", "EC_NNR_networkCongestion"]
          if (skipresponse.includes(json.response) ) {
            CI.isPhone = true
            return true
          }
          else if (json.status == "Valid") {
            CI.isPhone = true
            return true
          }else if(json.status == "Invalid" || json.status == "Error"){
            return $.Deferred().reject("Please Enter Valid UK Phone Number");
          }
          else{
            CI.isPhone = true
            return true
          }
        })
      },
      messages: {
         en: 'Please Enter Valid UK Phone Number',
      }
    });
  }

  validateTsp(){
    var CI = this
    if (this.tps_result == null) {
      var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/tps?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.phone').val())
      return xhr.then(function(json) {
        CI.tps_result =  json.status
      })
    }
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
          }else if(json.status == "Invalid"){
            return $.Deferred().reject("Please Enter Valid Email Address");
          }else{
            CI.isEmail = true
            return true
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

  validateApiPostcode(){
    window.Parsley.addValidator('validapipostcode', {
      validateString: function(value){
       return $.ajax({
          url:`https://api.getAddress.io/find/${$(".postcode").val()}?api-key=NjGHtzEyk0eZ1VfXCKpWIw25787&expand=true`,
          success: function(json){
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
                    data-street="${result[i].thoroughfare || result[i].line_1}"
                    data-city="${result[i].town_or_city}"
                    data-province="${result[i].county || result[i].town_or_city}"
                    data-street2="${result[i].line_2}"
                    data-building="${result[i].building_name || result[i].sub_building_name || result[i].building_number || result[i].sub_building_number}"
                    data-house-number="${result[i].building_number || result[i].sub_building_number || result[i].building_name || result[i].sub_building_name || result[i].line_1}"
                    >
                    ${result[i].formatted_address.join(" ").replace(/\s+/g,' ')}
                    </option>
                  `)
                }
                $('#property').html(adresses)
                $(".address-div").remove();
                $(".property-div").show()
              return true
            }else{
              $(".tab").removeClass("in-progress")
              return $.Deferred().reject("Please Enter Valid Postcode");
            }
          },
          error: function(request){
            console.log(request.statusText)
            request.abort();
            if (request.statusText == "timeout") {
              $(".property-div").remove();
              $(".address-div").show();
            }
          },
          timeout: 5000
        })
      },
      messages: {
         en: 'Please Enter Valid Postcode',
      }
    });
  }


  showTab(n=0) {
    var tabs = $(".tab");
    if (!tabs[n]) return;
    tabs[n].style.display = "block";
    this.fixStepIndicator(n)
    $(".btn-success").removeClass("in-progress")
    $(".postcode").focus();
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
    }else if( $('.postcode').val().length < 3 || $( "#property option:selected" ).val() ==""){
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
      street1: this.getUrlParameter('street1') || $(".street1").val() || $(".address").val() || 'unknown',
      street2: this.getUrlParameter('street2') || $(".street2").val() || 'unknown',
      building: this.getUrlParameter('building') || $(".building").val() || 'unknown',
      towncity: this.getUrlParameter('towncity') || $(".towncity").val() || 'unknown',
      handset:this.getUrlParameter('handset') || this.phoneName || '',
      sid: this.getUrlParameter('sid') || 202,
      ssid: this.getUrlParameter('ssid') || 1,
      ad_set: this.getUrlParameter('ad_set') || 1,
      source: this.getUrlParameter('source') || 'social',
      traffictype: 'social',
      c1: this.getUrlParameter('c1') || this.getUrlParameter('bstransid') || this.getUrlParameter('transid') || '',
      adgroupid: this.getUrlParameter('adgroupid') || '',
      campaign: this.getUrlParameter('campaign') || '',
      keyword: this.getUrlParameter('keyword') || '',
      bad_credit_customer: (customer_type) ? "yes" : "no",
      campaignkey: 'E9F2N6A3R5',
      optindate: this.getFormattedCurrentDate(),
      optinurl: 'switch-mobile.co.uk'+ this.details.optin_url,
      ipaddress: this.details.ipaddress,
      uu_id: this.details.uu_id || '',
      trafficid: this.getUrlParameter('trafficid') || this.details.form_name,
      prize: this.getUrlParameter('prize') || 35,
      apidown: this.apiDown,
      tps_result: this.tps_result,
      matchtype: this.getUrlParameter('matchtype') || "",
      timestamp: new Date,
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
      clearStorage: false,
    };
  }

  firePixel(){
    if (this.details.camp_id == 'MEGA-MOBILE-DEALS'){
      dataLayer.push({'event': 'transaction'})

      // Commented Pixel as per Sohail's instructions - Added Pixel through GTM
      // fbq('track', 'Lead', {value: 3, currency: '£'}, {eventID: this.details.token});
    }
  }

  USTransaction(){
    dataLayer.push({'event': 'USTransaction'})
  }

  getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
      begin = dc.indexOf(prefix);
      if (begin != 0) return null;
    }
    else
    {
      begin += 2;
      var end = document.cookie.indexOf(";", begin);
      if (end == -1) {
        end = dc.length;
      }
    }
    return decodeURI(dc.substring(begin + prefix.length, end));
  }

  checkCookieExist() {
    if (this.getCookie("klaro") != null && this.getCookie("klaro") != '') {
      this.saveCookie = this.getCookie("klaro");
      this.saveCookie = JSON.parse(decodeURIComponent(this.saveCookie))['Local Storage']
    }
  }

  postData() {
    // doubel verify tsp
    this.validateTsp()
    // Getting Data
    var CI = this;
    this.checkCookieExist()
    var data = this.getData();
    // Form Submisson
    this.updateFacebookAudience(data)
    this.submitLead(data, this.details.camp_id)
    // Redirection after submisson
    this.successUrl()
  }

  successUrl(){
    setTimeout(function(){
      window.location = "/success2"
    }, 2000)
  }

  urlSelection(){
    if(this.getBcFromParams()){
      window.location = this.details.bad_success_url+this.additionalParamsFoBC()
    }else{
       window.location = this.details.success_url+this.additionalParams()
    }
  }

  getBcFromParams(){
    return this.isBadCustomer(this.getUrlParameter('keyword')) ||  (this.getUrlParameter('bc') == "yes")
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

  submitLeadToStore(formData){
    console.log(formData)
    var CI = this
    $.ajax({
      type: "POST",
      url: 'https://dukestore.herokuapp.com/api/v1/lead',
      dataType: 'json',
      data: {lead: formData},
      success: function(data) {
        console.log(data)
      },
      error: function(request){
        console.log(request.statusText)
      }
    })
  }

  submitLead(formData, campid){
    this.submitLeadToStore(formData)
    var CI = this
    CI.firePixel();
    $.ajax({
      type: "POST",
      url: "https://go.webformsubmit.com/dukeleads/waitsubmit?key=eecf9b6b61edd9e66ca0f7735dfa033a&campid=" + campid,
      data: formData,
      success: function(data) {
        console.log(data)
        if(data.code == 1 && data.records[0].response.code == 1){
          dataLayer.push({'transactionId': data.records[0].response.leadId, "transactionTotal": 3})
          CI.submitCustomerIo(formData, data.records[0].response.leadId)
        }
        CI.successUrl();
      },
      dataType: "json"
    })
  }

  submitCustomerIo(formData, leadId){
     try {
      const timestamp = Math.round(new Date() / 1000)
      var phone = `+44${parseInt(formData.phone1.toString().split("").splice(-10).join(""))}`
      _cio.identify($.extend(formData, {id: leadId, lead_date: timestamp, created_at: timestamp, phone: phone}))
      _cio.track("leadSold");
    }
    catch (e) {}
  }

  sendMmdExitLead(){
    if (this.details.camp_id == 'MEGA-MOBILE-DEALS'){
      // Get data for lead
      var customer_type = this.isBadCustomer( this.getUrlParameter('keyword')) || (this.getUrlParameter('bc') == "yes")
      var phone1 = this.getUrlParameter('phone1') || $(".phone").val() || ''
      var bc = (customer_type) ? "yes" : "no"
      var c3 = this.getUrlParameter('sid') || this.details.sid || 1
      var handset = this.getUrlParameter('handset') || this.phoneName || ''
      var postcode = this.getUrlParameter('postcode') || $(".postcode").val() || ''
      var source = this.getUrlParameter('source') || this.details.source || 'google3'
      var CI = this
      $.ajax({
        type: "POST",
        url: "/mmd-exit-lead?campid=MMDEXIT",
        data: {phone1: phone1, bc: bc, c3: c3, source: source, handset: handset, postcode: postcode },
        success: function(json) {
          console.log(json)
          if(json.response.code == 1){
            CI.fetchRedirectUrl(json.response.leadId)
          }
        },
        error: function(s){
          setTimeout(function(){
            CI.redirectUrl =  "https://mtrk11.co.uk/?a=14118&c=33110"
          }, 2000);
        },
        dataType: "json"
      })
    }
  }

  fetchRedirectUrl(lead_id){
    var CI = this
    $.ajax({
      type: "get",
      url: `/fetch-redirect-url/${lead_id}`,
      success: function(response) {
        console.log(response)
        if(response.status == 200){
          CI.redirectUrl = response.lead.redirect_url
          CI.deliveryName = response.lead.delivery_name
          CI.details.bad_success_url = CI.redirectUrl
          CI.details.success_url = CI.redirectUrl
        }else{
          CI.setTimerToApiCall(lead_id)
        }
      },
      error: function(res) {
          console.error(res)
      },
    })
  }

  setTimerToApiCall(lead_id){
    var CI = this
    this.fetchRequest = this.fetchRequest + 1
    if(this.fetchRequest < 10 && this.redirectUrl ==  null){
      setTimeout(function(){
        CI.fetchRedirectUrl(lead_id)
      }, 2000);
    }else{
      this.redirectUrl =  "https://mtrk11.co.uk/?a=14118&c=33110"
    }
  }
  additionalParams(){
    return "&s1=exit-" + this.getSource() + "&s2=" + this.getC1() + "&s3=" + this.getEmail() + "&s4=" + this.getPhone1() ;
  }

  additionalParamsFoBC(){
    return "&s1=exit-" + this.getSource() + "&s2=" + this.getC1() + "&s3=" + this.getEmail() + "&s4=" + this.getPhone1() ;
  }

  paramsforSuccess(){
    return "&houseNumber=" + this.getHouseNumb() + "&county=" + this.getCounty() + "&towncity=" + this.getCity() + "&street1=" + this.getStreet() + "&firstname=" + this.getFirstName() + "&lastname=" + this.getLastName() + "&postcode=" + this.getPostcode() + "&phone1=" + this.getPhone1() + "&email=" + this.getEmail() + "&source=" + this.getSource() + "&c1=" + this.getC1() + "&sid=" + this.getSid() + "&ssid=" + this.getSsid();
  }
  paramsforSuccess2(){
    return "&houseNumber=" + this.getHouseNumb() + "&county=" + this.getCounty() + "&towncity=" + this.getCity() + "&street1=" + this.getStreet() + "&firstname=" + this.getFirstName() + "&lastname=" + this.getLastName() + "&postcode=" + this.getPostcode() + "&phone1=" + this.getPhone1() + "&email=" + this.getEmail() + "&c1=" + this.getC1() + "&sid=" + this.getSid() + "&ssid=" + this.getSsid();
  }
  parmsforCreditReport(){
    return this.getSid() + "&city=" + this.getCity() + "&straddr=" + this.getStreet()  + "&fname=" + this.getFirstName() + "&lname=" + this.getLastName() + "&zip=" + this.getPostcode() + "&phone=" + this.getPhone1() + "&email=" + this.getEmail();
  }

  getStreet(){
    return this.getUrlParameter('street1') || $(".street1").val() || '';
  }

  getCity(){
    return this.getUrlParameter('towncity') || $(".towncity").val() || '';
  }

  getHouseNumb(){
    return this.getUrlParameter('houseNumber') || $(".houseNumber").val() || '';
  }

  getCounty(){
    return this.getUrlParameter('county') || $(".county").val() || '';
  }

  getC1(){
    return this.getUrlParameter('c1') || this.getUrlParameter('bstransid') || this.getUrlParameter('transid') || '';
  }

  getSid(){
    return this.getUrlParameter('sid') || '';
  }

  getSsid(){
    return this.getUrlParameter('ssid') || '';
  }

  getSource(){
    return this.getUrlParameter('source') || this.details.source || 'google3';
  }

  getEmail(){
    return this.getUrlParameter('email') || $(".email").val() || '' ;
  }

  getPhone1(){
    return this.getUrlParameter('phone1') || $(".phone").val() || '' ;
  }

  getFirstName(){
    return this.getUrlParameter('firstname') || $(".first_name").val() || '' ;
  }

  getLastName(){
    return this.getUrlParameter('lastname') || $(".last_name").val() || '' ;
  }

  getPostcode(){
    return this.getUrlParameter('postcode') || $(".postcode").val() || '';
  }

}

export default Common;

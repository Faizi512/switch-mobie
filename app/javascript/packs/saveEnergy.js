$(document).on('turbolinks:load',function(){
  validate()
  formValidation = {}
  var ip_Address = '';
  $('.name').text(getUrlParameter('firstname'))
  $('.postcode').text(getUrlParameter('postcode'))
  $("#submitbtn").click(function(event){
    if ($('#engeryForm').parsley().validate()){
      $('#submitbtn').prop('disabled', true);
      postData()
    }
  });
  
  $.getJSON('https://ipapi.co/json/', function(data) {
    if (data != null && data.ip != undefined && typeof (data.ip) == "string") {
      ip_Address = data.ip;
    }
  });  
});
  var ip_Address = '';
  function validate(){
    formValidation = $('#engeryForm').parsley({
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
  }

  function getData() {
    var e = JSON.parse(localStorage.getItem("parameters"))
    var data = {
      postcode: getUrlParameter('postcode')|| 'unknown',
      firstname: getUrlParameter('firstname')|| 'unknown',
      lastname: getUrlParameter('lastname')|| 'unknown',
      email: getUrlParameter('email')|| 'unknown',
      phone1: getUrlParameter('phone1')|| 'unknown',
      street1: $(".address-field").val(),
      lead_id: getUrlParameter('lead_id')|| '',
      sid: getUrlParameter('sid')|| 1,
      source: getUrlParameter('source') || '',
      ssid: getUrlParameter('ssid') || 'unknown',
      paymentmethod: getUrlParameter('paymentmethod')|| 'prepayment',
      currentprovider: getUrlParameter('currentprovider')|| 'other',
      prize: getUrlParameter('prize')|| 'mobilephone',
      trafficid: getUrlParameter('trafficid')|| 'Save Energy Bill',
      towncity: getUrlParameter('towncity')|| 'unknown',
      title: getUrlParameter('title')|| 'Mr',
      optindate: getFormattedCurrentDate(),
      optinurl: 'http://deals.megamobiledeals.com/save_energy_bill',
      ipaddress: ip_Address,
      timestamp: new Date,
      user_agent: window.navigator.userAgent,
      parameters: e
    };
    localStorage.setItem("data", JSON.stringify(data))
  }

  function postData() {
    getData();
    var e = JSON.parse(localStorage.getItem("data"));
    console.log(e)
    $.ajax({
      type: "POST",
      url: "https://go.webformsubmit.com/dukeleads/waitsubmit?key=eecf9b6b61edd9e66ca0f7735dfa033a&campid=ENERGY",
      data: e,
      success: function(res) {
        url = "http://mtrk5.co.uk/?a=14118&c=36909&s1=bbexit&s5="+getUrlParameter('postcode')
        window.location = url;
      },
      error: function(res) {
          console.log(res)
      },
    })
  }

  function getUrlParameter(sParam) {
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

  function getFormattedCurrentDate() {
    var date = new Date();
    var day = addZero(date.getDate());
    var monthIndex = addZero(date.getMonth() + 1);
    var year = date.getFullYear();
    var min = addZero(date.getMinutes());
    var hr = addZero(date.getHours());
    var ss = addZero(date.getSeconds());
    return day + '/' + monthIndex + '/' + year + ' ' + hr + ':' + min + ':' + ss;
  }
  function addZero(i) {
    if (i < 10) {
      i = "0" + i;
    }
    return i;
  }

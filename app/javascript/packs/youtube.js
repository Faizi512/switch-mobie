$(document).on('turbolinks:load',function(){
  var isPhone =false
  var ip_Address = '';
  var submtlead = false;
  var formValidation = {};
  validate();

  $.getJSON('https://ipapi.co/json/', function(data) {
    if (data != null && data.ip != undefined && typeof (data.ip) == "string") {
      ip_Address = data.ip;
    }
  })

  $('.btn-deals').prop('disabled', true);
  $('input[name="checkbox"]').click(function () {
    if ($('#checkbox').prop("checked") && isPhone == true){
      if (submtlead == false) {
        submtlead = true;
        postData();
      }
      $('.btn-deals').prop('disabled', false);
    }else{
      $('#mmd-deals').parsley().validate();
    }
  });

  $( ".btn-deals" ).click(function() {
    if ($('#checkbox').prop("checked") && isPhone == true){
      var phoneValue = $("#phone-num").val();
      window.location = "/youtube-success/?phone1=" + phoneValue;
    }
  });
    
  function anOtherValidate(){
     if( document.getElementsByClassName('phone-num')[0].value.length < 10){
      $('#mmd-deals').parsley().validate()
      return false
    }
    return true
  }

  function validate(){
    formValidation = $('#mmd-deals').parsley({
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

     window.Parsley.addValidator('validphone', {
      validateString: function(value){
        var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/mobile?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.phone-num').val())
        return xhr.then(function(json) {
          if (json.status == "Valid") {
            isPhone = true
            if ($('#checkbox').prop("checked") && isPhone == true){
              postData()
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
   
  function getData() {
    var customer_type = isBadCustomer( getUrlParameter('keyword')) || (getUrlParameter('bc') == "yes");
    var e = JSON.parse(localStorage.getItem("parameters"))
    console.log(ip_Address);
    return  n = {
      phone1: $("#phone-num").val(),
      sid: getUrlParameter('sid') || 1,
      ssid: getUrlParameter('ssid') || 1,
      ad_set:getUrlParameter('ad_set') || 1,
      source: getUrlParameter('source') || 'google3',
      c1: getUrlParameter('c1') || '',
      adgroupid: getUrlParameter('adgroupid') || '',
      campaign: getUrlParameter('campaign') || '',
      keyword: getUrlParameter('keyword') || '',
      bad_credit_customer: (customer_type) ? "yes" : "no",
      campaignkey: 'E9F2N6A3R5',
      optindate: getFormattedCurrentDate(),
      optinurl: 'deals.megamobiledeals.com/youtube',  
      ipaddress: ip_Address,
      trafficid: getUrlParameter('trafficid') || "MMD-M",
      prize: getUrlParameter('prize') || 35,
      timestamp: new Date,
      user_agent: window.navigator.userAgent,
      parameters: e
    };
  }
  function postData() {
    var e = getData();
    e['before_send'] = JSON.stringify(getData());
    console.log(e)
    $.ajax({
      type: "POST",
      url: "https://go.webformsubmit.com/dukeleads/waitsubmit?key=eecf9b6b61edd9e66ca0f7735dfa033a&campid=MMD-M",
      data: e,
      success: function(e) {
        console.log(e);
      },
      dataType: "json"
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
  };

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

  function isBadCustomer(query) { 
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

})
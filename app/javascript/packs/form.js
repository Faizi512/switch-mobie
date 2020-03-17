$(document).on('turbolinks:load',function(){
  var formValidation = {}
  validate()   
  var isEmail =false
  var isPhone =false
  var ip_Address = '';
  var currentTab = 0;
   // Current tab is set to be the first tab (0)
  var submtForm = false;
  showTab(currentTab); // Display the current tab
  if(!($('#dealform')[0])) return;

  var data = $('#dealform')[0].dataset.details
  var details = JSON.parse(data)
  if (details.submit_on_load) {
    postData()
  }
  if (details.quick_submit) {
    $('.open-form ').click(function() {
      if (submtForm == false) {
        submtForm = true;
        event.preventDefault();
        postData()
      }
    
    });
  }else{
    $('.open-form ').click(function() {
      event.preventDefault();
      $('#deal-form-modal').modal('show')
      $('.clock').hide()    
    });
  }
  $('.subbtn').click(function(){
    postData()
  })

  $('.submitQuik').click(function() {
      formValidation.whenValidate({
          group: 'block-2' 
      }).done(function() {
        if (submtForm == false) {
          submtForm = true;
          event.preventDefault();
          $('.submitQuik').prop('disabled', true);
          postData()
        }
      })
    });

  $('#deal-form-modal').on('hide.bs.modal', function (e) {
    $('.clock').show()
  });
  var el = document.getElementsByClassName("clock");
  var clock = new FlipClock(el, 6600, {
      countdown: true
  });
  $('[data-toggle="tooltip"]').tooltip();
  

$.getJSON('https://ipapi.co/json/', function(data) {
  if (data != null && data.ip != undefined && typeof (data.ip) == "string") {
    ip_Address = data.ip;
  }
});

$("#f-name").html(getUrlParameter("firstname") || "");

window.onload = function onPageLoad() {
  if (!details.submit_on_load) {
    document.getElementsByName("first_name")[0].value = getUrlParameter("firstname") || "";
    document.getElementsByName("last_name")[0].value = getUrlParameter("lastname")  || "";
    document.getElementsByName("postcode")[0].value = getUrlParameter("postcode")  || "";
    document.getElementsByName("email")[0].value = getUrlParameter("email")  || "";
    document.getElementsByName("telephone")[0].value = getUrlParameter("phone1") || getUrlParameter("mobile") || "";
  }
}

function showTab(n=0) {
  // This function will display the specified tab of the form
  var x = document.getElementsByClassName("tab");
  if (!x[n]) return;
  x[n].style.display = "block";
  fixStepIndicator(n)
}

var currentTab = 0;
function backStep(n){
  if (currentTab > 0) {
    $('.nextStep').prop('disabled', false);
    var x = document.getElementsByClassName("tab");
    x[currentTab].style.display = "none";
    currentTab = currentTab + n;
    showTab(currentTab);
  }
}

function nextStep(n) {
  $('#dealform').parsley().whenValidate({
    group: 'block-' + currentTab
  }).done(function() {
    // $('.nextStep').prop('disabled', true);
    // This function will figure out which tab to display
    var x = document.getElementsByClassName("tab");
    x[currentTab].style.display = "none";
    // Increase or decrease the current tab by 1:
    currentTab = currentTab + n;
    if (currentTab >= x.length) {
      if (anOtherValidate() == true && isPhone == true && isEmail == true){
        $('.but_loader').show()
        $('.nextStep').prop('disabled', true);
        postData()
      }else{
        $('#dealform').parsley().validate()
      }
      return true
    }
    showTab(currentTab);
  })
}

function anOtherValidate(){
  if (document.getElementsByClassName('first_name')[0].value.length < 1 
      || document.getElementsByClassName('last_name')[0].value.length < 1 
  ){
    var x = document.getElementsByClassName("tab");
    x[0].style.display = "block";
    x[1].style.display = "none";
    x[2].style.display = "none";
    currentTab = 0
    $('#dealform').parsley().validate()
    return false
  }else if( document.getElementsByClassName('postcode')[0].value.length < 3){
    var x = document.getElementsByClassName("tab");
    x[1].style.display = "block";
    x[0].style.display = "none";
    x[2].style.display = "none";
    currentTab = 1
    $('#dealform').parsley().validate()
    return false
  }else if(document.getElementsByClassName('email')[0].value.length < 3 
    || document.getElementsByClassName('phone')[0].value.length < 3){
    var x = document.getElementsByClassName("tab");
    x[2].style.display = "block";
    x[0].style.display = "none";
    x[1].style.display = "none";
    currentTab = 2
    $('#dealform').parsley().validate()
    return false
  }
  return true
}

function validate(){
  formValidation = $('#dealform').parsley({
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
      var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/mobile?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.phone').val())
      return xhr.then(function(json) {
        if (json.status == "Valid") {
          isPhone = true
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
  window.Parsley.addValidator('validemail', {
    validateString: function(value){
      var xhr = $.ajax('https://go.webformsubmit.com/dukeleads/restapi/v1.2/validate/email?key=50f64816a3eda24ab9ecf6c265cae858&value='+$('.email').val())
      return xhr.then(function(json) {
        if (json.status == "Valid") {
          isEmail = true
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
  window.Parsley.addValidator('validPostcode', {
    validateString: function(value){
     return /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/i.test(value);
    },
    messages: {
       en: 'Please Enter Valid UK Postcode',
    }
  });  
}
   
function fixStepIndicator(num) {
  var progress = document.getElementById('progressBar');
  if(num >= 0) {
    progress.style.width = (num*33)+"%";
    progress.innerText = "Progress " + (num*33) + "%";
    if( num ==  0){
      progress.innerText = '';
    }
  }
}

function getData() {
  var customer_type = isBadCustomer( getUrlParameter('keyword')) || (getUrlParameter('bc') == "yes");
  var e = JSON.parse(localStorage.getItem("parameters"))
  console.log(ip_Address);
  return {
    postcode: getUrlParameter('postcode') || $(".postcode").val() || '',
    firstname: getUrlParameter('firstname') || $(".first_name").val() || '',
    lastname: getUrlParameter('lastname') || $(".last_name").val() || '',
    email: getUrlParameter('email') || $(".email").val() || '',
    phone1: getUrlParameter('phone1') || $(".phone").val() || '',
    sid: getUrlParameter('sid') || details.sid ||1,
    ssid: getUrlParameter('ssid') || details.ssid ||1,
    ad_set:getUrlParameter('ad_set') || 1,
    source: getUrlParameter('source') || details.source || 'google3',
    c1: getUrlParameter('c1') || getUrlParameter('bstransid') || getUrlParameter('transid') || '',
    adgroupid: getUrlParameter('adgroupid') || '',
    campaign: getUrlParameter('campaign') || '',
    keyword: getUrlParameter('keyword') || '',
    bad_credit_customer: (customer_type) ? "yes" : "no",
    campaignkey: 'E9F2N6A3R5',
    optindate: getFormattedCurrentDate(),
    optinurl: 'deals.megamobiledeals.com'+ details.optin_url,  
    ipaddress: ip_Address,
    trafficid: getUrlParameter('trafficid') || details.form_name,
    prize: getUrlParameter('prize') || 35,
    timestamp: new Date,
    user_agent: window.navigator.userAgent,
    parameters: e
  };    
  // localStorage.setItem("data", JSON.stringify(n))
}
var leadc1 = getUrlParameter('c1') || getUrlParameter('bstransid') || getUrlParameter('transid') || '';
function postData() {
  var e = getData();
  var leadSource = getUrlParameter('source') || details.source || 'google3';
  e['before_send'] = JSON.stringify(getData());
  console.log(e)
  if( details.camp_id == "MEGA-MOBILE-DEALS"){
    $.ajax({
    type: "POST",
    url: '/facebook_custom_audience',
    data: e,
    success: function(e) {
      console.log(e.response);

    },
      dataType: "json"
    })
  }
  $.ajax({
    type: "POST",
    url: "https://go.webformsubmit.com/dukeleads/waitsubmit?key=eecf9b6b61edd9e66ca0f7735dfa033a&campid=" + details.camp_id,
    data: e,
    success: function(e) {
      
    },
    dataType: "json"
  })
  if (!details.submit_on_load) {
    setTimeout(function(){
      if( isBadCustomer(getUrlParameter('keyword')) ||  (getUrlParameter('bc') == "yes")){
        window.location = "https://www.megamobiledeals.com/no-credit-check-deals/?s1=" + leadSource + "&s2=" + leadc1;
      }else{
        window.location = details.success_url + "/?s1=" + leadSource + "&s2=" + leadc1;
      }
    }, 1000)
  }
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
 if (!document.getElementById("btn-continue")) return;
  document.getElementById("btn-continue").onclick = function() {nextStep(1)};
  document.getElementById("btn-back").onclick = function() {backStep(-1)};

});
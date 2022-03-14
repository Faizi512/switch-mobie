import Common from "./common.js"

class ExclusiveIphoneDeals extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showToolTip()
    this.fillform()
    this.popupTerms()
    this.popupPrivacy()
    this.showTab(this.currentTab);
    this.showClock()
    this.togglePopUp()
    this.toggleCheckBox()
    this.checkCookieExist()
    var current_fs, next_fs, previous_fs;

    $( ".property" ).change(function() {      
      $('.towncity').val($(this).find("option:selected").data("city"))
      $('.street1').val($(this).find("option:selected").data("street"))
      $('.county').val($(this).find("option:selected").data("province"))
      $('.houseNumber').val($(this).find("option:selected").data("house-number"))
      $('.street2').val($(this).find("option:selected").data("street2"))
      $('.building').val($(this).find("option:selected").data("building"))
    });

    window.Parsley.on('field:error', function() {
      $(".btn-success").removeClass("in-progress")
      $(".tab").removeClass("in-progress")
    });

    // Next button
    $(".next-button").click(function(){
      $('#dealform').parsley().whenValidate({
        group: 'block-' + CI.currentTab
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
        if (CI.currentTab == 2) {
          if (CI.isPhone == true && CI.isEmail == true){
            CI.postData()
          }else{
            $('#dealform').parsley().validate()
          }
          return true
        }
        CI.currentTab += 1
      })
    });

    // Previous button
    $(".prev").click(function(){
      CI.currentTab -= 1
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

    $(document).on("click", '.open-form', function() {
      var user = localStorage.getItem("user_data")
      if (user != null) {
        CI.postData()
        event.stopPropagation()
      } else {
        CI.phoneName = $(this).find('input').val()
        $('#deal-form-modal').modal('show')
        $('.clock').hide()
        event.stopPropagation()
      }
    });
  }

  postData() {
    var CI = this
    $("#loaderPopup").css('height', '100%')
    if( this.getItemFromStorage("user_data") != null){
      this.userStorage = true
      this.USTransaction();
      this.updateUserInStorage()
      this.submitLead(this.getItemFromStorage("user_data"), this.details.camp_id)
    }
    else{
      var data = this.getData();
      var item = {county: this.getUrlParameter("county") || $(".county").val()}
      data = _.mergeWith(item,data, (data, item))
      if (CI.saveCookie != null)
      {
        CI.setItemToStorage("user_data", data)
      }
      console.log("Postdata: "+new Date())
      this.handleCreditCheckConsent()
      this.submitLead(data, this.details.camp_id)
    }
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

  handleCreditCheckConsent(){
    if ( $('#credit-check').is(':checked') == true) {
      window.open('https://secure.uk.rspcdn.com/xprr/red/PID/2626/SID/'+this.getSid()+'?check=1'+ this.parmsforCreditReport(), "_blank");
    }
  }

}
export default new ExclusiveIphoneDeals();

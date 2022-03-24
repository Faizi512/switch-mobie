import Common from "./common.js"
import _ from 'lodash'

class Smartphones extends Common {
  constructor() {
    super();
    var CI = this;
    this.validate("#dealform")
    this.getFormDetails('#dealform')
    this.showClock()
    this.showTab(this.currentTab);
    this.checkCookieExist()
    this.deviceDetection()
    this.popupTerms()
    this.popupPrivacy()
    this.toggleCheckBox()
    this.togglePopUp()

    var date = new Date();
    var options = { month: 'long'};
    var currentMonth = new Intl.DateTimeFormat('en-US', options).format(date)
    console.log(currentMonth);
    $(".current-month").html(currentMonth)

    $('.carousel').carousel({
      interval: 2000
    });

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

  backStep(n){
    if (this.currentTab > 0) {
      $("#step-header").text(this.currentTab+1) 
      $(`.circle-p-${this.currentTab+1}`).removeClass("neon-text bg-done")
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
          CI.postMMDData()
        }else{
          $('#dealform').parsley().validate()
        }
        return true
      }
      CI.showTab(CI.currentTab);
    })
  }

  showTab(n=0) {
    var tabs = $(".tab");
    if (!tabs[n]) return;
    tabs[n].style.display = "block";
    this.fixStepIndicator(n)
    $(".btn-success").removeClass("in-progress")
    $(".postcode").focus();
    $("#step-header").text(n+1) 
    $(`.circle-p-${n+1}`).addClass("neon-text bg-done")
  }

  fixStepIndicator(num) {
    var progress = document.getElementById('progressBar');
    if(num >= 0) {
      progress.style.width = (num*50)+"%";
    }
  }

  postMMDData() {
    var CI = this;
    if( this.getItemFromStorage("user_data") != null){
      $("#loaderPopup").css('height', '100%')
      CI.userStorage = true
      this.USTransaction();
      this.updateUserInStorage()
      this.submitLead(this.getItemFromStorage("user_data"), this.details.camp_id)
    }
    else{
      var data = this.getData();
      $("#loaderPopup").css('height', '100%')
      if (CI.saveCookie != null)
      {
        CI.setItemToStorage("user_data", data)
      }
      console.log("Postdata: "+new Date())
      this.submitLead(data, this.details.camp_id)
    }
    $(".postcode_holder").html($(".postcode").val() || this.getUrlParameter("postcode")  || "");
    this.updateFacebookAudience(data)
  }

  getItemFromStorage(name){
    return JSON.parse(localStorage.getItem(name))
  }

  updateUserInStorage(){
    var CI=this
    var previousData = this.getItemFromStorage("user_data")
    var currentData = this.getData();
    var userData = _.mergeWith(currentData,previousData, (current, previous) => current == "" || current == "unknown"  ? previous : current)
    CI.setItemToStorage("user_data", userData)
  }

  setItemToStorage(name, data){
    if (data.adopted_url == "" ||  data.adopted_url == null) {
      data.adopted_url = data.optinurl
    }else{
      this.adoptedUrl = data.adopted_url
    }
    return localStorage.setItem(name, JSON.stringify(data))
  }
}
export default new Smartphones();

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

    $(".border-disp").hover(
      function () {
        $(this).addClass("neon-text");
      },
      function () {
        $(this).removeClass("neon-text");
      }
    );

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

  postData() {
    // doubel verify tsp
    this.validateTsp()
    // Getting Data
    var CI = this;
    var data = this.getData();
    // Form Submisson
    this.updateFacebookAudience(data)
    $( ".main-progress").hide()
    this.submitLead(data, this.details.camp_id)
    // Redirection after submisson
    this.successUrl()
  }
}
export default new Smartphones();

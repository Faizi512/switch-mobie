import Common from "./common.js"

class SmartPhones extends Common {
  constructor() {
    super();
    var CI = this;
    this.fillform()
    this.popupTerms()
    this.popupPrivacy()
    this.togglePopUp()
    this.toggleCheckBox()
    this.validate(".slider-two")
    this.getFormDetails('.slider-one')
    this.firstButton = $(".first");
    this.secondButton = $(".second");
    this.thirdButton = $(".third")
    this.input = $("input");
    this.name = $(".name");
    this.more = $(".more");
    this.yourname = $(".yourname");
    this.reset = $(".reset");
    this.firstBackButton = $(".first-back");
    this.secondBackButton = $(".second-back");

    $('.carousel').carousel({
      interval: 2000
    })

    $( ".property" ).change(function() {
      $('.slider-three').removeClass("d-none");
      $('.slider-three').addClass("threestep");
      $('.slider-two').addClass("d-none");
      var ctr = $(".container");
      ctr.addClass("full slider-three-active").removeClass("center slider-two-active slider-one-active");
      $('.towncity').val($(this).find("option:selected").data("city"))
      $('.street1').val($(this).find("option:selected").data("street"))
      $('.county').val($(this).find("option:selected").data("province"))
      $('.houseNumber').val($(this).find("option:selected").data("housenum"))
      $('.street2').val($(this).find("option:selected").data("street2"))
      $('.building').val($(this).find("option:selected").data("building"))
    });

    this.firstButton.on("click", function(e){
      $('.slider-one').parsley().whenValidate({
          group: 'block-0'
      }).done(function() {
        var ctr = $(".container");
        ctr.addClass("center slider-two-active").removeClass("full slider-one-active");
        $('.slider-two-active').removeClass("top-first");
        $('.slider-three').addClass("d-none");
        $('.slider-two').addClass("secondstep");
        $('.slider-two').removeClass("d-none");
        $('.slider-one').removeClass("first-div");
      })
      e.preventDefault();
    });

    this.secondButton.on("click", function(e){
      $('.slider-two').parsley().whenValidate({
          group: 'block-1'
      }).done(function() {
        $('.slider-three').removeClass("d-none");
        $('.slider-three').addClass("threestep");
        $('.slider-two').addClass("d-none");
        var ctr = $(".container");
        ctr.addClass("full slider-three-active").removeClass("center slider-two-active slider-one-active");
      })
      e.preventDefault();
    });

    this.firstBackButton.on("click", function(e){
      var ctr = $(".container");
      ctr.addClass("center slider-one-active").removeClass("full slider-two-active");
      $('.slider-one').addClass("first-div");
      $('.slider-two').addClass("d-none");
      e.preventDefault();
    });

    this.secondBackButton.on("click", function(e){
      $('.slider-three').addClass("d-none");
      $('.slider-three').removeClass("threestep");
      $('.slider-two').removeClass("d-none");
      var ctr = $(".container");
      ctr.addClass("center slider-two-active").removeClass("full slider-three-active");
      e.preventDefault();
    });


    this.thirdButton.on("click", function(e){
      $('.slider-three').parsley().whenValidate({
          group: 'block-2'
      }).done(function() {
        CI.postData();
      })
      e.preventDefault();
    });

    $(document).on("click", '.open-form', function() {
      var user = localStorage.getItem("user_data")
      if (user != null) {
        $("#loaderPopup").css('height', '100%')
        CI.postMMDData()
        event.stopPropagation()
      } else {
        $('#smart-phones-from').modal('show')
        $('.clock').hide()
        event.stopPropagation();
      }
    });

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
      if (CI.myCookie != null)
      {
        CI.setItemToStorage("user_data", data)
      }
      console.log("Postdata: "+new Date())
      this.submitLead(data, this.details.camp_id)
    }

    $(".postcode_holder").html($(".postcode").val() || this.getUrlParameter("postcode")  || "");
    this.updateFacebookAudience(data)
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
  
  
}
export default new SmartPhones();

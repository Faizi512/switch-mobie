import Common from "./common.js"
import _ from 'lodash'

class DayDeals extends Common {
  constructor() {
    super();
    var CI = this;
    this.getFormDetails('#msform');
    this.validate("#msform")
    this.popupTerms()
    this.popupPrivacy()
    this.togglePopUp()
    this.toggleCheckBox()
    this.fillform()
    this.fixStepIndicator(0)
    this.checkCookieExist()
    //jQuery time
    this.current_fs 
    this.next_fs
    this.previous_fs; //fieldsets
    this.left 
    this.opacity 
    this.scale; //fieldset properties which we will animate
    this.animating; //flag to prevent quick multi-click glitches


    $( ".property" ).change(function() {
       CI.currentTab = CI.currentTab + 1;
      if(CI.animating) return false;
        CI.animating = true;
        
        CI.current_fs = $(this).parent().parent().parent();
        CI.next_fs = $(this).parent().parent().parent().next();
        
        //activate next step on progressbar using the index of this.next_fs
        CI.fixStepIndicator(CI.currentTab)
        
        //show the next fieldset
        CI.next_fs.show(); 
        //hide the current fieldset with style
        CI.current_fs.animate({opacity: 0}, {
          step: function(now, mx) {
            //as the opacity of this.current_fs reduces to 0 - stored in "now"
            //1. scale this.current_fs down to 80%
            this.scale = 1 - (1 - now) * 0.2;
            //2. bring this.next_fs from the right(50%)
            this.left = (now * 50)+"%";
            //3. increase opacity of this.next_fs to 1 as it moves in
            this.opacity = 1 - now;
            CI.current_fs.css({
              'transform': 'scale('+this.scale+')',
              'position': 'absolute'
            });
            CI.next_fs.css({'left': this.left, 'opacity': this.opacity});
          }, 
          duration: 800, 
          complete: function(){
            CI.current_fs.hide();
            CI.animating = false;
          }, 
          //this comes from the custom easing plugin
          // easing: 'easeInOutBack'
        });
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
        $("#loaderPopup").css('height', '100%')
        CI.postMMDData()
        event.stopPropagation()
      } else {
        $('#deal-form-modal').modal('show')
        event.stopPropagation();
      }
    });

    $(".next").click(function(){
      $('#msform').parsley().whenValidate({
        group: 'block-' + CI.currentTab
      }).done(() =>{
        var tabs = $("fieldset");
        CI.currentTab = CI.currentTab + 1;
        if(CI.animating) return false;
        CI.animating = true;
        
        CI.current_fs = $(this).parent();
        CI.next_fs = $(this).parent().next();
        
        if (CI.currentTab == 3) {
          if (CI.isPhone == true && CI.isEmail == true){
            CI.postMMDData()
          }else{
            $('#msform').parsley().validate()
          }
          return true
        }
        else{
          //activate next step on progressbar using the index of this.next_fs
          CI.fixStepIndicator(CI.currentTab)
          //show the next fieldset
          CI.next_fs.show(); 
          //hide the current fieldset with style
          CI.current_fs.animate({opacity: 0}, {
            step: function(now, mx) {
              //as the opacity of this.current_fs reduces to 0 - stored in "now"
              //1. scale this.current_fs down to 80%
              this.scale = 1 - (1 - now) * 0.2;
              //2. bring this.next_fs from the right(50%)
              this.left = (now * 50)+"%";
              //3. increase opacity of this.next_fs to 1 as it moves in
              this.opacity = 1 - now;
              CI.current_fs.css({
                'transform': 'scale('+this.scale+')',
                'position': 'absolute'
              });
              CI.next_fs.css({'left': this.left, 'opacity': this.opacity});
            }, 
            duration: 800, 
            complete: function(){
              CI.current_fs.hide();
              CI.animating = false;
            }, 
            //this comes from the custom easing plugin
            // easing: 'easeInOutBack'
          });
        }
      });
    });

    $(".previous").click(function(){
      if(CI.animating) return false;
      CI.animating = true;
      CI.currentTab = CI.currentTab - 1;
      
      CI.current_fs = $(this).parent();
      CI.previous_fs = $(this).parent().prev();
      
      //de-activate current step on progressbar
      CI.fixStepIndicator(CI.currentTab)
      
      //show the previous fieldset
      CI.previous_fs.show(); 
      //hide the current fieldset with style
      CI.current_fs.animate({opacity: 0}, {
        step: function(now, mx) {
          //as the opacity of this.current_fs reduces to 0 - stored in "now"
          //1. scale this.previous_fs from 80% to 100%
          this.scale = 0.8 + (1 - now) * 0.2;
          //2. take this.current_fs to the right(50%) - from 0%
          this.left = ((1-now) * 50)+"%";
          //3. increase opacity of this.previous_fs to 1 as it moves in
          this.opacity = 1 - now;
          CI.current_fs.css({'left': this.left});
          CI.previous_fs.css({'transform': 'scale('+this.scale+')', 'opacity': this.opacity});
        }, 
        duration: 800, 
        complete: function(){
          CI.current_fs.hide();
          CI.animating = false;
        }, 
        //this comes from the custom easing plugin
        //easing: 'easeInOutBack'
      });
    });
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

  successUrl(){
    setTimeout(function(){
      window.location = "/success2"
    }, 2000)
  }
  postMMDData() {
    $("#loaderPopup").css('height', '100%')
    var CI = this;
    $("#loaderPopup").css('height', '100%')
    if( this.getItemFromStorage("user_data") != null){
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
    // Form Submisson
    this.updateFacebookAudience(data)
  }
    fixStepIndicator(num) {
      var progress = document.getElementById('progressBar');
      if(num > 0) {
        progress.style.width = ((num+1) * 33)+"%";
        $('.progress-percent').text(((num+1) * 33) + "%" + " Complete");
      }
      if( num ==  0){
        progress.style.width = (33)+"%";
        $('.progress-percent').text("33% Complete");
      }
    }
}
export default new DayDeals();

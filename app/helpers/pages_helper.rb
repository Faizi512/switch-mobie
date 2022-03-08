module PagesHelper

  def isbadCustomer query
    if(query.present?)
      keywords = ["credit", "accepted", "bad", "score", "sunshine",
                         "no credit", "free", "guaranteed", "gift", "win", "wining", "very",
                         "phone check", "check" , "no upfront", "cheap", "catalogues", "later",
                         "sun", "no deposit", "accepted", "No deposit", "0 deposit"]
      query = query.downcase();
      keywords.each do |word|
        matchedIndex = query.in?(word);
        if (matchedIndex)
          return true;
          break;
        end
      end
      return false
    end
  end

  def credit_report
    @details = {
      camp_id: 'GUY-CREDIT-REPORT',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Credit-Report',
      optin_url: '/credit-report',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def e_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://bill-switchers.com/sp-exit?exit=1',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'e_deals',
      optin_url: '/e_deals',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end
  def e_deals_awin
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://bill-switchers.com/sp-exit?exit=1',
      bad_success_url: '/rmktg-awin',
      form_name: 'e-deals-awin',
      optin_url: '/e-deals-awin',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def uk_credit_ratings
    @details = {
      camp_id: 'GUY-CREDIT-REPORT',
      success_url: 'https://secure.uk.rspcdn.com/xprr/red/PID/2607/SID/',
      bad_success_url: 'https://secure.uk.rspcdn.com/xprr/red/PID/2607/SID/',
      form_name: 'uk-credit-ratings',
      optin_url: '/uk-credit-ratings',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def rmktg_awin
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'rmktg-awin',
      optin_url: '/rmktg-awin',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: true,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def rmktg_sweet
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'rmktg-sweet',
      optin_url: '/rmktg-sweet',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: true,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def lotto
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://bill-switchers.com/sp-exit?exit=1',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Lotto',
      optin_url: '/lotto',
      sid: nil,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def e_deals_voxi
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://bill-switchers.com/sp-exit?exit=1',
      bad_success_url: 'https://www.awin1.com/cread.php?awinmid=10951&awinaffid=652417&clickref=social-exit-voxi&ued=https%3A%2F%2Fwww.voxi.co.uk%2Fplans',
      form_name: 'e-deals-voxi',
      optin_url: '/e-deals-voxi',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def e_deals_e2save
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://bill-switchers.com/sp-exit?exit=1',
      bad_success_url: 'https://www.awin1.com/cread.php?awinmid=422&awinaffid=652417&clickref=social-exit&ued=https%3A%2F%2Fwww.e2save.com%2F',
      form_name: 'e-deals-e2save',
      optin_url: '/e-deals-e2save',
      sid: 1,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def compare
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'compare',
      optin_url: '/compare',
      sid: nil,
      ssid: nil,
      source:'google-home-page2',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end


  def home
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Switch-Mobile',
      optin_url: '',
      sid: nil,
      ssid: nil,
      source:'google-home-page',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def tiktok
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'tiktok',
      optin_url: '/tiktok',
      sid: nil,
      ssid: nil,
      source:'google-home-page',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def home_new
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'home-new',
      optin_url: '/home-new',
      sid: nil,
      ssid: nil,
      source:'home-new',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def exclusive_iphone_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      bad_success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      form_name: 'exclusive_iphone_deals',
      optin_url: '/exclusive_iphone_deals',
      sid: 1,
      ssid: 1,
      source:'exclusive_iphone_deals',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def exclusive_iphone_deals_tiktok
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      bad_success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      form_name: 'exclusive-iphone-deals-tiktok',
      optin_url: '/exclusive-iphone-deals-tiktok',
      sid: 1,
      ssid: 1,
      source:'exclusive-iphone-deals-tiktok',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def exclusive_iphone_deals_new
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      bad_success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      form_name: 'exclusive_iphone_deals_new',
      optin_url: '/exclusive_iphone_deals_new',
      sid: 1,
      ssid: 1,
      source:'exclusive_iphone_deals_new',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      ipaddress: request.remote_ip,
    }.to_json
  end

  def home_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Switch-Mobile',
      optin_url: '/new',
      sid: nil,
      ssid: nil,
      source:'google-home-page',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json

    @featured_deals = [
      {
        name: "iPhone 12",
        image: "iphone_12_black.png",
        url:"/success",
        deposit: "£0"
      },
      {
        name: "iPhone 11 Pro Max",
        image: "phone/1iphone-11-pro-max.png",
        url:"/success",
        deposit: "£0"
      }
    ]

    @phones = [
      {
        name: "iPhone 13 Pro Max",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro-max.png"),  
      },
      {
        name: "Samsung Galaxy Z Fold3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-fold3.png"),
      },
      {
        name: "iPhone 13",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13.png"),
      },
      {
        name: "iPhone 13 Pro",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro.png"),
      },
      {
        name: "Samsung Galaxy Z Flip3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-flip3.png"),
      },
      {
        name: "iPhone 13 Mini",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-mini.png"),
      },
      {
        name: "iPhone 12",
        btn_text: "Exclusive Deal",
        image: "iphone_12_black.png"
      },
      {
        name: "iPhone 11",
        btn_text: "Get Deal",
        image: "phone/iphone11.png",
      },
      {
        name: "Galaxy S20",
        btn_text: "Exclusive Deal",
        image: "phone/s20-5g.png"
      },
      {
        name: "iPhone XS",
        btn_text: "Get Deal",
        image: "phone/iphonexs.png"
      },
      {
        name: "Galaxy S10",
        btn_text: "Get Deal",
        image: "phone/samsungs10.png"
      },
      {
        name: "iPhone 11 Pro",
        btn_text: "Exclusive Deal",
        image: "phone/iphone11pro.png"
      },
      {
        name: "Note 20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-note20-ultra.png"
      },
      {
        name: "Samsung A20",
        btn_text: "Get Deal",
        image: "phone/samsung-a20.png"
      },
      {
        name: "Galaxy S20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-s20-5g1.jpg"
      },
      {
        name: "iPhone SE 128GB",
        btn_text: "Get Deal",
        image: "phone/iphonese.jpg"
      },
      {
        name: "S20 Ultra 5G",
        btn_text: "Get Deal",
        image: "phone/s20-ultra-5g.png"
      },
      {
        name: "Huawei P30",
        btn_text: "Exclusive Deal",
        image: "phone/huaweip30.png"
      }
    ]

    @testimonials = [
      {
        name: 'Sophie',
        comment: 'Brilliant service, ordered my phone and it arrived very soon. Absolutely delighted!',
        date: 'May 21, 2021',
        image: 'comment1.png'
      },
      {
        name: 'John',
        comment: 'Got the latest iPhone with no upfront payment - really good offer.',
        date: 'Jan 04, 2021',
        image: 'comment3.png'
      },
      {
        name: 'Elizabeth',
        comment: 'Really helpful staff, got an amazing deal on my SIM only plan, saving over £15 per month now',
        date: 'March 03, 2021',
        image: 'comment2.png'
      }
    ]
    partners_list
  end

  def new_tiktok
     @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'New-TikTok',
      optin_url: '/new-tiktok',
      sid: nil,
      ssid: nil,
      source:'google-home-page',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json
     
     @featured_deals = [
      {
        name: "iPhone 12",
        image: "iphone_12_black.png",
        url:"/success",
        deposit: "£0"
      },
      {
        name: "iPhone 11 Pro Max",
        image: "phone/1iphone-11-pro-max.png",
        url:"/success",
        deposit: "£0"
      }
    ]

    @phones = [
      {
        name: "iPhone 13 Pro Max",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro-max.png"),  
      },
      {
        name: "Samsung Galaxy Z Fold3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-fold3.png"),
      },
      {
        name: "iPhone 13",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13.png"),
      },
      {
        name: "iPhone 13 Pro",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro.png"),
      },
      {
        name: "Samsung Galaxy Z Flip3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-flip3.png"),
      },
      {
        name: "iPhone 13 Mini",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-mini.png"),
      },
      {
        name: "iPhone 12",
        btn_text: "Exclusive Deal",
        image: "iphone_12_black.png"
      },
      {
        name: "iPhone 11",
        btn_text: "Get Deal",
        image: "phone/iphone11.png",
      },
      {
        name: "Galaxy S20",
        btn_text: "Exclusive Deal",
        image: "phone/s20-5g.png"
      },
      {
        name: "iPhone XS",
        btn_text: "Get Deal",
        image: "phone/iphonexs.png"
      },
      {
        name: "Galaxy S10",
        btn_text: "Get Deal",
        image: "phone/samsungs10.png"
      },
      {
        name: "iPhone 11 Pro",
        btn_text: "Exclusive Deal",
        image: "phone/iphone11pro.png"
      },
      {
        name: "Note 20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-note20-ultra.png"
      },
      {
        name: "Samsung A20",
        btn_text: "Get Deal",
        image: "phone/samsung-a20.png"
      },
      {
        name: "Galaxy S20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-s20-5g1.jpg"
      },
      {
        name: "iPhone SE 128GB",
        btn_text: "Get Deal",
        image: "phone/iphonese.jpg"
      },
      {
        name: "S20 Ultra 5G",
        btn_text: "Get Deal",
        image: "phone/s20-ultra-5g.png"
      },
      {
        name: "Huawei P30",
        btn_text: "Exclusive Deal",
        image: "phone/huaweip30.png"
      }
    ]

    @testimonials = [
      {
        name: 'Sophie',
        comment: 'Brilliant service, ordered my phone and it arrived very soon. Absolutely delighted!',
        date: 'May 21, 2021',
        image: 'comment1.png'
      },
      {
        name: 'John',
        comment: 'Got the latest iPhone with no upfront payment - really good offer.',
        date: 'Jan 04, 2021',
        image: 'comment3.png'
      },
      {
        name: 'Elizabeth',
        comment: 'Really helpful staff, got an amazing deal on my SIM only plan, saving over £15 per month now',
        date: 'March 03, 2021',
        image: 'comment2.png'
      }
    ]
    partners_list
  end

     
  

    def deal_of_the_day
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'deal-of-the-day',
      optin_url: '/deal-of-the-day',
      sid: nil,
      ssid: nil,
      source:'deal-of-the-day',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json

    @phones = [
      {
        top_text:"Deal of the day",
        name: "iPhone 13 Pro Max",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro-max.png"),  
      },
      {
        top_text:"Special Offer",
        name: " Galaxy Z Fold3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-fold3.png"),
      },
      {
        top_text:"Special Offer",
        name: "iPhone 13",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13.png"),
      },
      {
        top_text:"Exclusive",
        name: "iPhone 13 Pro",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro.png"),
      },
      {
        top_text:"Exclusive",
        name: " Galaxy Z Flip3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-flip3.png"),
      },
      {
        top_text:"Exclusive",
        name: "iPhone 13 Mini",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-mini.png"),
      },
      {
        top_text:"Special Offer",
        name: "iPhone 12",
        btn_text: "Exclusive Deal",
        image: "iphone_12_black.png"
      },
      {
        top_text:"Special Offer",
        name: "iPhone 11",
        btn_text: "Get Deal",
        image: "phone/iphone11.png",
      },
      {
        top_text:"Special Deal",
        name: "Galaxy S20",
        btn_text: "Exclusive Deal",
        image: "phone/s20-5g.png"
      },
      {
        top_text:"Special Deal",
        name: "iPhone XS",
        btn_text: "Get Deal",
        image: "phone/iphonexs.png"
      },
      {
        top_text:"Special Deal",
        name: "Galaxy S10",
        btn_text: "Get Deal",
        image: "phone/samsungs10.png"
      },
      {
        top_text:"Special Deal",
        name: "iPhone 11 Pro",
        btn_text: "Exclusive Deal",
        image: "phone/iphone11pro.png"
      },
      {
        top_text:"Limited Offer",
        name: "Note 20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-note20-ultra.png"
      },
      {
        top_text:"Limited Offer",
        name: "Samsung A20",
        btn_text: "Get Deal",
        image: "phone/samsung-a20.png"
      },
      {
        top_text:"Limited Offer",
        name: "Galaxy S20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-s20-5g1.jpg"
      },
      {
        top_text:"Special Deal",
        name: "iPhone SE 128GB",
        btn_text: "Get Deal",
        image: "phone/iphonese.jpg"
      },
      {
        top_text:"Special Deal",
        name: "S20 Ultra 5G",
        btn_text: "Get Deal",
        image: "phone/s20-ultra-5g.png"
      },
      {
        top_text:"Special Deal",
        name: "Huawei P30",
        btn_text: "Exclusive Deal",
        image: "phone/huaweip30.png"
      }
    ] 
  end


  def new_v2
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'new-v2',
      optin_url: '/new-v2',
      sid: nil,
      ssid: nil,
      source:'new-v2',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json

    @featured_deals = [
      {
        name: "iPhone 12",
        image: "iphone_12_black.png",
        url:"/success",
        deposit: "£0"
      },
      {
        name: "iPhone 11 Pro Max",
        image: "phone/1iphone-11-pro-max.png",
        url:"/success",
        deposit: "£0"
      }
    ]

    @phones = [
      {
        name: "iPhone 13 Pro Max",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro-max.png"),  
      },
      {
        name: "Samsung Galaxy Z Fold3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-fold3.png"),
      },
      {
        name: "iPhone 13",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13.png"),
      },
      {
        name: "iPhone 13 Pro",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-pro.png"),
      },
      {
        name: "Samsung Galaxy Z Flip3 5G",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("z-flip3.png"),
      },
      {
        name: "iPhone 13 Mini",
        btn_text: "Exclusive Deal",
        image: view_context.image_url("phone/apple-iphone-13-mini.png"),
      },
      {
        name: "iPhone 12",
        btn_text: "Exclusive Deal",
        image: "iphone_12_black.png"
      },
      {
        name: "iPhone 11",
        btn_text: "Get Deal",
        image: "phone/iphone11.png",
      },
      {
        name: "Galaxy S20",
        btn_text: "Exclusive Deal",
        image: "phone/s20-5g.png"
      },
      {
        name: "iPhone XS",
        btn_text: "Get Deal",
        image: "phone/iphonexs.png"
      },
      {
        name: "Galaxy S10",
        btn_text: "Get Deal",
        image: "phone/samsungs10.png"
      },
      {
        name: "iPhone 11 Pro",
        btn_text: "Exclusive Deal",
        image: "phone/iphone11pro.png"
      },
      {
        name: "Note 20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-note20-ultra.png"
      },
      {
        name: "Samsung A20",
        btn_text: "Get Deal",
        image: "phone/samsung-a20.png"
      },
      {
        name: "Galaxy S20 5G",
        btn_text: "Exclusive Deal",
        image: "phone/samsung-galaxy-s20-5g1.jpg"
      },
      {
        name: "iPhone SE 128GB",
        btn_text: "Get Deal",
        image: "phone/iphonese.jpg"
      },
      {
        name: "S20 Ultra 5G",
        btn_text: "Get Deal",
        image: "phone/s20-ultra-5g.png"
      },
      {
        name: "Huawei P30",
        btn_text: "Exclusive Deal",
        image: "phone/huaweip30.png"
      }
    ]

    @testimonials = [
      {
        name: 'Sophie',
        comment: 'Brilliant service, ordered my phone and it arrived very soon. Absolutely delighted!',
        date: 'May 21, 2021',
        image: 'comment1.png'
      },
      {
        name: 'John',
        comment: 'Got the latest iPhone with no upfront payment - really good offer.',
        date: 'Jan 04, 2021',
        image: 'comment3.png'
      },
      {
        name: 'Elizabeth',
        comment: 'Really helpful staff, got an amazing deal on my SIM only plan, saving over £15 per month now',
        date: 'March 03, 2021',
        image: 'comment2.png'
      }
    ]
    partners_list
  end

  def latest_mobile_deals_uk
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      bad_success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      form_name: 'latest_mobile_deals_uk',
      optin_url: '/latest-mobile-deals-uk',
      sid: nil,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      ipaddress: request.remote_ip,
    }.to_json

    @samsungs21 = [
      {
        name: "Samsung Galaxy S21 5G",
        image: ["samsung/grey-galaxy-s21.png","samsung/orang-galaxy-s21.png","samsung/violet-galaxy-s21.png","samsung/white-galaxy-s21.png"],
        btn_text: "Get This Deal",
        color: ["#6e7074","#efc5be","#a5a8c4","#e9e9e7"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones212",
      },
    ]
    @samsungs21plus = [
      {
        name: "Samsung Galaxy S21 Plus",
        image: ["samsung/golden-galaxy-s21plus.png","samsung/black-galaxy-s21plus.png","samsung/violet-galaxy-s21.png","samsung/silver-galaxy-s21plus.png","samsung/red-galaxy-s21plus.png"],
        btn_text: "Get This Deal",
        color: ["#dcb5b3","#211e16","#a5a8c4","#c2c9d5","#cc333d"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21plus2",
      },
    ]
    @samsungs21ultra = [
      {
        name: "Samsung Galaxy S21 Ultra",
        image: ["samsung/silver-galaxy-s21-ultra.png","samsung/black-galaxy-s21-ultra.png","samsung/brown-galaxy-s21-ultra.png","samsung/titanium-galaxy-s21-ultra.png","samsung/navy-galaxy-s21-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#c2c9d5","#211e16","#5f4e4b","#6e7074","#3a414a"],
        memory: "128GB/256/512GB",
        ram:  "12GB",
        carouselid:"phones21ultra2",
      },
    ]
    @samsungzflip = [
      {
        name: "Samsung Galaxy Z Flip3",
        image: ["samsung/gold-galaxy-z-flip3.png","samsung/black-galaxy-z-flip3.png","samsung/green-galaxy-z-flip3.png","samsung/lavender-galaxy-z-flip3.png"],
        btn_text: "Get This Deal",
        color: ["#e3deca","#2d2926","#435551","#bfb1d2"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phonezflip3",
      },
    ]
    @samsungzfold = [
      {
        name: "Samsung Galaxy Z Fold3",
        image: ["samsung/silver-galaxy-z-fold3.png","samsung/black-galaxy-z-fold3.png","samsung/green-galaxy-z-fold3.png"],
        btn_text: "Get This Deal",
        color: ["#cac6c4","#2d2926","#384a46"],
        memory: "256/512GB",
        ram:  "12GB",
        carouselid:"phonezfold3",
      },
    ]
    @samsungnote20 = [
      {
        name: "Samsung Galaxy Note 20",
        image: ["samsung/green-galaxy-note20.png","samsung/bronze-galaxy-note20.png","samsung/grey-galaxy-note20.png"],
        btn_text: "Get This Deal",
        color: ["#91b098","#9a716e","#545859"],
        memory: "256GB",
        ram:  "8GB",
        carouselid:"phonenote20",
      },
    ]
    @samsungnote20ultra = [
      {
        name: "Samsung Galaxy Note 20 Ultra",
        image: ["samsung/bronze-galaxy-note20-ultra.png","samsung/black-galaxy-note20-ultra.png","samsung/white-galaxy-note20-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#9a716e","#1a1815","#dad9db"],
        memory: "256/512GB",
        ram:  "8GB",
        carouselid:"phonenote20ultra",
      },
    ]

    @phones = [
      {
        name: "Samsung Galaxy S21 Ultra",
        image: ["samsung/silver-galaxy-s21-ultra.png","samsung/black-galaxy-s21-ultra.png","samsung/brown-galaxy-s21-ultra.png","samsung/titanium-galaxy-s21-ultra.png","samsung/navy-galaxy-s21-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#c2c9d5","#211e16","#5f4e4b","#6e7074","#3a414a"],
        memory: "128GB/256/512GB",
        ram:  "12GB",
        carouselid:"phones21ultra",
      },
      {
        name: "iPhone 13 Pro Max",
        image: ["iphone-13/iphone-13-pro-blue.png","iphone-13/iphone-13-pro-gold.png","iphone-13/iphone-13-pro-graphite.png","iphone-13/iphone-13-pro-silver.png"],
        btn_text: "Get This Deal",
        color: ["#C2DDFA","#FAE6CB","#777571","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13promax",
      },
      {
        name: "Samsung Galaxy S21 Plus",
        image: ["samsung/golden-galaxy-s21plus.png","samsung/black-galaxy-s21plus.png","samsung/violet-galaxy-s21.png","samsung/silver-galaxy-s21plus.png","samsung/red-galaxy-s21plus.png"],
        btn_text: "Get This Deal",
        color: ["#dcb5b3","#211e16","#a5a8c4","#c2c9d5","#cc333d"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21plus",
      },
      {
        name: "iPhone 13 Pro",
        image: ["iphone-13/iphone-13-pro-silver.png","iphone-13/iphone-13-pro-gold.png","iphone-13/iphone-13-pro-graphite.png","iphone-13/iphone-13-pro-blue.png"],
        btn_text: "Get This Deal",
        color: ["#F7F8F2","#FAE6CB","#777571","#C2DDFA"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13pro",
      },
      {
        name: "Samsung Galaxy S21 5G",
        image: ["samsung/grey-galaxy-s21.png","samsung/orang-galaxy-s21.png","samsung/violet-galaxy-s21.png","samsung/white-galaxy-s21.png"],
        btn_text: "Get This Deal",
        color: ["#6e7074","#efc5be","#a5a8c4","#e9e9e7"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21",
      },
      {
        name: "iPhone 13",
        image: ["iphone-13/iphone-13-blue.png","iphone-13/iphone-13-midnight.png","iphone-13/iphone-13-pink.png","iphone-13/iphone-13-product-red.png","iphone-13/iphone-13-starlight.png"],
        btn_text: "Get This Deal",
        color: ["#4F82A3","#21282F","#FDE0DB","#C01728","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13",
      },
      {
        name: "Samsung Galaxy Z Flip3",
        image: ["samsung/gold-galaxy-z-flip3.png","samsung/black-galaxy-z-flip3.png","samsung/green-galaxy-z-flip3.png","samsung/lavender-galaxy-z-flip3.png"],
        btn_text: "Get This Deal",
        color: ["#e3deca","#2d2926","#435551","#bfb1d2"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phoneszflip3",
      },
      {
        name: "iPhone 13 Mini",
        image: ["iphone-13/iphone-13-pink.png","iphone-13/iphone-13-midnight.png","iphone-13/iphone-13-blue.png","iphone-13/iphone-13-product-red.png","iphone-13/iphone-13-starlight.png"],
        btn_text: "Get This Deal",
        color: ["#FDE0DB","#21282F","#4F82A3","#C01728","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13mini",
      },
      {
        name: "Samsung Galaxy S20 FE",
        image: ["samsung/navy-galaxy-s20-fe.png","samsung/mint-galaxy-s20-fe.png","samsung/red-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#485167","#b6cfd0","#b73439","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20fe",
      },
      {
        name: "iPhone 12",
        image: ["iphone-12/iphone-12-blue.png","iphone-12/iphone-12-black.png","iphone-12/iphone-12-green.png","iphone-12/iphone-12-red.png","iphone-12/iphone-12-white.png","iphone-12/iphone-12-purple.png"],
        btn_text: "Get This Deal",
        color: ["#1E4971","#323036","#ECFFE7","#C01728","#FEFAF8","#CDC4FB"],
        memory: "64GB/128GB/256GB",
        ram:  "4GB",
        carouselid:"phonesiphone12",
      },
      {
        name: "Samsung Galaxy Z Fold3",
        image: ["samsung/silver-galaxy-z-fold3.png","samsung/black-galaxy-z-fold3.png","samsung/green-galaxy-z-fold3.png"],
        btn_text: "Get This Deal",
        color: ["#cac6c4","#2d2926","#384a46"],
        memory: "256/512GB",
        ram:  "12GB",
        carouselid:"phoneszfold3",
      },
      {
        name: "Samsung Galaxy M52",
        image: ["samsung/blue-galaxy-m52.png","samsung/black-galaxy-m52.png","samsung/white-galaxy-m52.png"],
        btn_text: "Get This Deal",
        color: ["#2d5eab","#000000","#ffffff"],
        memory: "128GB",
        ram:  "6/8GB",
        carouselid:"phonem52",
      },
      {
        name: "Samsung Galaxy A52s",
        image: ["samsung/lavender-galaxy-a52s.png","samsung/black-galaxy-a52s.png","samsung/white-galaxy-a52s.png","samsung/mint-galaxy-a52s.png"],
        btn_text: "Get This Deal",
        color: ["#b9b7d4","#494d35","#ecece5","#c7e9e3"],
        memory: "128GB",
        ram:  "8GB",
        carouselid:"phonea52s",
      },
      {
        name: "iPhone 12 Mini",
        image: ["iphone-12/iphone-12-purple.png","iphone-12/iphone-12-black.png","iphone-12/iphone-12-green.png","iphone-12/iphone-12-red.png","iphone-12/iphone-12-white.png","iphone-12/iphone-12-blue.png"],
        btn_text: "Get This Deal",
        color: ["#CDC4FB","#323036","#ECFFE7","#C01728","#FEFAF8","#1E4971"],
        memory: "64GB/128GB/256GB",
        ram:  "4GB",
        carouselid:"phonesiphone12mini",
      },
      {
        name: "Galaxy S20 FE (SM-G780G)",
        image: ["samsung/red-galaxy-s20-fe.png","samsung/navy-galaxy-s20-fe.png","samsung/mint-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#b73439","#485167","#b6cfd0","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20feg780g",
      },
      {
        name: "Samsung Galaxy A03s",
        image: ["samsung/blue-galaxy-a03s.png","samsung/black-galaxy-a03s.png"],
        btn_text: "Get This Deal",
        color: ["#204874","#000000"],
        memory: "32GB",
        ram:  "3GB",
        carouselid:"phonea03s",
      },
      {
        name: "Galaxy S20 FE (SM-G780F)",
        image: ["samsung/mint-galaxy-s20-fe.png","samsung/navy-galaxy-s20-fe.png","samsung/red-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#b6cfd0","#485167","#b73439","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20feg780f",
      },
      {
        name: "Samsung Galaxy A72",
        image: ["samsung/violet-galaxy-a72.png","samsung/black-galaxy-a72.png","samsung/white-galaxy-a72.png","samsung/blue-galaxy-a72.png"],
        btn_text: "Get This Deal",
        color: ["#b9b7d4","#1f2018","#ecece5","#7ab7dc"],
        memory: "128GB",
        ram:  "8GB",
        carouselid:"phonea72",
      },
    ]
    
  end

  def latest_mobile_deals_uk_tiktok
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      bad_success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      form_name: 'latest_mobile_deals_uk_tiktok',
      optin_url: '/latest-mobile-deals-uk-tiktok',
      sid: nil,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      ipaddress: request.remote_ip,
    }.to_json

    @samsungs21 = [
      {
        name: "Samsung Galaxy S21 5G",
        image: ["samsung/grey-galaxy-s21.png","samsung/orang-galaxy-s21.png","samsung/violet-galaxy-s21.png","samsung/white-galaxy-s21.png"],
        btn_text: "Get This Deal",
        color: ["#6e7074","#efc5be","#a5a8c4","#e9e9e7"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones212",
      },
    ]
    @samsungs21plus = [
      {
        name: "Samsung Galaxy S21 Plus",
        image: ["samsung/golden-galaxy-s21plus.png","samsung/black-galaxy-s21plus.png","samsung/violet-galaxy-s21.png","samsung/silver-galaxy-s21plus.png","samsung/red-galaxy-s21plus.png"],
        btn_text: "Get This Deal",
        color: ["#dcb5b3","#211e16","#a5a8c4","#c2c9d5","#cc333d"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21plus2",
      },
    ]
    @samsungs21ultra = [
      {
        name: "Samsung Galaxy S21 Ultra",
        image: ["samsung/silver-galaxy-s21-ultra.png","samsung/black-galaxy-s21-ultra.png","samsung/brown-galaxy-s21-ultra.png","samsung/titanium-galaxy-s21-ultra.png","samsung/navy-galaxy-s21-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#c2c9d5","#211e16","#5f4e4b","#6e7074","#3a414a"],
        memory: "128GB/256/512GB",
        ram:  "12GB",
        carouselid:"phones21ultra2",
      },
    ]
    @samsungzflip = [
      {
        name: "Samsung Galaxy Z Flip3",
        image: ["samsung/gold-galaxy-z-flip3.png","samsung/black-galaxy-z-flip3.png","samsung/green-galaxy-z-flip3.png","samsung/lavender-galaxy-z-flip3.png"],
        btn_text: "Get This Deal",
        color: ["#e3deca","#2d2926","#435551","#bfb1d2"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phonezflip3",
      },
    ]
    @samsungzfold = [
      {
        name: "Samsung Galaxy Z Fold3",
        image: ["samsung/silver-galaxy-z-fold3.png","samsung/black-galaxy-z-fold3.png","samsung/green-galaxy-z-fold3.png"],
        btn_text: "Get This Deal",
        color: ["#cac6c4","#2d2926","#384a46"],
        memory: "256/512GB",
        ram:  "12GB",
        carouselid:"phonezfold3",
      },
    ]
    @samsungnote20 = [
      {
        name: "Samsung Galaxy Note 20",
        image: ["samsung/green-galaxy-note20.png","samsung/bronze-galaxy-note20.png","samsung/grey-galaxy-note20.png"],
        btn_text: "Get This Deal",
        color: ["#91b098","#9a716e","#545859"],
        memory: "256GB",
        ram:  "8GB",
        carouselid:"phonenote20",
      },
    ]
    @samsungnote20ultra = [
      {
        name: "Samsung Galaxy Note 20 Ultra",
        image: ["samsung/bronze-galaxy-note20-ultra.png","samsung/black-galaxy-note20-ultra.png","samsung/white-galaxy-note20-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#9a716e","#1a1815","#dad9db"],
        memory: "256/512GB",
        ram:  "8GB",
        carouselid:"phonenote20ultra",
      },
    ]

    @phones = [
      {
        name: "Samsung Galaxy S21 Ultra",
        image: ["samsung/silver-galaxy-s21-ultra.png","samsung/black-galaxy-s21-ultra.png","samsung/brown-galaxy-s21-ultra.png","samsung/titanium-galaxy-s21-ultra.png","samsung/navy-galaxy-s21-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#c2c9d5","#211e16","#5f4e4b","#6e7074","#3a414a"],
        memory: "128GB/256/512GB",
        ram:  "12GB",
        carouselid:"phones21ultra",
      },
      {
        name: "iPhone 13 Pro Max",
        image: ["iphone-13/iphone-13-pro-blue.png","iphone-13/iphone-13-pro-gold.png","iphone-13/iphone-13-pro-graphite.png","iphone-13/iphone-13-pro-silver.png"],
        btn_text: "Get This Deal",
        color: ["#C2DDFA","#FAE6CB","#777571","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13promax",
      },
      {
        name: "Samsung Galaxy S21 Plus",
        image: ["samsung/golden-galaxy-s21plus.png","samsung/black-galaxy-s21plus.png","samsung/violet-galaxy-s21.png","samsung/silver-galaxy-s21plus.png","samsung/red-galaxy-s21plus.png"],
        btn_text: "Get This Deal",
        color: ["#dcb5b3","#211e16","#a5a8c4","#c2c9d5","#cc333d"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21plus",
      },
      {
        name: "iPhone 13 Pro",
        image: ["iphone-13/iphone-13-pro-silver.png","iphone-13/iphone-13-pro-gold.png","iphone-13/iphone-13-pro-graphite.png","iphone-13/iphone-13-pro-blue.png"],
        btn_text: "Get This Deal",
        color: ["#F7F8F2","#FAE6CB","#777571","#C2DDFA"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13pro",
      },
      {
        name: "Samsung Galaxy S21 5G",
        image: ["samsung/grey-galaxy-s21.png","samsung/orang-galaxy-s21.png","samsung/violet-galaxy-s21.png","samsung/white-galaxy-s21.png"],
        btn_text: "Get This Deal",
        color: ["#6e7074","#efc5be","#a5a8c4","#e9e9e7"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21",
      },
      {
        name: "iPhone 13",
        image: ["iphone-13/iphone-13-blue.png","iphone-13/iphone-13-midnight.png","iphone-13/iphone-13-pink.png","iphone-13/iphone-13-product-red.png","iphone-13/iphone-13-starlight.png"],
        btn_text: "Get This Deal",
        color: ["#4F82A3","#21282F","#FDE0DB","#C01728","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13",
      },
      {
        name: "Samsung Galaxy Z Flip3",
        image: ["samsung/gold-galaxy-z-flip3.png","samsung/black-galaxy-z-flip3.png","samsung/green-galaxy-z-flip3.png","samsung/lavender-galaxy-z-flip3.png"],
        btn_text: "Get This Deal",
        color: ["#e3deca","#2d2926","#435551","#bfb1d2"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phoneszflip3",
      },
      {
        name: "iPhone 13 Mini",
        image: ["iphone-13/iphone-13-pink.png","iphone-13/iphone-13-midnight.png","iphone-13/iphone-13-blue.png","iphone-13/iphone-13-product-red.png","iphone-13/iphone-13-starlight.png"],
        btn_text: "Get This Deal",
        color: ["#FDE0DB","#21282F","#4F82A3","#C01728","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13mini",
      },
      {
        name: "Samsung Galaxy S20 FE",
        image: ["samsung/navy-galaxy-s20-fe.png","samsung/mint-galaxy-s20-fe.png","samsung/red-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#485167","#b6cfd0","#b73439","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20fe",
      },
      {
        name: "iPhone 12",
        image: ["iphone-12/iphone-12-blue.png","iphone-12/iphone-12-black.png","iphone-12/iphone-12-green.png","iphone-12/iphone-12-red.png","iphone-12/iphone-12-white.png","iphone-12/iphone-12-purple.png"],
        btn_text: "Get This Deal",
        color: ["#1E4971","#323036","#ECFFE7","#C01728","#FEFAF8","#CDC4FB"],
        memory: "64GB/128GB/256GB",
        ram:  "4GB",
        carouselid:"phonesiphone12",
      },
      {
        name: "Samsung Galaxy Z Fold3",
        image: ["samsung/silver-galaxy-z-fold3.png","samsung/black-galaxy-z-fold3.png","samsung/green-galaxy-z-fold3.png"],
        btn_text: "Get This Deal",
        color: ["#cac6c4","#2d2926","#384a46"],
        memory: "256/512GB",
        ram:  "12GB",
        carouselid:"phoneszfold3",
      },
      {
        name: "Samsung Galaxy M52",
        image: ["samsung/blue-galaxy-m52.png","samsung/black-galaxy-m52.png","samsung/white-galaxy-m52.png"],
        btn_text: "Get This Deal",
        color: ["#2d5eab","#000000","#ffffff"],
        memory: "128GB",
        ram:  "6/8GB",
        carouselid:"phonem52",
      },
      {
        name: "Samsung Galaxy A52s",
        image: ["samsung/lavender-galaxy-a52s.png","samsung/black-galaxy-a52s.png","samsung/white-galaxy-a52s.png","samsung/mint-galaxy-a52s.png"],
        btn_text: "Get This Deal",
        color: ["#b9b7d4","#494d35","#ecece5","#c7e9e3"],
        memory: "128GB",
        ram:  "8GB",
        carouselid:"phonea52s",
      },
      {
        name: "iPhone 12 Mini",
        image: ["iphone-12/iphone-12-purple.png","iphone-12/iphone-12-black.png","iphone-12/iphone-12-green.png","iphone-12/iphone-12-red.png","iphone-12/iphone-12-white.png","iphone-12/iphone-12-blue.png"],
        btn_text: "Get This Deal",
        color: ["#CDC4FB","#323036","#ECFFE7","#C01728","#FEFAF8","#1E4971"],
        memory: "64GB/128GB/256GB",
        ram:  "4GB",
        carouselid:"phonesiphone12mini",
      },
      {
        name: "Galaxy S20 FE (SM-G780G)",
        image: ["samsung/red-galaxy-s20-fe.png","samsung/navy-galaxy-s20-fe.png","samsung/mint-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#b73439","#485167","#b6cfd0","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20feg780g",
      },
      {
        name: "Samsung Galaxy A03s",
        image: ["samsung/blue-galaxy-a03s.png","samsung/black-galaxy-a03s.png"],
        btn_text: "Get This Deal",
        color: ["#204874","#000000"],
        memory: "32GB",
        ram:  "3GB",
        carouselid:"phonea03s",
      },
      {
        name: "Galaxy S20 FE (SM-G780F)",
        image: ["samsung/mint-galaxy-s20-fe.png","samsung/navy-galaxy-s20-fe.png","samsung/red-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#b6cfd0","#485167","#b73439","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20feg780f",
      },
      {
        name: "Samsung Galaxy A72",
        image: ["samsung/violet-galaxy-a72.png","samsung/black-galaxy-a72.png","samsung/white-galaxy-a72.png","samsung/blue-galaxy-a72.png"],
        btn_text: "Get This Deal",
        color: ["#b9b7d4","#1f2018","#ecece5","#7ab7dc"],
        memory: "128GB",
        ram:  "8GB",
        carouselid:"phonea72",
      },
    ]
  end

  def latest_mobile_deals_uk_new
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      bad_success_url: 'https://dl.reliatrk.com/?a=2&c=36&s1=exit',
      form_name: 'latest-mobile-deals-uk-new',
      optin_url: '/latest-mobile-deals-uk-new',
      sid: nil,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      ipaddress: request.remote_ip,
    }.to_json

    @samsungs21 = [
      {
        name: "Samsung Galaxy S21 5G",
        image: ["samsung/grey-galaxy-s21.png","samsung/orang-galaxy-s21.png","samsung/violet-galaxy-s21.png","samsung/white-galaxy-s21.png"],
        btn_text: "Get This Deal",
        color: ["#6e7074","#efc5be","#a5a8c4","#e9e9e7"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones212",
      },
    ]
    @samsungs21plus = [
      {
        name: "Samsung Galaxy S21 Plus",
        image: ["samsung/golden-galaxy-s21plus.png","samsung/black-galaxy-s21plus.png","samsung/violet-galaxy-s21.png","samsung/silver-galaxy-s21plus.png","samsung/red-galaxy-s21plus.png"],
        btn_text: "Get This Deal",
        color: ["#dcb5b3","#211e16","#a5a8c4","#c2c9d5","#cc333d"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21plus2",
      },
    ]
    @samsungs21ultra = [
      {
        name: "Samsung Galaxy S21 Ultra",
        image: ["samsung/silver-galaxy-s21-ultra.png","samsung/black-galaxy-s21-ultra.png","samsung/brown-galaxy-s21-ultra.png","samsung/titanium-galaxy-s21-ultra.png","samsung/navy-galaxy-s21-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#c2c9d5","#211e16","#5f4e4b","#6e7074","#3a414a"],
        memory: "128GB/256/512GB",
        ram:  "12GB",
        carouselid:"phones21ultra2",
      },
    ]
    @samsungzflip = [
      {
        name: "Samsung Galaxy Z Flip3",
        image: ["samsung/gold-galaxy-z-flip3.png","samsung/black-galaxy-z-flip3.png","samsung/green-galaxy-z-flip3.png","samsung/lavender-galaxy-z-flip3.png"],
        btn_text: "Get This Deal",
        color: ["#e3deca","#2d2926","#435551","#bfb1d2"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phonezflip3",
      },
    ]
    @samsungzfold = [
      {
        name: "Samsung Galaxy Z Fold3",
        image: ["samsung/silver-galaxy-z-fold3.png","samsung/black-galaxy-z-fold3.png","samsung/green-galaxy-z-fold3.png"],
        btn_text: "Get This Deal",
        color: ["#cac6c4","#2d2926","#384a46"],
        memory: "256/512GB",
        ram:  "12GB",
        carouselid:"phonezfold3",
      },
    ]
    @samsungnote20 = [
      {
        name: "Samsung Galaxy Note 20",
        image: ["samsung/green-galaxy-note20.png","samsung/bronze-galaxy-note20.png","samsung/grey-galaxy-note20.png"],
        btn_text: "Get This Deal",
        color: ["#91b098","#9a716e","#545859"],
        memory: "256GB",
        ram:  "8GB",
        carouselid:"phonenote20",
      },
    ]
    @samsungnote20ultra = [
      {
        name: "Samsung Galaxy Note 20 Ultra",
        image: ["samsung/bronze-galaxy-note20-ultra.png","samsung/black-galaxy-note20-ultra.png","samsung/white-galaxy-note20-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#9a716e","#1a1815","#dad9db"],
        memory: "256/512GB",
        ram:  "8GB",
        carouselid:"phonenote20ultra",
      },
    ]

    @phones = [
      {
        name: "Samsung Galaxy S21 Ultra",
        image: ["samsung/silver-galaxy-s21-ultra.png","samsung/black-galaxy-s21-ultra.png","samsung/brown-galaxy-s21-ultra.png","samsung/titanium-galaxy-s21-ultra.png","samsung/navy-galaxy-s21-ultra.png"],
        btn_text: "Get This Deal",
        color: ["#c2c9d5","#211e16","#5f4e4b","#6e7074","#3a414a"],
        memory: "128GB/256/512GB",
        ram:  "12GB",
        carouselid:"phones21ultra",
      },
      {
        name: "iPhone 13 Pro Max",
        image: ["iphone-13/iphone-13-pro-blue.png","iphone-13/iphone-13-pro-gold.png","iphone-13/iphone-13-pro-graphite.png","iphone-13/iphone-13-pro-silver.png"],
        btn_text: "Get This Deal",
        color: ["#C2DDFA","#FAE6CB","#777571","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13promax",
      },
      {
        name: "Samsung Galaxy S21 Plus",
        image: ["samsung/golden-galaxy-s21plus.png","samsung/black-galaxy-s21plus.png","samsung/violet-galaxy-s21.png","samsung/silver-galaxy-s21plus.png","samsung/red-galaxy-s21plus.png"],
        btn_text: "Get This Deal",
        color: ["#dcb5b3","#211e16","#a5a8c4","#c2c9d5","#cc333d"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21plus",
      },
      {
        name: "iPhone 13 Pro",
        image: ["iphone-13/iphone-13-pro-silver.png","iphone-13/iphone-13-pro-gold.png","iphone-13/iphone-13-pro-graphite.png","iphone-13/iphone-13-pro-blue.png"],
        btn_text: "Get This Deal",
        color: ["#F7F8F2","#FAE6CB","#777571","#C2DDFA"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13pro",
      },
      {
        name: "Samsung Galaxy S21 5G",
        image: ["samsung/grey-galaxy-s21.png","samsung/orang-galaxy-s21.png","samsung/violet-galaxy-s21.png","samsung/white-galaxy-s21.png"],
        btn_text: "Get This Deal",
        color: ["#6e7074","#efc5be","#a5a8c4","#e9e9e7"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phones21",
      },
      {
        name: "iPhone 13",
        image: ["iphone-13/iphone-13-blue.png","iphone-13/iphone-13-midnight.png","iphone-13/iphone-13-pink.png","iphone-13/iphone-13-product-red.png","iphone-13/iphone-13-starlight.png"],
        btn_text: "Get This Deal",
        color: ["#4F82A3","#21282F","#FDE0DB","#C01728","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13",
      },
      {
        name: "Samsung Galaxy Z Flip3",
        image: ["samsung/gold-galaxy-z-flip3.png","samsung/black-galaxy-z-flip3.png","samsung/green-galaxy-z-flip3.png","samsung/lavender-galaxy-z-flip3.png"],
        btn_text: "Get This Deal",
        color: ["#e3deca","#2d2926","#435551","#bfb1d2"],
        memory: "128/256GB",
        ram:  "8GB",
        carouselid:"phoneszflip3",
      },
      {
        name: "iPhone 13 Mini",
        image: ["iphone-13/iphone-13-pink.png","iphone-13/iphone-13-midnight.png","iphone-13/iphone-13-blue.png","iphone-13/iphone-13-product-red.png","iphone-13/iphone-13-starlight.png"],
        btn_text: "Get This Deal",
        color: ["#FDE0DB","#21282F","#4F82A3","#C01728","#F7F8F2"],
        memory: "128GB/256/512GB/1TB",
        ram:  "6GB",
        carouselid:"phonesiphone13mini",
      },
      {
        name: "Samsung Galaxy S20 FE",
        image: ["samsung/navy-galaxy-s20-fe.png","samsung/mint-galaxy-s20-fe.png","samsung/red-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#485167","#b6cfd0","#b73439","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20fe",
      },
      {
        name: "iPhone 12",
        image: ["iphone-12/iphone-12-blue.png","iphone-12/iphone-12-black.png","iphone-12/iphone-12-green.png","iphone-12/iphone-12-red.png","iphone-12/iphone-12-white.png","iphone-12/iphone-12-purple.png"],
        btn_text: "Get This Deal",
        color: ["#1E4971","#323036","#ECFFE7","#C01728","#FEFAF8","#CDC4FB"],
        memory: "64GB/128GB/256GB",
        ram:  "4GB",
        carouselid:"phonesiphone12",
      },
      {
        name: "Samsung Galaxy Z Fold3",
        image: ["samsung/silver-galaxy-z-fold3.png","samsung/black-galaxy-z-fold3.png","samsung/green-galaxy-z-fold3.png"],
        btn_text: "Get This Deal",
        color: ["#cac6c4","#2d2926","#384a46"],
        memory: "256/512GB",
        ram:  "12GB",
        carouselid:"phoneszfold3",
      },
      {
        name: "Samsung Galaxy M52",
        image: ["samsung/blue-galaxy-m52.png","samsung/black-galaxy-m52.png","samsung/white-galaxy-m52.png"],
        btn_text: "Get This Deal",
        color: ["#2d5eab","#000000","#ffffff"],
        memory: "128GB",
        ram:  "6/8GB",
        carouselid:"phonem52",
      },
      {
        name: "Samsung Galaxy A52s",
        image: ["samsung/lavender-galaxy-a52s.png","samsung/black-galaxy-a52s.png","samsung/white-galaxy-a52s.png","samsung/mint-galaxy-a52s.png"],
        btn_text: "Get This Deal",
        color: ["#b9b7d4","#494d35","#ecece5","#c7e9e3"],
        memory: "128GB",
        ram:  "8GB",
        carouselid:"phonea52s",
      },
      {
        name: "iPhone 12 Mini",
        image: ["iphone-12/iphone-12-purple.png","iphone-12/iphone-12-black.png","iphone-12/iphone-12-green.png","iphone-12/iphone-12-red.png","iphone-12/iphone-12-white.png","iphone-12/iphone-12-blue.png"],
        btn_text: "Get This Deal",
        color: ["#CDC4FB","#323036","#ECFFE7","#C01728","#FEFAF8","#1E4971"],
        memory: "64GB/128GB/256GB",
        ram:  "4GB",
        carouselid:"phonesiphone12mini",
      },
      {
        name: "Galaxy S20 FE (SM-G780G)",
        image: ["samsung/red-galaxy-s20-fe.png","samsung/navy-galaxy-s20-fe.png","samsung/mint-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#b73439","#485167","#b6cfd0","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20feg780g",
      },
      {
        name: "Samsung Galaxy A03s",
        image: ["samsung/blue-galaxy-a03s.png","samsung/black-galaxy-a03s.png"],
        btn_text: "Get This Deal",
        color: ["#204874","#000000"],
        memory: "32GB",
        ram:  "3GB",
        carouselid:"phonea03s",
      },
      {
        name: "Galaxy S20 FE (SM-G780F)",
        image: ["samsung/mint-galaxy-s20-fe.png","samsung/navy-galaxy-s20-fe.png","samsung/red-galaxy-s20-fe.png","samsung/lavender-galaxy-s20-fe.png","samsung/white-galaxy-s20-fe.png","samsung/orang-galaxy-s20-fe.png"],
        btn_text: "Get This Deal",
        color: ["#b6cfd0","#485167","#b73439","#d0acd0","#f0f0f1","#f3c29a"],
        memory: "128GB/256GB",
        ram:  "8GB",
        carouselid:"phones20feg780f",
      },
      {
        name: "Samsung Galaxy A72",
        image: ["samsung/violet-galaxy-a72.png","samsung/black-galaxy-a72.png","samsung/white-galaxy-a72.png","samsung/blue-galaxy-a72.png"],
        btn_text: "Get This Deal",
        color: ["#b9b7d4","#1f2018","#ecece5","#7ab7dc"],
        memory: "128GB",
        ram:  "8GB",
        carouselid:"phonea72",
      },
    ]
    
  end

  def get_deals_data url_name
    send(url_name.gsub('-', '_')) rescue home

    @phoneshome = [
      {
        name: "iPhone 13 Pro Max",
        data: "Unlimited",
        image: view_context.image_url("phone/apple-iphone-13-pro-max.png"),
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: "",
      },
      {
        name: "Samsung Galaxy Z Fold3 5G",
        data: "Unlimited",
        image: view_context.image_url("z-fold3.png"),
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: "",
      },
      {
        name: "iPhone 13",
        data: "Unlimited",
        image: view_context.image_url("phone/apple-iphone-13.png"),
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: "",
      },
      {
        name: "iPhone 13 Pro",
        data: "Unlimited",
        image: view_context.image_url("phone/apple-iphone-13-pro.png"),
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: "",
      },
      {
        name: "Samsung Galaxy Z Flip3 5G",
        data: "Unlimited",
        image: view_context.image_url("z-flip3.png"),
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: "",
      },
      {
        name: "iPhone 13 Mini",
        data: "Unlimited",
        image: view_context.image_url("phone/apple-iphone-13-mini.png"),
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: "",
      },
      {
        name: "iPhone 12",
        data: "Unlimited",
        image: "iphone_12_black.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Samsung Galaxy S21 Ultra 5G",
        data: "Unlimited",
        image: "samsung-galaxy-s21-ultra1.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "iPhone 12 Pro Max",
        data: "Unlimited",
        image: "iphone-12-pro.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Samsung Galaxy Note 20 Ultra 5G",
        data: "Unlimited",
        image: "phone/note-20-b.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Apple iPhone 11 Pro",
        data: "Unlimited",
        image: "phone/iphone11pro.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming, 5G Ready",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Samsung Galaxy S21",
        data: "Unlimited",
        image: "samsung-galaxy-s21.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming, 5G Ready",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Samsung A20",
        data: "Unlimited",
        image: "phone/samsung-a20.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming",
        deposit: "£0",
        handset: "Samsung A20"
      },
      {
        name: "Samsung Galaxy S20 5G",
        data: "Unlimited",
        image: "phone/galaxy-s20-5g.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "iPhone SE 128GB",
        data: "Unlimited",
        image: "phone/iphonese.jpg",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming",
        deposit: "£0",
        handset: "iPhone SE"
      },
      {
        name: "Samsung A10",
        data: "Unlimited",
        image: "phone/samsung-a10.jpg",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming",
        deposit: "£0",
        handset: "Samsung A10"
      },
      {
        name: "Huawei Y7",
        data: "Unlimited",
        image: "phone/huaweiy7.jpg",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming",
        deposit: "£0",
        handset: "Huawei Y7"
      },
      {
        name: "Samsung Galaxy S20 Ultra 5G",
        data: "Unlimited",
        image: "phone/samsung-galaxy-s20-ultra-black.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming, 5G Ready",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Huawei P30",
        data: "30GB",
        image: "phone/huaweip30.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "6 Months Half Price SIM!",
        data: "Unlimited",
        image: "sim/three-sim.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Best Sim Only Deals, 5G Ready",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Samsung Galaxy S20 Plus 5G",
        data: "4GB",
        image: "phone/samsung-galaxy-s20-plus.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming, 5G Ready",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Oneplus 8 Pro 5G",
        data: "Unlimited",
        image: "phone/oneplus8pro.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming, 5G Ready",
        deposit: "£0",
        handset: ""
      },
      {
        name: "iPhone 11 Pro Max",
        data: "Unlimited",
        image: "phone/1iphone-11-pro-max.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "iPhone 11",
        data: "Unlimited",
        image: "phone/iphone11.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "Samsung Galaxy S10e",
        data: "30GB",
        image: "phone/samsung-galaxy-s10e.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },

      {
        name: "iPhone XR",
        data: "Unlimited",
        image: "phone/iphonexr.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
      {
        name: "iPhone XS",
        data: "Unlimited",
        image: "phone/iphonexs.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0",
        handset: ""
      },
    ]
    partners_list
  end

  def social_page
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Switch-Mobile',
      optin_url: '/social',
      sid: nil,
      ssid: nil,
      source:'google-home-page',
      quick_submit: false,
      submit_on_load: false,
      uu_id: @cookie_uuid,
      token: @randon_token,
      ipaddress: request.remote_ip,
    }.to_json

    @testimonials = [
      {
        name: 'Jade',
        comment: 'So far so good. Everything is working the way it should. Would definitely recommend',
        date: 'Jan 21, 2021',
        image: 'coment1.png'
      },
      {
        name: 'Emma',
        comment: 'Great service, intuitive menues, great delivery time.',
        date: 'March 04, 2021',
        image: 'coment2.png'
      },
      {
        name: 'Amelia',
        comment: 'Fast delivery and good knowledge, wait for good discount promo codes and it gets delivered fast with tracking.',
        date: 'April 03, 2021',
        image: 'coment3.png'
      }
    ]

    partners_list
  end

  def partners_list
    @partners = [
      {
        class_id: "dukeleads-fzco",
        name: "Duke Leads - FZCO",
      },
      {
        class_id: "o2",
        name: "O2",
      },
      {
        class_id: "dukeleadsltd",
        name: "Duke Leads Ltd",
      },
      {
        class_id: "gogroopie",
        name: "Go Groopie",
      },
      {
        class_id: "discountexperts",
        name: "Discount Experts",
      },
      {
        class_id: "yescatalogue",
        name: "Yes Catalogue",
      },
      {
        class_id: "acceptedmobile",
        name: "Accepted Mobile",
      },
      {
        class_id: "flava",
        name: "Flava",
      },
      {
        class_id: "utilita",
        name: "Utilita",
      },
      {
        class_id: "hutchison3",
        name: "Hutchison 3",
      },
      {
        class_id: "123casino",
        name: "123 Casino",
      },
      {
        class_id: "go4discounts",
        name: "Go4Discounts"
      }
    ]
  end

  def data_share_domains
    ShareDomain.pluck(:url)
  end

end

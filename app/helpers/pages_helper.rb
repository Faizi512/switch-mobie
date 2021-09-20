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
        class_id: "o2",
        name: "O2",
      },
      {
        class_id: "ee-limited",
        name: "EE limited",
      },
      {
        class_id: "vodafone",
        name: "Vodafone",
      },
      {
        class_id: "mobile-deal",
        name: "Mobile Deal",
      },
      {
        class_id: "loanable",
        name: "Loanable",
      },
      {
        class_id: "voxi",
        name: "Voxi",
      },
      {
        class_id: "monetise-media",
        name: "Monetise Media",
      },
      {
        class_id: "bill-buddy",
        name: "Bill Buddy",
      },
      {
        class_id: "lead-365",
        name: "Lead 365",
      },
      {
        class_id: "scores-matter",
        name: "Scores Matter",
      },
      {
        class_id: "bill-switchers",
        name: "Bill Switchers",
      },
      {
        class_id: "sunshine-mobile",
        name: "Sunshine Mobile",
      },
      {
        class_id: "experian",
        name: "Experian",
      },
      {
        class_id: "flex-mobile",
        name: "Flex Mobile Limited",
      },
      {
        class_id: "flexible-group",
        name: "Flexible group limited",
      },
      {
        class_id: "go-groopie",
        name: "Go Groopie",
      },
      {
        class_id: "discount-experts",
        name: "Discount Experts",
      },
      {
        class_id: "breeze-mobile",
        name: "Breeze Mobile",
      },
      {
        class_id: "get-a-loan-today",
        name: "Get A Loan Today",
      },
      {
        class_id: "my-debt",
        name: "Help to clear my debt",
      },
      {
        class_id: "sky",
        name: "SKY",
      },
      {
        class_id: "yes-catalogue",
        name: "Yes Catalogue",
      },
      {
        class_id: "accepted-mobile",
        name: "Accepted Mobile",
      },
      {
        class_id: "flava",
        name: "Flava",
      },
      {
        class_id: "utilita-mobile",
        name: "Utilita Mobile",
      },
      {
        class_id: "utilita-broadband",
        name: "Utilita Broadband",
      },
      {
        class_id: "utilita-energy",
        name: "Utilita Energy",
      },
      {
        class_id: "btc--scale",
        name: "BtcScale",
      },
      {
        class_id: "your-news-daily",
        name: "Your News Daily",
      },
      {
        class_id: "hutcheson-3",
        name: "Hutcheson 3",
      }
    ]
  end

  def data_share_domains
    ShareDomain.pluck(:url)
  end

end

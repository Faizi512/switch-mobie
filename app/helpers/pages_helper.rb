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

  def compare_phones
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Compare-Phones',
      optin_url: '/compare-phones',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def new_mmd
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'MEGA-MOBILE-DEALS',
      optin_url: '/new-mmd',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: true,
      submit_on_load: false,
    }.to_json
  end

  def mmd_post
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'mmd-post',
      optin_url: '/mmd-post',
      sid: nil,
      ssid: nil,
      source:'',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def mmd_loans_2
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'mmd_loans_2',
      optin_url: '/mmd_loans_2',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: true,
      submit_on_load: false,
    }.to_json
  end

  def mmd_success
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'mmd-success',
      optin_url: '/mmd-success',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: false,
      submit_on_load: true,
    }.to_json
  end

  def returning_loans
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'returning-loans',
      optin_url: '/returning-loans',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def sims_returning
    @details = {
      camp_id: 'SIM',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Sims-Returning',
      optin_url: '/sims_returning',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: true,
      submit_on_load: false,
    }.to_json
  end


  def terms_and_conditions
    @details = {
      camp_id: '',
      success_url: '',
      form_name: '',
      optin_url: '',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def latest_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Latest-Deals',
      optin_url: '/latest-deals',
      sid: 2,
      ssid:16986,
      source:'Snapchat-16986-HR',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def returning
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'returning',
      optin_url: '/returning',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: true,
      submit_on_load: false,
    }.to_json
  end

  def sim_deals
    @details = {
      camp_id: 'SIM',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Sim-Deals',
      optin_url: '/sim-deals',
      sid: 1,
      ssid: 1,
      source:nil,
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def fb_phone_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'fb-phone-deals',
      optin_url: '/fb-phone-deals',
      sid: 157,
      ssid: 1,
      source:'taboola',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def social_phone_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'social-phone-deals',
      optin_url: '/social-phone-deals',
      sid: 157,
      ssid: 1,
      source:'Duke-FB',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def mega_phone_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'mega-phone-deals',
      optin_url: '/mega-phone-deals',
      sid: 15643,
      ssid: 1,
      source:'mega-HR',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def youtube
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://deals.megamobiledeals.com/youtube-success',
      form_name: 'youtube',
      optin_url: '/youtube',
      sid: nil,
      ssid: nil,
      source: nil,
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def youtube_success
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'youtube-success',
      optin_url: '/youtube-success',
      sid: nil,
      ssid: nil,
      source: nil,
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def step_form
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Mega-Mobile-Deals',
      optin_url: '',
      sid: nil,
      ssid: nil,
      source:'Google-amp',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

    def step_form_sim_deal_only
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Mega-Mobile-Deals',
      optin_url: '',
      sid: nil,
      ssid: nil,
      source:'three-sim-amp',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def sim_deal_only
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'sim-deal-only',
      optin_url: '/sim-deal-only',
      sid: nil,
      ssid: nil,
      source:'three-sim',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def exclusive_sim_deal
     @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'exclusive_sim_deal',
      optin_url: '/exclusive-sim-deal',
      sid: nil,
      ssid: nil,
      source:'three-sim',
      quick_submit: false,
      submit_on_load: true,
    }.to_json
  end

  def exclusive_top_deals
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'exclusive-top-deals',
      optin_url: '/exclusive-top-deals',
      sid: nil,
      ssid: nil,
      source:nil,
      quick_submit: false,
      submit_on_load: true,
    }.to_json
  end

  def home
    @details = {
      camp_id: 'MEGA-MOBILE-DEALS',
      success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      bad_success_url: 'https://mtrk5.co.uk/?a=14118&c=33110',
      form_name: 'Mega-Mobile-Deals',
      optin_url: '',
      sid: nil,
      ssid: nil,
      source:'google-home-page',
      quick_submit: false,
      submit_on_load: false,
    }.to_json
  end

  def get_deals_data url_name
    send(url_name.gsub('-', '_')) rescue home
    @phones = [
     {
        name: "iPhone 11 Pro 256 GB",
        data: "Unlimited",
        image: "phone/iphone11pro.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
     {
        name: "iPhone 11 256 GB",
        data: "Unlimited",
        image: "phone/iphone11.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "Samsung Galaxy Fold 5G 256 GB",
        data: "Unlimited",
        image: "phone/samsung-galaxy-fold.jpg",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "iPhone XR",
        data: "Unlimited",
        image: "phone/iphonexr.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "iPhone X 256 GB",
        data: "Unlimited",
        image: "phone/x.jpg",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "Samsung S10+ 256 GB",
        data: "Unlimited",
        image: "phone/samsungs10plus.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "Samsung S9 256 GB",
        data: "Unlimited",
        image: "phone/samsungs9.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "Samsung S10 256 GB",
        data: "Unlimited",
        image: "phone/samsungs10.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "iPhone 8",
        data: "Unlimited",
        image: "phone/iphone8.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "Samsung Note 10 128GB",
        data: "Unlimited",
        image: "phone/samsungnote10.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      },
      {
        name: "Huawei P30 Pro",
        data: "Unlimited",
        image: "phone/huaweip30.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0"
      }
    ]

    @phoneshome = [
     {
        name: "6 Months Half Price SIM!",
        data: "Unlimited",
        image: "sim/three-sim.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Best Sim Only Deals, 5G Ready",
        deposit: "£0"
      },
     {
        name: "Samsung Galaxy S10",
        data: "Unlimited",
        image: "phone/samsungs10.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      },
      {
        name: "Huawei P30",
        data: "30GB",
        image: "phone/huaweip30.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      },
      {
        name: "Apple iPhone 11 Pro",
        data: "Unlimited",
        image: "phone/iphone11pro.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "",
        deposit: "£0"
      },
      {
        name: "iPhone 11",
        data: "Unlimited",
        image: "phone/iphone11.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      },
      {
        name: "iPhone 11",
        data: "Unlimited",
        image: "phone/iphone11-2.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Free Personal Hotspot, Free Data Roaming",
        deposit: "£0"
      },
      {
        name: "Samsung Galaxy S20 Ultra 5G",
        data: "Unlimited",
        image: "phone/samsung-galaxy-s20-ultra-black.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming, 5G Ready",
        deposit: "£0"
      },
      {
        name: "Samsung Galaxy S20 Plus 5G",
        data: "4GB",
        image: "phone/samsung-galaxy-s20-plus.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Data Roaming, 5G Ready",
        deposit: "£0"
      },
      {
        name: "Samsung Galaxy S10e",
        data: "30GB",
        image: "phone/samsung-galaxy-s10e.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      },
      {
        name: "iPhone XR",
        data: "Unlimited",
        image: "phone/iphonexr.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      },
      {
        name: "iPhone XS",
        data: "Unlimited",
        image: "phone/iphonexs.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      },
      {
        name: "iPhone 11 Pro Max",
        data: "Unlimited",
        image: "phone/1iphone-11-pro-max.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      },
      {
        name: "Samsung Galaxy S10",
        data: "Unlimited",
        image: "phone/samsungs10.png",
        calls: "Unlimited",
        texts: "Unlimited",
        url:"/success",
        bluetext: "Personal Hotspot, Go Binge, Data Roaming",
        deposit: "£0"
      }
    ]

    @phonescompare = [
     {
        name: "iPhone 11 Pro 256 GB",
        data: "Unlimited",
        image: "phone/iphone11pro.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
     {
        name: "iPhone 11 256 GB",
        data: "Unlimited",
        image: "phone/iphone11.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "Samsung Galaxy Fold 5G 256 GB",
        data: "Unlimited",
        image: "phone/samsung-galaxy-fold.jpg",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "iPhone XR",
        data: "Unlimited",
        image: "phone/iphonexr.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "iPhone X 256 GB",
        data: "Unlimited",
        image: "phone/x.jpg",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "Samsung S10+ 256 GB",
        data: "Unlimited",
        image: "phone/samsungs10plus.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "Samsung S9 256 GB",
        data: "Unlimited",
        image: "phone/samsungs9.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "Samsung S10 256 GB",
        data: "Unlimited",
        image: "phone/samsungs10.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "iPhone 8",
        data: "Unlimited",
        image: "phone/iphone8.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "Samsung Note 10 128GB",
        data: "Unlimited",
        image: "phone/samsungnote10.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      },
      {
        name: "Huawei P30 Pro",
        data: "Unlimited",
        image: "phone/huaweip30.png",
        calls: "Unlimited",
        texts: "Unlimited",
        deposit: "£0",
        bigdic: "Big Discount!"
      }
    ]
    @sims = [
     {
        name: "Tesco Sim Card",
        data: "15 GB",
        image: "sim/tesco-sim-card.png",
        calls: "Unlimited",
        texts: "Unlimited",
        permonth: "£10",
        contlength: "3 Month"

      },
     {
        name: "O2 Sim Card",
        data: "Unlimited",
        image: "sim/O2-sim-card.png",
        calls: "Unlimited",
        texts: "Unlimited",
        permonth: "£50",
        contlength: "12 Month"

      },
      {
        name: "Vodafone Sim Card",
        data: "50 GB",
        image: "sim/voda-sim-card.png",
        calls: "Unlimited",
        texts: "Unlimited",
        permonth: "£10",
        contlength: "18 Month"

      },
      {
        name: "3 Sim Card",
        data: "4 GB",
        image: "sim/three-sim.png",
        calls: "Unlimited",
        texts: "Unlimited",
        permonth: "£5",
        contlength: "6 Month"

      },
      {
        name: "ID Sim Card",
        data: "5 GB",
        image: "sim/id-sim-card.png",
        calls: "Unlimited",
        texts: "Unlimited",
        permonth: "£7",
        contlength: "1 Month"

      },
      {
        name: "EE Sim Card",
        data: "20 GB",
        image: "sim/ee-sim-card.png",
        calls: "Unlimited",
        texts: "Unlimited",
        permonth: "£6",
        contlength: "12 Month"

      }
    ]
  end
end

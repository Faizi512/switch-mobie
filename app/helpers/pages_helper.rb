module PagesHelper

  def get_deals_data
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

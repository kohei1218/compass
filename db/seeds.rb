Admin.create(email: "admin@example.com", password: "adminadmin", password_confirmation: "adminadmin")
Company.create(admin: true, description: "サンプル会社です。", name: "サンプル会社", establishment_date: "2012年 12月", representative: "巻巻男", employees: 20, capital: 200, business: "貝殻販売", url: "http:www.yahoo.co.jp")

FactoryGirl.create_list(:recruit, 10)

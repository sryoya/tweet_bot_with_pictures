require "slack"
namespace :slack_hirumeshi do
  desc "slack_otukare_post_with_beatiful_girl"
  task :hirumeshi_post => :environment do
    if Date.today.weekday?
      hirumeshi_post
    end
  end
end


def hirumeshi_post
  Slack.configure do |config|
    config.token = 'xoxp-50277412097-50280344055-51734994083-06fc19cbbf'
  end
  hirumeshis = ['http://sushi-no-suke.com/wp/wp-content/themes/sushi/img/kobore_uni.jpg', 'http://uds.gnst.jp/rest/img/stb5my9d0000/s_005y.jpg', 'http://thumbnail.image.rakuten.co.jp/@0_mall/auc-sschicken/cabinet/commodity/kimo01.jpg', 'http://xn--ng-r62c164bp5ax90w.com/img/rever2.jpg', 'http://previews.123rf.com/images/lewzstock/lewzstock1309/lewzstock130900035/23075161-Ikura-sushi-ikura-with-seaweed-Nori-japanese-cuisine-Stock-Photo.jpg','http://kankinou.net/check/images/img_ijou.jpg',"http://www.danshihack.com/wp-content/uploads/2015/03/b472afdf4bedd81dc770349f8c6fef7e.jpg", "http://www.jalan.net/jalan/images/pictLL/Y8/L302188/L3021880000467216.jpg"]
  #'http://kankinou.net/check/images/img_ijou.jpg' ←肝臓
  photo = hirumeshis.sample

  Slack.chat_postMessage(text: "お昼の時間だよー\n#{photo}", username: "昼飯", channel: '#general')
end
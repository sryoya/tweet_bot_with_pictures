require "slack"
namespace :slack_otukare do
  desc "slack_otukare_post_with_beatiful_girl"
  task :slack_otukare_post => :environment do
     if Date.today.weekday?
      otukare_post
     end
  end
end


def otukare_post
  Slack.configure do |config|
    config.token = 'xoxp-50277412097-50280344055-51734994083-06fc19cbbf'
  end
  actress_photos = []
  # 石原さとみ
  actress_photo = ["https://ssl-stat.amebame.com/pub/content/8265872137/user/article/unknown/unknown/267118395150457761/9778338fe5efb738960e8baeb0e4fe1e/cached.jpg","http://img.gifmagazine.net/gifmagazine/images/17637/original.gif?1409067553", 'https://i.ytimg.com/vi/IRSk9iwUxhA/maxresdefault.jpg']
  actress_photos << actress_photo
  #有村架純
  actress_photo = ["http://media.image.infoseek.co.jp/isnews/photos/thetv/thetv_71523_0.jpg", "http://xn--xgst18m.xyz/wp-content/uploads/2016/01/kasumi-arimura-kabegami6-1024x640.jpg"]
  actress_photos << actress_photo
  #堀北真希
  actress_photo = ["http://img.gifmagazine.net/gifmagazine/images/138984/original.gif?1429780061", "http://img.gifmagazine.net/gifmagazine/images/19585/original.gif?1409661101"]
  actress_photos << actress_photo
  #新垣結衣
  actress_photo = ["http://blogs.c.yimg.jp/res/blog-b6-40/heavenly_days922/folder/1817257/18/66969518/img_2?1419869171",'http://geinoujinmeiku.com/wp-content/uploads/2015/06/12798_original.png']
  actress_photos << actress_photo
  #橋本環奈
  actress_photo = ["http://xn--o9j0bk5305b8cxd.jp/wp-content/uploads/2014/07/bandicam-2014-07-10-20-23-18-369.jpg"]
  actress_photos << actress_photo
  #ジニー・ロメッティ
  actress_photo = ["http://fe-biz.bcnranking.jp/sys_imgs/article/20150213ibm2.jpg"]
  actress_photos << actress_photo
  #佐々木希
  actress_photo = ["http://topics.beauvo.net/file/parts/Iac4ec56/a8a12b3f151cec6fbb5c8f25f9282e12.jpg", "http://shinbishika-guide.com/wp-content/uploads/2014/12/sasaki-nozomi-08.jpg"]
  actress_photos << actress_photo


  actresses = ["石原さとみ","有村架純", "堀北真希","新垣結衣", "橋本環奈", "ジニー・ロメッティ", "佐々木希"]
  actress_num = rand(7)
  actress_name = actresses[actress_num]
  actress_photo = actress_photos[actress_num]
  actress_photo = actress_photo.sample

  Slack.chat_postMessage(text: "みんな今日も一日おつかれさま♡\n#{actress_photo}", username: actress_name, channel: '#general')
end
//
//  OneListModel.h
//  One
//
//  Created by hanyutong on 2017/7/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OneShareLink : NSObject

@property (nonatomic, copy) NSString * imgUrl;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * audio;
@property (nonatomic, copy) NSString * desc;
@property (nonatomic, copy) NSString * link;

@end


@interface OneShareList : NSObject

@property (nonatomic, strong) OneShareLink * qq;
@property (nonatomic, strong) OneShareLink * wx;
@property (nonatomic, strong) OneShareLink * wx_timeline;
@property (nonatomic, strong) OneShareLink * weibo;

@end

@interface OneShareInfo : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * image;

@end

@interface OneAuthor : NSObject

@property (nonatomic, copy) NSString * summary;
@property (nonatomic, copy) NSString * fans_total;
@property (nonatomic, copy) NSString * wb_name;
@property (nonatomic, copy) NSString * web_url;
@property (nonatomic, copy) NSString * user_id;
@property (nonatomic, copy) NSString * user_name;
@property (nonatomic, copy) NSString * settled_type;
@property (nonatomic, copy) NSString * desc;
@property (nonatomic, copy) NSString * is_settled;

@end

@interface OneTagList : NSObject
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * title;

@end



@interface OneContentList : NSObject

@property (nonatomic, copy) NSString * pic_info;
@property (nonatomic, strong) OneAuthor * author;
@property (nonatomic, copy) NSString * movie_story_id;
@property (nonatomic, copy) NSString * contentId;
@property (nonatomic, copy) NSString * forward;
@property (nonatomic, copy) NSString * category;
@property (nonatomic, copy) NSString * post_date;
@property (nonatomic, copy) NSString * serial_list;
@property (nonatomic, copy) NSString * ad_makettime;
@property (nonatomic, copy) NSString * ad_share_cnt;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, copy) NSString * content_type;
@property (nonatomic, copy) NSString * item_id;
@property (nonatomic, copy) NSString * ad_closetime;
@property (nonatomic, copy) NSString * serial_id;
@property (nonatomic, copy) NSString * last_update_date;
@property (nonatomic, copy) NSString * like_count;
@property (nonatomic, strong) NSArray* tag_list;
@property (nonatomic, copy) NSString * number;
@property (nonatomic, strong) OneShareList * share_list;
@property (nonatomic, copy) NSString * start_video;
@property (nonatomic, copy) NSString * volume;
@property (nonatomic, copy) NSString * ad_linkurl;
@property (nonatomic, copy) NSString * ad_pvurl_vendor;
@property (nonatomic, copy) NSString * content_id;
@property (nonatomic, copy) NSString * ad_type;
@property (nonatomic, copy) NSString * words_info;
@property (nonatomic, copy) NSString * display_category;
@property (nonatomic, copy) NSString * ad_id;
@property (nonatomic, copy) NSString * video_url;
@property (nonatomic, copy) NSString * img_url;
@property (nonatomic, assign) NSInteger img_Height;
@property (nonatomic, copy) NSString * music_name;
@property (nonatomic, copy) NSString * audio_author;
@property (nonatomic, copy) NSString * audio_album;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * bg_color;

@property (nonatomic, copy) NSString * share_url;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * ad_pvurl;
@property (nonatomic, copy) NSString * audio_url;
@property (nonatomic, copy) NSString * audio_platform;
@property (nonatomic, copy) NSString * content_bgcolor;
@property (nonatomic, strong) OneShareInfo * share_info;



@end

@interface OneWeather : NSObject

@property (nonatomic, copy) NSString * icons;
@property (nonatomic, copy) NSString * humidity;
@property (nonatomic, copy) NSString * hurricane;
@property (nonatomic, copy) NSString * date;
@property (nonatomic, copy) NSString * temperature;
@property (nonatomic, copy) NSString * wind_direction;
@property (nonatomic, copy) NSString * city_name;
@property (nonatomic, copy) NSString * climate;


@end

@interface OneListModel : NSObject

@property (nonatomic, copy) NSString * date;
@property (nonatomic, copy) NSString * listId;
@property (nonatomic, strong) NSArray<OneContentList *> * content_list;
@property (nonatomic, strong) OneWeather * weather;

@end

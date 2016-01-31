//
//  DetailModel.h
//  喜游迹
//
//  Created by mac on 16/1/3.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface DetailModel : BaseModel

/*
 {
	"error_code": 0,
	"data": {
 "id": "51",
 "from": "2",
 "origi_url": "",
 "origi_site": "",
 "title": "\u58a8\u8131\u8131\u5149---\u7a7f\u8d8a\u4e2d\u56fd\u6700\u9876\u7ea7\u7684\u6237\u5916\u8def\u7ebf\uff0c\u63a2\u5bfb\u7075\u9b42\u6df1\u5904\u7684\u7ec8\u6781\u6e34\u671b",
 "user_id": "0",
 "start_country_id": "1",
 "start_province_id": "2",
 "start_city_id": "6913",
 "dest_country_id": "1",
 "dest_province_id": "2730",
 "dest_city_id": "2731",
 "tag_logo": "",
 "face": "http:\/\/static.e-traveltech.com\/image\/ab\/4e\/ab4e3ba000ffc9c6c499442c296ecf6f.jpg",
 "spots": "\u6797\u829d\uff0c\u58a8\u8131",
 "offset_fund": "0",
 "days_number": "8",
 "images": "",
 "visa": "\u65e0\u987b\u7b7e\u8bc1",
 "feature": "//描述",
 "reserve_notice": [{
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }],
 "user_count": "0",
 "cost": "//描述",
 "recommend": "",
 "tip": "\u6ce8\u610f\u51fa\u884c\u5b89\u5168",
 "relative": null,
 "unit": "\u4eba\u6570",
 "index": "43",
 "type_id": "0",
 "status": "1",
 "start_place_name": "\u5317\u4eac",
 "detail_url": "http:\/\/m.e-traveltech.com\/activity\/index\/details?target_id=51",
 "routes": [{
 "id": "141",
 "trip_id": "51",
 "index": "1",
 "start_place": "\u5168\u56fd\u5404\u5730",
 "destination": "\u62c9\u8428",
 "eat_explain": "\u65e0",
 "room_explain": "\u65e0",
 "route_explain": [{
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }],
 "status": "0",
 "index_day": "\u7b2c\u4e00\u5929"
 }, {
 "id": "142",
 "trip_id": "51",
 "index": "2",
 "start_place": "\u62c9\u8428",
 "destination": "\u516b\u4e00\u9547",
 "eat_explain": "\u62c9\u8428\u65e9\u9910\u3001\u8def\u9014\u5348\u9910 \u3001\u516b\u4e00\u9547\u665a\u9910",
 "room_explain": "\u516b\u4e00\u9547\uff08\u6807\u95f4\uff09",
 "route_explain": [{
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//描述",
 "file": "",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/75\/4f\/754fccbb4c1e8460e67bedfac01b67b2.jpg",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/4e\/f9\/4ef9fde8da64be8f2808c417f06a8dab.jpg",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/73\/97\/73972cdddfa04cc9dbf95fc2f8453842.jpg",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/c6\/44\/c644bf819f6e964a532cd9ba88472a05.jpg",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "\u8f66\u7a0b\uff1a\u884c\u7a0b\u8ddd\u79bb\u7ea6470KM<br\/>\n\u4f4f\u5bbf\uff1a\u516b\u4e00\u9547\uff08\u6807\u95f4\uff09<br\/>\n\u9910\u996e\uff1a\u62c9\u8428\u65e9\u9910\u3001\u8def\u9014\u5348\u9910 \u3001\u516b\u4e00\u9547\u665a\u9910\n<br\/>\n\u5907\u6ce8\uff1a\u53d7\u8def\u51b5\u548c\u5929\u6c14\u5f71\u54cd\uff0c\u672c\u65e5\u65e9\u9910\u53ef\u80fd\u4e3a\u6253\u5305\u65e9\u9910\u3002",
 "file": "",
 "face": ""
 }],
 "status": "0",
 "index_day": "\u7b2c\u4e8c\u5929"
 }, {
 "id": "143",
 "trip_id": "51",
 "index": "3",
 "start_place": "\u516b\u4e00\u9547",
 "destination": "\u58a8\u8131",
 "eat_explain": "\u516b\u4e00\u9547\u65e9\u9910\u3001\u6ce2\u5bc6\u5348\u9910 \u3001\u58a8\u8131\u665a\u9910",
 "room_explain": "\u58a8\u8131\uff08\u6807\u95f4\uff09",
 "route_explain": [{
 "type": "0",
 "sub_type": "2",
 "content": "\u65e9\u6668\u9a71\u8f66\u524d\u5f80\u58a8\u8131\uff0c\u6cbf\u5c71\u8def\u800c\u4e0a\u7ffb\u8d8a\u6d77\u62d44702\u7c73\u7684\u8272\u5b63\u62c9\u5c71\uff0c\u5728\u5c71\u9876\uff0c\u9065\u671b\u4e2d\u56fd\u6700\u7f8e\u5341\u5927\u540d\u5c71\u4e4b\u51a0\u7684\u5357\u8fe6\u5df4\u74e6\u5cf0\u5982\u745e\u58eb\u7684\u963f\u5c14\u5351\u65af\u5c71\uff1b\u8fc7\u5947\u5999\u7684\u8272\u5b63\u62c9\u5c71\uff084768\u7c73\uff09\uff0c\u53ef\u89c1\u8584\u53bb\u6de1\u96fe\uff0c\u660e\u4e3d\u6de1\u96c5\u7684\u96ea\u5c71\u3001\u7eff\u6811\u3001\u697c\u5b85\uff0c\u62b5\u6797\u829d\u7684\u516b\u4e00\u9547\u3002",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//汉字",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//汉字",
 "file": "",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/4e\/b4\/4eb4dacfdb53e1f38ae2f579443d69c3.jpg",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/40\/ad\/40adfbc6748ff532cae0035b4df1a120.jpg",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "//汉字",
 "file": "",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "汉字",
 "file": "",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/23\/95\/23951b5ed381d70d0a581f385ea6c56f.jpg",
 "face": ""
 }, {
 "type": "1",
 "sub_type": "0",
 "content": "image",
 "file": "http:\/\/static.e-traveltech.com\/image\/38\/9e\/389e094d5accdd2ee8623657da4c861a.jpeg",
 "face": ""
 }, {
 "type": "0",
 "sub_type": "2",
 "content": "\u8f66\u7a0b\uff1a\u884c\u7a0b\u8ddd\u79bb\u7ea6350KM<br\/>\n\u4f4f\u5bbf\uff1a\u58a8\u8131\uff08\u6807\u95f4\uff09<br\/>\n\u9910\u996e\uff1a\u516b\u4e00\u9547\u65e9\u9910\u3001\u6ce2\u5bc6\u5348\u9910 \u3001\u58a8\u8131\u665a\u9910<br\/>\n\u5907\u6ce8\uff1a\u53d7\u8def\u51b5\u548c\u5929\u6c14\u5f71\u54cd\uff0c\u672c\u65e5\u65e9\u9910\u53ef\u80fd\u4e3a\u6253\u5305\u65e9\u9910\u3002\n",
 "file": "",
 "face": ""
 }],
 "status": "0",
 "index_day": "\u7b2c\u516b\u5929"
 }],
 "periods": [{
 "id": "72",
 "trip_id": "51",
 "begin_time": "2016\u5e742\u670810\u65e5",
 "end_time": "1455724792",
 "adult_price": "7800",
 "child_price": "7800",
 "oasia_hotel": 0,
 "preferential": 0,
 "offset_fund": 0,
 "user_count": "0",
 "already_user_count": "0",
 "confirm_user_count": "0",
 "plus_confirm_user_count": "0",
 "gather_address": "",
 "gather_time": "0",
 "start_time": "0",
 "deadline": "2016-02-09 18:00",
 "has_lucky_draw": "1",
 "lucky_draw_stime": "2016-02-10 07:30",
 "lucky_draw_etime": "2016-02-10 10:30",
 "has_bonus": "1",
 "bonus_money": "0",
 "push_hint": "",
 "status": "0",
 "original_begin_time": "1455033600",
 "period_begin_time": "2016\/2\/10",
 "period_begin_date": "2016\u5e7402\u670810\u65e5",
 "period_begin_year": "2016",
 "period_begin_month": "2",
 "show_time": "2016.02.10",
 "show_date": "02.10",
 "show_week_time": "\u661f\u671f\u4e09",
 "show_end_time": "2016.02.17"
 }],
 "period_count": 1,
 "min_price": "7800.00",
 "user_travel_fund": "0"
	},
	"error_msg": "Ok!"
 }
 
 */

//头视图信息
@property (nonatomic,copy)NSString *title;//视图大标题信息
@property(nonatomic,copy)NSString *face;//头视图图片
@property (nonatomic,copy)NSString *start_place_name;//出发地点

//活动日历

//免费抽大奖

//线路特色
@property (nonatomic,copy)NSString *feature;//线路特色
//行程介绍
@property (nonatomic,strong)NSArray *routes;//行程介绍
//签证信息
@property (nonatomic,copy)NSString *visa;//签证信息
//费用说明
@property (nonatomic,copy)NSString *cost;//费用说明
//预定须知
@property (nonatomic,strong)NSArray *reserve_notice;//预定须知


@property (nonatomic,copy)NSString *idcount;//标示唯一的id号


@property(nonatomic,copy)NSString *min_price;

@property (nonatomic,copy)NSString *spots;


@property (nonatomic,copy)NSString *tip;

@property (nonatomic,copy)NSString *unit;

@property (nonatomic,copy)NSString *room_explain;

@property (nonatomic,strong)NSArray *route_explain;//字典中的数组

@property (nonatomic,copy)NSString *destination;

@property (nonatomic,copy)NSString *eat_explain;

@property (nonatomic,copy)NSString *status;//状态返回码

@property(nonatomic,copy)NSString *index_day;

@property (nonatomic,copy)NSString *index;

@property (nonatomic,copy)NSString *type_id;


@property (nonatomic,copy)NSString *days_number;

@end
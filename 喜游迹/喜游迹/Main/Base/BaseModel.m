//
//  BaseModel.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

#pragma mark - 获取set方法
- (SEL)getSetterSelWithAttibuteName:(NSString*)attributeName{
    NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
    NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:", capital,
                              [attributeName substringFromIndex:1]];
    return NSSelectorFromString(setterSelStr);
}

#pragma mark 初始化方法
- (id)initWithDataDic:(NSDictionary*)dataDic{
    self = [super init];
    if (self) {
        [self setAttributes:dataDic];
    }
    return  self;
}

#pragma mark 设置映射字典
- (NSDictionary*)attributeMapDictionary{
    //  设置用语子类化的映射属性
    return  nil;
}

#pragma mark 匹配数据
- (void)setAttributes:(NSDictionary*)dataDic{
    NSDictionary *attrMapDic = [self attributeMapDictionary];
    //  当没有映射字典的时候, 则直接用字段名作为属性名
    if (attrMapDic == nil) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[dataDic count]];
        for (NSString *key in dataDic) {
            [dic setValue:key forKey:key];
            attrMapDic = dic;
        }
    }
    
    NSArray *attrbuteNameArray = [attrMapDic allKeys];
    for (NSString *attributeName in attrbuteNameArray) {
        //  通过属性名获得set方法
        SEL sel = [self getSetterSelWithAttibuteName:attributeName];
        if ([self respondsToSelector:sel]) {
            //  得到数据字典中的字段关键字
            NSString *dataDicKey = [attrMapDic objectForKey:attributeName];
            
            //  得到数据字典中的值
            id attributeValue = [dataDic objectForKey:dataDicKey];
            
            //  调用set方法 为属性赋值(此处采用宏消除警告)
            SuppressPerformSelectorLeakWarning(
                                               [self performSelector:sel withObject:attributeValue]
                                               );
        }
    }
}

@end

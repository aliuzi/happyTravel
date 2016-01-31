//
//  BaseModel.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

#pragma mark - GETTING_ATTRIBUTE_NAME
- (SEL)getSetterSelWithAttibuteName:(NSString*)attributeName{
    NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
    NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:", capital,
                              [attributeName substringFromIndex:1]];
    return NSSelectorFromString(setterSelStr);
}

#pragma mark INITIALIZATION_METHODS
- (id)initWithDataDic:(NSDictionary*)dataDic{
    self = [super init];
    if (self) {
        [self setAttributes:dataDic];
    }
    return  self;
}

#pragma mark MAPPING_DICTIONARY
- (NSDictionary*)attributeMapDictionary{
    //  Set its mapping attribute for subclass using.
    return  nil;
}

#pragma mark MATCHING_DATA
- (void)setAttributes:(NSDictionary*)dataDic{
    NSDictionary *attrMapDic = [self attributeMapDictionary];
    
    /*  If there is no mapping dictionary, using the string name for
     property name instead.
     */
    if (attrMapDic == nil) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[dataDic count]];
        for (NSString *key in dataDic) {
            [dic setValue:key forKey:key];
            attrMapDic = dic;
        }
    }
    
    NSArray *attrbuteNameArray = [attrMapDic allKeys];
    for (NSString *attributeName in attrbuteNameArray) {
        //Get 'set' method through property name.
        SEL sel = [self getSetterSelWithAttibuteName:attributeName];
        if ([self respondsToSelector:sel]) {
            //Get the key string from the dictionary.
            NSString *dataDicKey = [attrMapDic objectForKey:attributeName];
            
            //Get the value through the key.
            id attributeValue = [dataDic objectForKey:dataDicKey];
            
            //Assign the value for property.
            [self performSelector:sel withObject:attributeValue];
        }
    }
}

@end

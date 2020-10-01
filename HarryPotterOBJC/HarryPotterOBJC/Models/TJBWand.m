//
//  TJBWand.m
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

#import "TJBWand.h"

@implementation TJBWand

- (instancetype)initWithWood:(NSString *)wood core:(NSString *)core
{
    self = [super init];
    
    if (self)
    {
        _wood = wood;
        _core = core;
    }
    return self;
}

@end

@implementation TJBWand (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *wood = dictionary[@"wood"];
    NSString *core = dictionary[@"core"];
    
    return [[TJBWand alloc] initWithWood:wood core:core];
}

@end

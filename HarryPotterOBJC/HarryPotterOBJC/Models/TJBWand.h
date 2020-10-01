//
//  TJBWand.h
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJBWand : NSObject

@property (nonatomic, copy, readonly) NSString * wood;
@property (nonatomic, copy, readonly) NSString * core;

-(instancetype)initWithWood:(NSString *)wood
                       core:(NSString *)core;

@end

@interface TJBWand (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END

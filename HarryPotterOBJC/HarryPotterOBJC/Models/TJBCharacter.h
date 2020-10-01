//
//  TJBCharacter.h
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

#import <Foundation/Foundation.h>
#import "TJBWand.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJBCharacter : NSObject

@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSString * species;
@property (nonatomic, copy, readonly) NSString * gender;
@property (nonatomic, copy, readonly) NSString * house;
@property (nonatomic, copy, readonly) NSString * dateOfBirth;
@property (nonatomic, copy, readonly) NSString * ancestry;
@property (nonatomic, copy, readonly) NSString * eyeColor;
@property (nonatomic, copy, readonly) NSString * hairColor;
@property (nonatomic, copy, readonly) NSString * image;
@property (nonatomic, copy, readonly) TJBWand * wand;

- (instancetype)initWithName:(NSString *)name
                     species:(NSString *)species
                      gender:(NSString *)gender
                       house:(NSString *) house
                 dateOfBirth:(NSString *)dateOfBirth
                    ancestry:(NSString *)ancestry
                    eyeColor:(NSString *)eyeColor
                   hairColor:(NSString *)hairColor
                       image:(NSString *)image
                        wand:(TJBWand *)wand;

@end

@interface TJBCharacter (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END

//
//  TJBCharacter.m
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

#import "TJBCharacter.h"
#import "TJBWand.h"

@implementation TJBCharacter

- (instancetype)initWithName:(NSString *)name species:(NSString *)species gender:(NSString *)gender house:(NSString *)house dateOfBirth:(NSString *)dateOfBirth ancestry:(NSString *)ancestry eyeColor:(NSString *)eyeColor hairColor:(NSString *)hairColor image:(NSString *)image wand:(TJBWand *)wand
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _species = species;
        _gender = gender;
        _house = house;
        _dateOfBirth = dateOfBirth;
        _ancestry = ancestry;
        _eyeColor = eyeColor;
        _hairColor = hairColor;
        _image = image;
    }
    return self;
}

@end

@implementation TJBCharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    
//    NSArray *characterArray = array
//    TJBCharacter *character = [TJBCharacter alloc] initWithArray:
    NSString *name = dictionary[@"name"];
    NSString *species =dictionary[@"species"];
    NSString *gender =dictionary[@"gender"];
    NSString *house =dictionary[@"house"];
    NSString *dateOfBirth =dictionary[@"dateOfBirth"];
    NSString *ancestry =dictionary[@"ancestry"];
    NSString *eyeColor =dictionary[@"eyeColour"];
    NSString *hairColor =dictionary[@"hairColour"];
    NSString *image =dictionary[@"image"];
    
    NSDictionary *wandDictionary = dictionary[@"wand"];
    
    TJBWand *wand = [[TJBWand alloc] initWithDictionary:wandDictionary];

    return [self initWithName:name species:species gender:gender house:house dateOfBirth:dateOfBirth ancestry:ancestry eyeColor:eyeColor hairColor:hairColor image:image wand:wand];
}

@end

//
//  TJBCharacterController.m
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

#import "TJBCharacterController.h"
#import "TJBCharacter.h"

static NSString * const baseURLString = @"https://hp-api.herokuapp.com";
static NSString * const apiEndpointString = @"api";
static NSString * const charactersEndpointString = @"characters";

@implementation TJBCharacterController

+ (void)fetchCharacterWithCompletion:(void(^) (NSArray<TJBCharacter *> *))completion
{
    NSURL *bseUrl = [NSURL URLWithString:baseURLString];
    NSURL *apiURL = [bseUrl URLByAppendingPathComponent:apiEndpointString];
    NSURL *finalURL = [apiURL URLByAppendingPathComponent:charactersEndpointString];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        if (error)
        {
            NSLog(@"There was an error %@, %@", error, error.localizedDescription);
            return completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil);
        }
        
        NSArray *topLevelArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSMutableArray *characterArray = [NSMutableArray array];
        
        for (NSDictionary *characterDictionary in topLevelArray)
        {
            TJBCharacter *character = [[TJBCharacter alloc] initWithDictionary:characterDictionary];
            [characterArray addObject:character];
        }
        
        completion(characterArray);
        
        
    }] resume];
}

+ (void)fetchImageForCharacter:(TJBCharacter *)character completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:character.image];
    NSLog(@"%@", imageURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
             
        if (error)
        {
            NSLog(@"There was an error fetching image: %@, %@", error, error.localizedDescription);
            return completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"There was no data found for our image.");
            return completion(nil);
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    }] resume];
}

@end

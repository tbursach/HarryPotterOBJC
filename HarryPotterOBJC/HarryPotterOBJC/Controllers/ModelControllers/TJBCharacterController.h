//
//  TJBCharacterController.h
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class TJBCharacter;

NS_ASSUME_NONNULL_BEGIN

@interface TJBCharacterController : NSObject

+ (void)fetchCharacterWithCompletion:(void(^) (NSArray<TJBCharacter *> *))completion;

+ (void)fetchImageForCharacter:(TJBCharacter *)character completion:(void(^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END

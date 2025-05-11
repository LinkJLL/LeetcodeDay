//
//  SwilingMethod.h
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface SwilingMethod : NSObject
- (void)parentMethod;
@end

@interface SonSwilingMethod: SwilingMethod

- (void)swilingMehtod;
@end
@interface SonSwilingMethod (Mehod)

@end
NS_ASSUME_NONNULL_END

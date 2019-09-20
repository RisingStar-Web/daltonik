//
//  Global.h
//  daltonik
//
//  Created by Андрей Зябкин on 13.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <Foundation/Foundation.h>
#define IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad



@interface Global : NSObject {

}

//@property (assign,nonatomic) NSInteger Accuracy1;
//@property (assign,nonatomic) NSInteger Accuracy2;

extern float Accuracy1;
extern float Accuracy2;
extern BOOL menuNotVisible;
extern NSInteger numberOfTest;
extern BOOL justStarted;

@end

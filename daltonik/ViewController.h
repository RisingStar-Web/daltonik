//
//  ViewController.h
//  daltonik
//
//  Created by Андрей Зябкин on 10.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "menuButton.h"
#import "Global.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController{
    
    //IBOutlet UIButton *firstTestButton;
    IBOutlet menuButton *firstTestButton;
    IBOutlet menuButton *secondTestButton;
    IBOutlet menuButton *infoButton;
    
    IBOutlet UILabel *appNameText;
    IBOutlet UILabel *appNameText2;

}


//Показ других тестов
- (IBAction)test1Pressed:(id)sender;
- (IBAction)test2Pressed:(id)sender;
//Переход к инфо
-(IBAction)showInfoScreen;



@end


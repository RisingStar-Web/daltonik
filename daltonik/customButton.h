//
//  customButton.h
//  daltonik
//
//  Created by Андрей Зябкин on 13.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@interface customButton : UIButton {
    

}

//Отображение фона
@property IBOutlet UIImageView *backgroundImage;

//Отображение нажатого состояния
@property IBOutlet UIImageView *touchedImage;

//Отображение названия
@property IBOutlet UILabel *nameOfButton;

//Ползунок прогресса
@property IBOutlet UIImageView *progressImage;


-(void)setProgress:(float)progress;

@end

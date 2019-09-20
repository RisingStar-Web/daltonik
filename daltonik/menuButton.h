//
//  menuButton.h
//  daltonik
//
//  Created by Андрей Зябкин on 12.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
IB_DESIGNABLE

@interface menuButton : UIButton {
    
//    //Картинки на фон
//    IBOutlet UIImageView *_leftImage;
//    IBOutlet UIImageView *_rightImage;

    //Тексты
  //  IBOutlet UILabel *percentLabel;
  //  IBOutlet UILabel *correctLabel;
  //  IBOutlet UILabel *testTextLabel;
  //  IBOutlet UILabel *testNameLabel;
    
}

//Картинки на фон
@property IBOutlet UIImageView *leftImage;
@property IBOutlet UIImageView *rightImage;
@property IBOutlet UIImageView *touchedImage;

//Тексты
@property (nonatomic,strong) IBOutlet UILabel *percentLabel;
@property (nonatomic,strong) IBOutlet UILabel *correctLabel;
@property (nonatomic,strong) IBOutlet UILabel *testTextLabel;
@property (nonatomic,strong) IBOutlet UILabel *testNameLabel;




@end

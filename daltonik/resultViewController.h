//
//  resultViewController.h
//  daltonik
//
//  Created by Андрей Зябкин on 24.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customButton.h"
#import "Global.h"

@interface resultViewController : UIViewController {
    
    //Текст
    IBOutlet UITextView *text;
    
    //Кнопка закрытия экрана
    IBOutlet customButton *backButton;
    
    IBOutlet customButton *progressBar;
    
}

//Закрыть тест
-(IBAction)closePressed:(id)sender;

@end

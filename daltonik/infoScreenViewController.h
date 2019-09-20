//
//  infoScreenViewController.h
//  daltonik
//
//  Created by Андрей Зябкин on 13.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customButton.h"
#import <MessageUI/MessageUI.h>
#import "Global.h"

@interface infoScreenViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    //Кнопка обратной связи
    IBOutlet customButton *contactUsButton;
    
    //Кнопка закрытия теста
    IBOutlet customButton *backButton;
    
    //Информационный текст
    IBOutlet UITextView *infoText;
    
    //Отправка письма
    MFMailComposeViewController *mailComposer;
}

//Отправка письма
-(IBAction)sendMail:(id)sender;

//Закрыть страницу
-(IBAction)closePressed:(id)sender;


@end

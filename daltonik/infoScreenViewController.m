//
//  infoScreenViewController.m
//  daltonik
//
//  Created by Андрей Зябкин on 13.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "infoScreenViewController.h"

@interface infoScreenViewController ()

@end

@implementation infoScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Скролл к началу текста
    [infoText scrollRangeToVisible:NSMakeRange(0, 0)];
    
    [backButton.backgroundImage setImage:[UIImage imageNamed:@"4btn"]];
    [backButton.nameOfButton setText:@"X"];
    
    
    //Надпись на кнопке
    [contactUsButton.nameOfButton setText:@"связаться с нами"];
    
    //Увеличиваем шрифты на iPad
    if(IPAD){
        [infoText setFont:[infoText.font fontWithSize:infoText.font.pointSize+20]];
        //[errorText setFont:[errorText.font fontWithSize:errorText.font.pointSize+10]];
        //[currentQuestionNum setFont:[currentQuestionNum.font fontWithSize:currentQuestionNum.font.pointSize+10]];
    }
}


//Нажата кнопка закрытия теста
-(void)closePressed:(id)sender{
    NSLog(@"OK2");
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Нажата кнопка обратной связи
-(void)sendMail:(id)sender{
    // Email Subject
    NSString *emailTitle = @"Дальтоник FEEDBACK";
    // Email Content
    NSString *messageBody = @"";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"joomba@me.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}



#pragma mark - mail compose delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    //  [self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



@end

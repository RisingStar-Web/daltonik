//
//  firstTestViewController.h
//  daltonik
//
//  Created by Андрей Зябкин on 10.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Global.h"
#import "customButton.h"

@interface firstTestViewController : UIViewController {
    
    //База данных вопросов
    NSDictionary *questionsDict;
    
    //Кнопка закрытия теста
    IBOutlet customButton *backButton;
    
    //Текст вопроса
    IBOutlet UILabel *questionText;
    //Окно с картинкой
    IBOutlet UIImageView *questionPicture;
    
    //Окно с рамкой
    IBOutlet UIImageView *questionPictureFrame;
    
    //Рамка вокруг зображения вопроса
    CGRect questionPictureStartFrame;
    CGRect questionPictureStartFrameFrame;
    
    //Номер текущего вопроса
    IBOutlet UILabel *currentQuestionNum;
    
    //Кнопки вариантов ответа
    IBOutlet customButton *firstButton;
    IBOutlet customButton *secondButton;
    IBOutlet customButton *thirdButton;
    IBOutlet customButton *fourthButton;
    
    
    //Окно с пояснением при ошибке
    IBOutlet UIImageView *errorBackground;
    IBOutlet UITextView *errorText;
    IBOutlet customButton *closeErrorButton;
    IBOutlet UIImageView *darkImage;
    
    IBOutlet UIView *errorView;
    
    
    NSDictionary *currentQuestionDict; //словарь с данными о текущем вопросе
    NSInteger questionNumber; //номер текущего вопроса
    NSMutableArray *orderArray;
    NSInteger correctAnswers; //количество правильных ответов
}


//Закрыть тест
-(IBAction)closePressed:(id)sender;

//Выбран вариант ответа
-(IBAction)variantSelected:(id)sender;

-(IBAction)closeErrorView:(id)sender;


@end

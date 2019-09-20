//
//  secondTestViewController.h
//  daltonik
//
//  Created by Андрей Зябкин on 10.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customButton.h"
#import "Global.h"


@interface secondTestViewController : UIViewController {
    
    //Текст вопроса
    IBOutlet UILabel *questionText;
    
    //Номер текущего вопроса
    IBOutlet UILabel *currentQuestionNum;
    
    //Кнопки с вариантами ответов
    IBOutlet UIButton *firstButton;
    IBOutlet UIButton *secondButton;
    IBOutlet UIButton *thirdButton;
    IBOutlet UIButton *fourthButton;
    IBOutlet UIButton *fifthButton;
    IBOutlet UIButton *sixthButton;
    
    //Кнопка закрытия теста
    IBOutlet customButton *backButton;
    
    
    NSDictionary *questionsDict2;
    NSDictionary *currentQuestionDict2; //словарь с данными о текущем вопросе
    NSInteger questionNumber2; //номер текущего вопроса
    NSMutableArray *orderArray2;
    NSInteger correctAnswers2; //количество правильных ответов
    NSMutableArray *buttonsArray; //массив кнопок с ответами
}


//Закрыть тест
-(IBAction)closePressed:(id)sender;

//Выбран вариант ответа
-(IBAction)variantSelected:(id)sender;



@end

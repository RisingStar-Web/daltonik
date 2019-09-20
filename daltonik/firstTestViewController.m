//
//  firstTestViewController.m
//  daltonik
//
//  Created by Андрей Зябкин on 10.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "firstTestViewController.h"
#import <AVFoundation/AVUtilities.h>


@interface firstTestViewController ()

@end



@implementation firstTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    //firstButton.titleLabel.adjustsFontSizeToFitWidth=YES;
    
    //Делаем названия кнопок многострочными
    firstButton.titleLabel.numberOfLines = 0; // Dynamic number of lines
    secondButton.titleLabel.numberOfLines = 0; // Dynamic number of lines
    thirdButton.titleLabel.numberOfLines = 0; // Dynamic number of lines
    fourthButton.titleLabel.numberOfLines = 0; // Dynamic number of lines
    
    questionText.numberOfLines = 0;
    
    [firstButton.backgroundImage setImage:[UIImage imageNamed:@"redColor"]];
    [secondButton.backgroundImage setImage:[UIImage imageNamed:@"redColor"]];
    [thirdButton.backgroundImage setImage:[UIImage imageNamed:@"redColor"]];
    [fourthButton.backgroundImage setImage:[UIImage imageNamed:@"redColor"]];
    
    //Запоминаем положение окна с вопросом
    questionPictureStartFrame=questionPicture.frame;
    questionPictureStartFrameFrame=questionPictureFrame.frame;
    
    [errorText setTextColor:[UIColor whiteColor]];
    
    //Располагаем окно ошибки
    CGRect one=errorView.frame;
    one.origin.y=self.view.bounds.size.height;
    [errorView setFrame:one];
    
    
    //Оформляем кнопку назад
    [backButton.backgroundImage setImage:[UIImage imageNamed:@"2btn"]];
    [backButton.nameOfButton setText:@"x"];
    
    //Оформляем кнопку далее
    [closeErrorButton.nameOfButton setText:@"далее"];
    [closeErrorButton.backgroundImage setImage:[UIImage imageNamed:@"blackColor"]];
    [closeErrorButton.backgroundImage setAlpha:0.4];

    
    /*
    //Устанавливаем границу картинки
    [questionPicture.layer setBorderColor: [[UIColor colorWithPatternImage:[UIImage imageNamed:@"3btn"]] CGColor]];
    [questionPicture.layer setBorderWidth: 4.0];
    [questionPicture.layer setCornerRadius: 0.0];
    */
    //[questionText setFont:[UIFont systemFontOfSize:20.0 weight:UIFontWeightLight]];
    
    //Убираем растягивание на iPad
    if (IPAD){
       
        questionPicture.contentMode=UIViewContentModeScaleAspectFit;
        questionPictureFrame.contentMode=UIViewContentModeScaleAspectFit;
        
        //Увеличиваем шрифты на iPad   
        [questionText setFont:[questionText.font fontWithSize:questionText.font.pointSize+20]];
        [errorText setFont:[errorText.font fontWithSize:errorText.font.pointSize+10]];
        [currentQuestionNum setFont:[currentQuestionNum.font fontWithSize:currentQuestionNum.font.pointSize+10]];
    }
    
   
    /*
    //Рамка вокруг картинки вопроса
    float kBorderSize=5.0;
    CGRect imageRect=AVMakeRectWithAspectRatioInsideRect(questionPicture.image.size,questionPicture.frame);
    CGRect borderRect=CGRectMake(imageRect.origin.x-kBorderSize, imageRect.origin.y-kBorderSize, imageRect.size.width+2*kBorderSize, imageRect.size.height+2*kBorderSize);
    questionPictureFrame.frame=borderRect;
     */
    
    //Загружаем данные о вопросах
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]; //Путь до базы данных
    questionsDict = [[NSDictionary dictionary] initWithContentsOfFile:plistPath]; //Создание словаря из базы данных
    
    //Создаем массив-последовательность вопросов
    questionNumber=1; //Устанавливаем номер текущего вопроса
    orderArray=[[NSMutableArray alloc] init];
    int i;
    for (i=1; i<=questionsDict.count; i++){
        [orderArray addObject:[NSNumber numberWithInteger:i]];
    }
    [self randomize]; // перемешивание массива с порядком вопросов
    
    //Обнуляем количество правильных ответов
    correctAnswers=0;
    
    //Выводим вопрос
    //[self showQuestion:[[orderArray objectAtIndex:0] integerValue]];
    [self showQuestion:1];

}



//Перемешивание массива в случайном порядке
-(void)randomize{
    NSUInteger count = [orderArray count];
    if (count < 1) return;
    for (NSUInteger i = 0; i < count -1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [orderArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}


//Показ вопроса
-(void)showQuestion:(NSInteger)qNum{
    
    
    
    //Устанавливаем номер текущего вопроса
    [currentQuestionNum setText:[NSString stringWithFormat:@"%d/%d",questionNumber,questionsDict.count]];
    
    //Рассчитываем точность ответов
    Accuracy1=(float)correctAnswers/(float)(questionNumber-1);
    
    //Получаем информацию о текущем вопросе
    currentQuestionDict=[[NSDictionary alloc] initWithDictionary:[questionsDict objectForKey:[NSString stringWithFormat:@"%d",(int)qNum]]];
    
    //Выводим на экран информацию о вопросе
    [questionText setText:[currentQuestionDict objectForKey:@"question"]]; //Выводим текст вопроса
    [questionPicture setImage:[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",(int)qNum] ofType:@"gif"]]];
    [firstButton setTitle:[currentQuestionDict objectForKey:@"a1"] forState:UIControlStateNormal];
    [secondButton setTitle:[currentQuestionDict objectForKey:@"a2"] forState:UIControlStateNormal];
    [thirdButton setTitle:[currentQuestionDict objectForKey:@"a3"] forState:UIControlStateNormal];
    [fourthButton setTitle:[currentQuestionDict objectForKey:@"a4"] forState:UIControlStateNormal];

    
    /*
    //setup text resizing check here
    if (questionText.contentSize.height > questionText.frame.size.height) {
        int fontIncrement = 1;
        while (questionText.contentSize.height > questionText.frame.size.height) {
            questionText.font = [UIFont systemFontOfSize:24-fontIncrement];
            fontIncrement++;
        }
    }
    */
    
    //UIImage *aaa=[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"gif"]];
    
    /*
    if(IPAD){
        float kBorderSize=4.0;
        CGRect imageRect=AVMakeRectWithAspectRatioInsideRect(questionPicture.image.size,questionPicture.frame);
        CGRect borderRect=CGRectMake(imageRect.origin.x-kBorderSize, imageRect.origin.y-kBorderSize, imageRect.size.width+2*kBorderSize, imageRect.size.height+2*kBorderSize);
        questionPictureFrame.frame=borderRect;
    }
     */
}

//Показ результатов
-(void)showResultsScreen{
    [self performSegueWithIdentifier:@"showResult" sender:self];
}



//Выбран вариант ответа
-(void)variantSelected:(id)sender{
    
    //Проверка, что вопрос еще есть в базе
    if (questionNumber>=questionsDict.count){
        numberOfTest=1; //Устанавливаем номер теста
        [self showResultsScreen];
        NSLog(@"НОМЕР ВОПРОСА БОЛЬШЕ ЧЕМ ВОПРОСОВ В СПИСКЕ");
        return;
    }


    //Проверяем правильный ли ответ
    if ([sender tag]==[[currentQuestionDict objectForKey:@"correctAnswer"] integerValue]){
        correctAnswers ++; //Увеличиваем счетчик правильных ответов
        //вывод ответа//
        [self showQuestion:[[orderArray objectAtIndex:(questionNumber++)] integerValue]];
    }
    else{
        [errorText setText:[currentQuestionDict objectForKey:@"annotation"]];
        [self showErrorView]; //Выводим разъяснение об ошибке
    }
    
    //вывод ответа//
    //[self showQuestion:[[orderArray objectAtIndex:(questionNumber++)] integerValue]];

}

//Вывод view с ошибкой
-(void)showErrorView{
    
    //Перематываем текст с пояснением к началу
    [errorText scrollRangeToVisible:NSMakeRange(0, 1)];
    
    [UIView animateWithDuration:0.7 animations:^{
        
        CGFloat topPadding=0;
        CGFloat bottomPadding=0;
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            topPadding = window.safeAreaInsets.top;
            bottomPadding = window.safeAreaInsets.bottom;
        }
        
        //Выводим окно с пояснением ошибки
        CGRect errorFrame=errorView.frame;
        errorFrame.origin.y=self.view.frame.size.height - errorFrame.size.height-bottomPadding;
        errorView.frame=errorFrame;
        
        //Затемняем остальное
        [darkImage setAlpha:0.5];
        
        //Двигаем изображение с вопросом вверх
        CGRect questionPictureFrameNew=questionPicture.frame;
        CGRect questionPictureFrameNewFrame=questionPictureFrame.frame;
        questionPictureFrameNew.origin.y=questionText.frame.origin.y+(questionPictureFrame.frame.size.height - questionPicture.frame.size.height)/2;
        questionPictureFrameNewFrame.origin.y=questionText.frame.origin.y;
        questionPicture.frame=questionPictureFrameNew;
        questionPictureFrame.frame=questionPictureFrameNewFrame;
        
        
        /*
        float kBorderSize=5.0;
        CGRect imageRect=AVMakeRectWithAspectRatioInsideRect(questionPicture.image.size,questionPicture.frame);
        CGRect borderRect=CGRectMake(imageRect.origin.x-kBorderSize, imageRect.origin.y-kBorderSize, imageRect.size.width+2*kBorderSize, imageRect.size.height+2*kBorderSize);
        questionPictureFrame.frame=borderRect;
         */
        
    }];
    [UIView commitAnimations];
    
}

//Закрытие view с ошибкой
-(IBAction)closeErrorView:(id)sender{
    
    //Скрываем окно с пояснением ошибки
    [UIView animateWithDuration:0.7 animations:^{
    
        //Выводим окно с пояснением ошибки
        CGRect errorFrame=errorView.frame;
        errorFrame.origin.y=self.view.frame.size.height;
        errorView.frame=errorFrame;
        
        //Осветляем остальное
        [darkImage setAlpha:0.0];
        
        //Двигаем изображение с вопросом вниз
        CGRect qF=questionPicture.frame;
        CGRect qF2=questionPictureFrame.frame;
        qF.origin.y=questionPictureStartFrame.origin.y;
        qF2.origin.y=questionPictureStartFrameFrame.origin.y;
        questionPicture.frame=qF;
        questionPictureFrame.frame=qF2;
        
        
        
        /*
        //Л
        float kBorderSize=5.0;
        CGRect imageRect=AVMakeRectWithAspectRatioInsideRect(questionPicture.image.size,questionPicture.frame);
        CGRect borderRect=CGRectMake(imageRect.origin.x-kBorderSize, imageRect.origin.y-kBorderSize, imageRect.size.width+2*kBorderSize, imageRect.size.height+2*kBorderSize);
        questionPictureFrame.frame=borderRect;
         */

        
    } completion:^( BOOL completed ){
        //вывод ответа//
        [self showQuestion:[[orderArray objectAtIndex:(questionNumber++)] integerValue]];
    }];

    [UIView commitAnimations];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

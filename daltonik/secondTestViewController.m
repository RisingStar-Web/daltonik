//
//  secondTestViewController.m
//  daltonik
//
//  Created by Андрей Зябкин on 10.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "secondTestViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface secondTestViewController ()

@end

//NSDictionary *questionsDict2;
//NSDictionary *currentQuestionDict2; //словарь с данными о текущем вопросе
//NSInteger questionNumber2; //номер текущего вопроса
//NSMutableArray *orderArray2;
//NSInteger correctAnswers2; //количество правильных ответов


@implementation secondTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Оформляем внешний вид

    
    //UIColor *testcolor=UIColorFromRGB(0xBC1128);
    
    //Оформляем кнопку назад
    [backButton.backgroundImage setImage:[UIImage imageNamed:@"4btn"]];
    [backButton.nameOfButton setText:@"X"];
    
    //Увеличиваем шрифты на iPad
    if(IPAD){
        [questionText setFont:[questionText.font fontWithSize:questionText.font.pointSize+20]];
        [currentQuestionNum setFont:[currentQuestionNum.font fontWithSize:currentQuestionNum.font.pointSize+10]];
    }
    
    //Инициализируем массив кнопок
    buttonsArray=[[NSMutableArray alloc] initWithObjects:firstButton, secondButton, thirdButton, fourthButton, fifthButton, sixthButton, nil];
    
    for (int i=0; i<buttonsArray.count; i++){
        [[[buttonsArray objectAtIndex:i] layer] setBorderColor:[[UIColor colorWithPatternImage:[UIImage imageNamed:@"3btn"]] CGColor]];
        [[[buttonsArray objectAtIndex:i] layer] setBorderWidth:4.0];
        [[[buttonsArray objectAtIndex:i] layer] setCornerRadius:0.0];
    }
    

    //Загружаем данные о вопросах
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"dataTest2" ofType:@"plist"]; //Путь до базы данных
    questionsDict2 = [[NSDictionary dictionary] initWithContentsOfFile:plistPath]; //Создание словаря из базы данных
    
    //Создаем массив-последовательность вопросов
    questionNumber2=1; //Устанавливаем номер текущего вопроса
    orderArray2=[[NSMutableArray alloc] init];
    int i;
    for (i=1; i<=questionsDict2.count; i++){
        [orderArray2 addObject:[NSNumber numberWithInteger:i]];
    }
    [self randomize]; // перемешивание массива с порядком вопросов
    
    //Обнуляем количество правильных ответов
    correctAnswers2=0;
    
    //Выводим вопрос
    [self showQuestion:1];
}


//Перемешивание массива в случайном порядке
-(void)randomize{
    NSUInteger count = [orderArray2 count];
    if (count < 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [orderArray2 exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}


//Показ вопроса
-(void)showQuestion:(NSInteger)qNum{
    
    //Устанавливаем номер текущего вопроса
    [currentQuestionNum setText:[NSString stringWithFormat:@"%d/%d",questionNumber2,questionsDict2.count]];
    
    //Рассчитываем точность ответов
    Accuracy2=(float)correctAnswers2/(float)(questionNumber2-1);

    
    currentQuestionDict2=[[NSDictionary alloc] initWithDictionary:[questionsDict2 objectForKey:[NSString stringWithFormat:@"%d",(int)qNum]]];
    
    //Выбираем ячейку, в которой будет неправильный ответ
    NSInteger wrongButton=arc4random_uniform(6);
    
    
    //Загружаем правильный и неправильный цвета
    NSString *correctColor= [currentQuestionDict2 objectForKey:@"correctColor"];
    unsigned correctColorInt = 0;
    [[NSScanner scannerWithString:correctColor] scanHexInt:&correctColorInt];
    
    NSString *wrongColor= [currentQuestionDict2 objectForKey:@"wrongColor"];
    unsigned wrongColorInt = 0;
    [[NSScanner scannerWithString:wrongColor] scanHexInt:&wrongColorInt];

    
    
    //Выводим на экран информацию о вопросе
    for (int i=0; i<buttonsArray.count; i++){
        if (i!=wrongButton) { //Устанавливаем правильный цвет
            [[buttonsArray objectAtIndex:i] setBackgroundColor:UIColorFromRGB(correctColorInt)];
            [[buttonsArray objectAtIndex:i] setTag:1];
        }
        else{ //Устанавливаем неправильный цвет цвет
            [[buttonsArray objectAtIndex:i] setBackgroundColor:UIColorFromRGB(wrongColorInt)];
            [[buttonsArray objectAtIndex:i] setTag:0];
        }
    }
    
    NSLog([NSString stringWithFormat:@"%d",qNum]);
    
    
    //UIImage *aaa=[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"gif"]];
}


//Показ результатов
-(void)showResultsScreen{
    [self performSegueWithIdentifier:@"showResult2" sender:self];
}


//Нажата кнопка закрытия теста
-(void)closePressed:(id)sender{
    NSLog(@"OK2");
    [self dismissViewControllerAnimated:YES completion:nil];
}


//Выбран вариант ответа
-(void)variantSelected:(id)sender{

    
    //Проверка, что вопрос еще есть в базе
    if (questionNumber2>=questionsDict2.count){
        //Вывод окна с результатами теста
        numberOfTest=2; //Устанавливаем номер теста
        [self showResultsScreen];
        NSLog(@"НОМЕР ВОПРОСА БОЛЬШЕ ЧЕМ ВОПРОСОВ В СПИСКЕ");
        return;
    }
    
    //Проверка правильности ответа
    UIButton* selectedButton=sender;
    if (selectedButton.tag==0)
        correctAnswers2++;

    //вывод следующего вопроса//
    //[self showQuestion:++questionNumber2];
     [self showQuestion:[[orderArray2 objectAtIndex:(questionNumber2++)] integerValue]];
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

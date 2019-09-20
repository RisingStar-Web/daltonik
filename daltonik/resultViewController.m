//
//  resultViewController.m
//  daltonik
//
//  Created by Андрей Зябкин on 24.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "resultViewController.h"

@interface resultViewController ()

@end

@implementation resultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Оформляем кнопку назад
    [backButton.backgroundImage setImage:[UIImage imageNamed:@"2btn"]];
    [backButton.nameOfButton setText:@"x"];
    
    
    //Скролл к началу текста
    [text scrollRangeToVisible:NSMakeRange(0, 0)];
    
    //Точность пройденного теста
    float accuracy=0.0;
    
    //Устаналиваем процент точности
    switch (numberOfTest) {
        case 1:{
            [progressBar setProgress:Accuracy1];
            accuracy=Accuracy1;
            break;
        }
        case 2:{
            [progressBar setProgress:Accuracy2];
            accuracy=Accuracy2;
            break;
        }
            break;
        default:
            accuracy=0.0;
            break;
    }
    
    //Пишем результат тестирования
    if (accuracy<=0.3){
        [text setText:@"Поздравляем! Вы закончили тестирование. К сожалению, результат очень плохой, у вас явные проблемы с распознаванием цветов и зрением в целом, возможно Вы страдаете дальтонизмом. Настоятельно рекомендуем посетить врача. Результаты в данном тестировании при средних показателях качества зрения не должны опускаться ниже 60%."];
    }
    else if (accuracy>=0.3 && accuracy<=0.6){
        [text setText:@"Поздравляем! Вы закончили тестирование. Результат оставляет желать лучшего, судя по результатам тестирования у вас есть заметные проблемы с распознаванием цветов. Рекомендуем попробовать пройти тест повторно, в случае схожего результата следует обратиться ко врачу."];
    }
    else if (accuracy>=0.6 && accuracy<=0.9){
        [text setText:@"Поздравляем! Вы закончили тестирование. Достойный результат, но есть вероятность легких отклонений зрения, а именно распознавания цветов. Для улучшения результатов, предлагем повторно, более внимательно пройти тестирование, а также попробовать себя во втором тесте."];
    }
    else if (accuracy>=0.9){
        [text setText:@"Поздравляем! Вы закончили тестирование. Великолепный результат, вы точно не страдаете дальтонизмом! Теперь проверьте свои глаза во втором тесте!"];
    }
    
    //Увеличиваем шрифты на iPad
    if(IPAD){
        [text setFont:[text.font fontWithSize:text.font.pointSize+10]];
        //[errorText setFont:[errorText.font fontWithSize:errorText.font.pointSize+10]];
        //[currentQuestionNum setFont:[currentQuestionNum.font fontWithSize:currentQuestionNum.font.pointSize+10]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Нажата кнопка закрытия теста
-(void)closePressed:(id)sender{
    NSLog(@"OK2");
    //[self dismissViewControllerAnimated:YES completion:nil];
    

    
    [self performSegueWithIdentifier:@"showMenu" sender:self];
}


@end

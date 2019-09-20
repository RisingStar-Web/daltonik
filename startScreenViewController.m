//
//  startScreenViewController.m
//  daltonik
//
//  Created by Андрей Зябкин on 12.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "startScreenViewController.h"

@interface startScreenViewController ()

@end

@implementation startScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Загружаем данные о верных ответах
    Accuracy1=[[NSUserDefaults standardUserDefaults] floatForKey:@"Accuracy1"];
    Accuracy2=[[NSUserDefaults standardUserDefaults] floatForKey:@"Accuracy2"];
    
    if(isnan(Accuracy1)){
        Accuracy1=0;
    }
    if(isnan(Accuracy2)){
        Accuracy2=0;
    }

    
    //Отмечаем, что программа только запущена
    justStarted=true;
    
    sleep(1);
}



-(void)viewDidAppear:(BOOL)animated{
    [self performSegueWithIdentifier:@"showMenu" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *controller =segue.destinationViewController;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    
    
    //[self presentModalViewController:controller animated:YES];
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

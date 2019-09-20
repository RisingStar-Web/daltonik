//
//  menuButton.m
//  daltonik
//
//  Created by Андрей Зябкин on 12.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "menuButton.h"

@interface menuButton ()

@end

@implementation menuButton


//-(void)load


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]){
        if (self.subviews.count == 0) {
            [self load];
        }
    }
    return self;
}



//Делаем кнопку нажатой
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_touchedImage setAlpha:0.3];
    [super touchesBegan:touches withEvent:event];
}

//Делаем кнопку ненажатой
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_touchedImage setAlpha:0.0];
    [super touchesEnded:touches withEvent:event];
}

 
/*
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]){
        [self load];
    }
    return self;
}
*/

//Загружаем и XIB
-(void)load{


    UIView *view=[[[NSBundle mainBundle] loadNibNamed:@"menuButton" owner:self options:nil] firstObject];
    
    [self addSubview:view];
    view.frame=self.bounds;

    
    //Увеличиваем размер шрифтов на iPad
    if (IPAD){
        [_percentLabel setFont:[_percentLabel.font fontWithSize:_percentLabel.font.pointSize+20]];
        [_correctLabel setFont:[_correctLabel.font fontWithSize:_correctLabel.font.pointSize+20]];
        [_testNameLabel setFont:[_testNameLabel.font fontWithSize:_testNameLabel.font.pointSize+20]];
        [_testTextLabel setFont:[_testTextLabel.font fontWithSize:_testTextLabel.font.pointSize+20]];
    }
 
}




-(void)awakeFromNib{
    [super awakeFromNib];
    

/*
    
    CGRect f=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    
    
    UIImageView *test=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2btn"]];
    [test setFrame:CGRectMake(0, 0, self.bounds.size.width*0.3, self.bounds.size.height)];
    [self addSubview:test];
    
    //[test setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin];
    [test setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];

//    [_leftImage setFrame:CGRectMake(0, 0, self.bounds.size.width*0.3, self.bounds.size.height)];
//    [_leftImage setImage:[UIImage imageNamed:@"2btn"]];

*/
    
}




//-(void)setFrame:(CGRect)frame{
//    
//    CGRect one = super.frame;
//    float k=frame.size.width/one.size.width;
//    
//    [super setFrame:frame];
//    
//    /*
//    NSArray *ar=self.subviews;
//    for (int i=0; i<ar.count; i++)
//        [ar[i] setFrame:CGRectMake([ar[i] frame].origin.x, [ar[i] frame].origin.y, [ar[i] frame].size.width*k, [ar[i] frame].size.height*k)];
//    */
//}




-(void)setLeftImageBackground:(UIImage *)leftImageBackground{
    [_leftImage setImage:leftImageBackground];
}



-(void)setLeftImage{
    NSLog(@"rfg");
    //[_testTextLabel setText:@"ffjfjfj"];
}

@end

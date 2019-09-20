//
//  customButton.m
//  daltonik
//
//  Created by Андрей Зябкин on 13.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "customButton.h"

@interface customButton ()

@end

@implementation customButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]){
        if (self.subviews.count == 0) {
            [self load];
        }
    }
    return self;
}


//Загрузка XIB
-(void)load{
    UIView *view=[[[NSBundle mainBundle] loadNibNamed:@"customButton" owner:self options:nil] firstObject];
    
    [self addSubview:view];
    view.frame=self.bounds;
    [_progressImage setAlpha:0.0];
    
    //Увеличиваем размер шрифтов на iPad
    if (IPAD){
        [_nameOfButton setFont:[_nameOfButton.font fontWithSize:_nameOfButton.font.pointSize+20]];
        [self.titleLabel setFont:[self.titleLabel.font fontWithSize:self.titleLabel.font.pointSize+10]];
    }
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


//Устанавливаем прогресс
-(void)setProgress:(float)progress{
    [_progressImage setAlpha:1.0];
    
    CGRect wholeRect=self.bounds;
    
    wholeRect.size.width=self.frame.size.width*progress;
    
    [_progressImage setFrame:wholeRect];
    
    [_nameOfButton setText:[NSString stringWithFormat:@"%.0f%%",progress*100]];
}


@end


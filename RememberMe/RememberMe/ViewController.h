//
//  ViewController.h
//  RememberMe
//
//  Created by Iorweth on 03/03/2014.
//  Copyright (c) 2014 alexik (c). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

- (IBAction)btn1click:(id)sender;
- (IBAction)btn2click:(id)sender;
- (IBAction)btn3click:(id)sender;
- (IBAction)btn4click:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *UIimage;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end



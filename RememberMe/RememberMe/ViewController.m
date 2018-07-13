//
//  ViewController.m
//  RememberMe
//
//  Created by Iorweth on 03/03/2014.
//  Copyright (c) 2014 alexik (c). All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

    id randomObject = nil;
    NSString    *imgName;
    NSArray     *arr;
    NSUInteger  _answersNo,_answersYes;
    AVAudioPlayer *audioPlayer;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"hello" ofType:@"mp3"];
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:audioURL error:nil];
    [audioPlayer play];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"easy100"
                                                     ofType:@"txt"];
    NSString* content = [
                         NSString stringWithContentsOfFile:path
                         encoding:NSUTF8StringEncoding
                         error:NULL
                         ];

    arr = [content componentsSeparatedByString:@"\n"];
    
    NSLog(@"%@",arr);
    [self RefreshImage];
    [self RandomButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//----------------------------------------------- functions ----------------------------------------------
- (void)RandomObject
{
    if ([arr count] > 0)
    {
        int randomIndex = arc4random()%[arr count];
        randomObject = [arr objectAtIndex:randomIndex];
    }
}

- (void)SoundYes
{
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"yes" ofType:@"mp3"];
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:audioURL error:nil];
    [audioPlayer play];
}


- (void)SoundNo
{
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"no" ofType:@"mp3"];
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:audioURL error:nil];
    [audioPlayer play];
}

- (void)RefreshImage
{
    [self RandomObject];
    imgName = randomObject;
    UIImage *img = [UIImage imageNamed: [NSString stringWithFormat:@"%@.png",randomObject]];
    _UIimage.image= img;
}

- (void)NilButtons
{
        [_btn1 setTitle:nil forState:UIControlStateNormal];
        [_btn2 setTitle:nil forState:UIControlStateNormal];
        [_btn3 setTitle:nil forState:UIControlStateNormal];
        [_btn4 setTitle:nil forState:UIControlStateNormal];
}


//----------------------------------------------- Let's begin ----------------------------------------------
- (void)RandomButtons
{
    [self NilButtons];
    NSMutableArray * btns = [[NSMutableArray alloc] initWithObjects: _btn1, _btn2, _btn3, _btn4, nil];
    NSUInteger btn_index;
    id rnd_btn = nil;
    NSString *word1=nil;    NSString *word2=nil;    NSString *word3=nil;
    
    //word1
    btn_index = arc4random() % [btns count];
    rnd_btn = [btns objectAtIndex:btn_index];
    [btns removeObjectAtIndex:btn_index];
    [rnd_btn setTitle:[NSString stringWithFormat:@"%@",randomObject] forState:UIControlStateNormal];
    
    word1=randomObject;
    [self RandomObject];
    
    //word2
    btn_index = arc4random() % [btns count];
    rnd_btn = [btns objectAtIndex:btn_index];
    [btns removeObjectAtIndex:btn_index];

    if (word1==randomObject)
    {
        while (word1==randomObject)
        {
            [self RandomObject];
        }
    }
    [rnd_btn setTitle:[NSString stringWithFormat:@"%@",randomObject] forState:UIControlStateNormal];
    
    word2=randomObject;
    [self RandomObject];
    
    //word3
    btn_index = arc4random() % [btns count];
    rnd_btn = [btns objectAtIndex:btn_index];
    [btns removeObjectAtIndex:btn_index];

    if ((word1==randomObject)||(word2==randomObject))
    {
        while ((word1==randomObject)||(word2==randomObject))
        {
            [self RandomObject];
        }
    }
    [rnd_btn setTitle:[NSString stringWithFormat:@"%@",randomObject] forState:UIControlStateNormal];
    
    word3=randomObject;
    [self RandomObject];
    
    //word4
    btn_index = arc4random() % [btns count];
    rnd_btn = [btns objectAtIndex:btn_index];

    if ((word1==randomObject)||(word2==randomObject)||(word3==randomObject))
    {
        while ((word1==randomObject)||(word2==randomObject)||(word3==randomObject))
        {
            [self RandomObject];
        }
    }
    [rnd_btn setTitle:[NSString stringWithFormat:@"%@",randomObject] forState:UIControlStateNormal];
}


//----------------------------------------------- Buttons clickers ----------------------------------------------
- (IBAction)btn1click:(id)sender
{
    if ([_btn1.titleLabel.text isEqualToString:imgName])
    {
        [self SoundYes];
        
        //[_btn1 setBackgroundImage:[UIImage imageNamed:@"button_yes.png"] forState:UIControlStateHighlighted];
        
        _answersYes = _answersYes + 1;
        _label.text=[NSString stringWithFormat:@"Верно: %lu",(unsigned long)_answersYes];
    }
    else
    {
        [self SoundNo];
        
        //[_btn1 setBackgroundImage:[UIImage imageNamed:@"button_no.png"] forState:UIControlStateHighlighted];
        
        _answersNo  = _answersNo  + 1;
        _label2.text=[NSString stringWithFormat:@"Неверно: %lu",(unsigned long)_answersNo];
    }
    [self RefreshImage];
    [self RandomButtons];
    //[_btn1 setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateHighlighted];
}
- (IBAction)btn2click:(id)sender
{
    if ([_btn2.titleLabel.text isEqualToString:imgName])
    {
        _answersYes = _answersYes + 1;
        _label.text=[NSString stringWithFormat:@"Верно: %lu",(unsigned long)_answersYes];
        [self SoundYes];
    }
    else
    {
        _answersNo  = _answersNo  + 1;
        _label2.text=[NSString stringWithFormat:@"Неверно: %lu",(unsigned long)_answersNo];
        [self SoundNo];
    }
    [self RefreshImage];
    [self RandomButtons];
}
- (IBAction)btn3click:(id)sender
{
    if ([_btn3.titleLabel.text isEqualToString:imgName])
    {
        [self SoundYes];
        _answersYes = _answersYes + 1;
        _label.text=[NSString stringWithFormat:@"Верно: %lu",(unsigned long)_answersYes];
    }
    else
    {
        [self SoundNo];
        _answersNo  = _answersNo  + 1;
        _label2.text=[NSString stringWithFormat:@"Неверно: %lu",(unsigned long)_answersNo];
    }
    [self RefreshImage];
    [self RandomButtons];
}
- (IBAction)btn4click:(id)sender
{
    if ([_btn4.titleLabel.text isEqualToString:imgName])
    {
        [self SoundYes];
        _answersYes = _answersYes + 1;
        _label.text=[NSString stringWithFormat:@"Верно: %lu",(unsigned long)_answersYes];
    }
    else
    {
        [self SoundNo];
        _answersNo  = _answersNo  + 1;
        _label2.text=[NSString stringWithFormat:@"Неверно: %lu",(unsigned long)_answersNo];
    }
    [self RefreshImage];
    [self RandomButtons];
}
@end
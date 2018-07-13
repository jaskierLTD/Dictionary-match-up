//
//  word.m
//  RememberMe
//
//  Created by Iorweth on 01/04/2014.
//  Copyright (c) 2014 alexik (c). All rights reserved.
//

#import "word.h"

@implementation word

NSString *theWord;
NSString *transcription;
NSString *translate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    
    return self;
}

+ (void)initWord:(NSString *)_word: (NSString *)_transcription: (NSString *)_translate
{
    theWord = _word;
    transcription = _transcription;
    translate = _translate;
}

@end

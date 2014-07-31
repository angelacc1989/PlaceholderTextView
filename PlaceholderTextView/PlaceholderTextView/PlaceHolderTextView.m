//
//  PlaceHolderTextView.m
//  PlaceholderTextView
//
//  Created by Sukie Zhao on 14-7-25.
//  Copyright (c) 2014年 company. All rights reserved.
//

#import "PlaceHolderTextView.h"

@interface PlaceHolderTextView()
{
    UILabel *placeHolderLabel;
}
@property (nonatomic, retain) UILabel *placeHolderLabel;
@end

@implementation PlaceHolderTextView
@synthesize placeHolderLabel;
@synthesize placeholder = _placeholder;
@synthesize placeholderFont = _placeholderFont;
@synthesize placeholderColor = _placeholderColor;
@synthesize placeHolderTextAlignment = _placeHolderTextAlignment;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [placeHolderLabel release]; placeHolderLabel = nil;
    [_placeholderColor release]; _placeholderColor = nil;
    [_placeholder release]; _placeholder = nil;
    [super dealloc];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initPlaceHolderLabel];
    [self setPlaceholder:@""];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    
    if ([self.text length] != 0) {
        
        //有文字的时候，光标移到最前端
        CGFloat height = [self heightForText:self.text withTextWidth:self.bounds.size.width withFont:self.font];
        self.contentOffset = (CGPoint){.x = 0, .y = -MAX(0, height - self.bounds.size.height)};
        
        self.placeHolderLabel.alpha = 0.0;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initPlaceHolderLabel];
        [self setPlaceholder:@""];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void)initPlaceHolderLabel
{
    if (self.placeHolderLabel == nil) {
        UILabel  *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,self.contentOffset.y,self.bounds.size.width - 16,20)];
        tempLabel.numberOfLines = 0;
        tempLabel.font = self.font;
        tempLabel.textAlignment = NSTextAlignmentLeft;
        tempLabel.backgroundColor = [UIColor clearColor];
        tempLabel.autoresizingMask = UIViewAutoresizingNone;
        tempLabel.lineBreakMode = NSLineBreakByWordWrapping;
        tempLabel.textColor = self.placeholderColor == nil ?[UIColor lightGrayColor]:self.placeholderColor;
        tempLabel.alpha = 1.0;
        self.placeHolderLabel = tempLabel;
        [tempLabel release];
        [self addSubview:placeHolderLabel];
    }
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    
    if([[self text] length] == 0)
    {
        self.placeHolderLabel.alpha = 1.0;
    }
    else
    {
        self.placeHolderLabel.alpha = 0.0;
    }
}

-(void)setText:(NSString *)text
{
    if ([text length] == 0) {
        self.placeHolderLabel.alpha = 1.0;
    }else{
        self.placeHolderLabel.alpha = 0.0;
    }
    [super setText:text];
}


-(void)setPlaceholder:(NSString *)placeholder
{
    [_placeholder release];
    _placeholder = [placeholder retain];
    self.placeHolderLabel.text = _placeholder;
    
    CGFloat height = [self heightForText:_placeholder withTextWidth:self.placeHolderLabel.bounds.size.width withFont:self.placeHolderLabel.font];
    
    self.placeHolderLabel.frame = CGRectMake(8, self.contentOffset.y, self.placeHolderLabel.bounds.size.width, height);
    
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    [_placeholderColor release];
    _placeholderColor = [placeholderColor retain];
    self.placeHolderLabel.textColor = _placeholderColor;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont
{
    [_placeholderFont release];
    _placeholderFont = [placeholderFont retain];
    self.placeHolderLabel.font = _placeholderFont;
}

-(void)setPlaceHolderTextAlignment:(NSTextAlignment )placeHolderTextAlignment
{
    self.placeHolderLabel.textAlignment = placeHolderTextAlignment;
}

- (CGFloat)heightForText:(NSString*)text withTextWidth:(CGFloat)textWidth withFont:(UIFont*)aFont {
    CGSize size = [text sizeWithFont:aFont constrainedToSize:CGSizeMake(textWidth, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
    return size.height;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setPlaceholder:self.placeholder];
}

@end

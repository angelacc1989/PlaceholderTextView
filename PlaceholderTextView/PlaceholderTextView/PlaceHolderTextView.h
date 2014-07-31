//
//  PlaceHolderTextView.h
//  PlaceholderTextView
//
//  Created by Sukie Zhao on 14-7-25.
//  Copyright (c) 2014年 company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceHolderTextView : UITextView{
    NSString *_placeholder;
    UIColor *_placeholderColor;
    NSTextAlignment _placeHolderTextAlignment;
}
@property (nonatomic, retain) NSString *placeholder;//提示文字
@property (nonatomic, retain) UIFont *placeholderFont;//字体大小
@property (nonatomic, retain) UIColor *placeholderColor;//提示文字的颜色
@property (nonatomic, assign) NSTextAlignment placeHolderTextAlignment;//对齐方式

-(void)textChanged:(NSNotification*)notification;

@end

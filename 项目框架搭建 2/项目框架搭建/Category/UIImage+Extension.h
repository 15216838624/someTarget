//
//  UIImage+XMG.h
//  小码哥彩票
//
//  Created by xiaomage on 16/1/29.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  图片不要渲染
 *
 *  @param name 图片名字
 *
 *  @return 返回一张不要渲染的图片
 */
+ (UIImage *)imageWithRenderOriginalName:(NSString *)name;


/**
 *  图片拉伸不变形处理
 *
 *  @param name 图片名字
 *
 *  @return 返回图片
 */
+ (UIImage *)resizableImage:(NSString *)name;



/**
 *  生成圆形图片
 *  @param imagename 要处理的图片名字
 *  @return 生成圆形图片
 */
+ (UIImage *)imageWithimage:(NSString *)imagename;



/**
 *  生成一张带有边框的圆形图片
 *
 *  @param borderW     边框宽度
 *  @param borderColor 边框颜色
 *  @param image       要添加边框的图片
 *
 *  @return 生成的带有边框的圆形图片
 */
+ (UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image;



@end

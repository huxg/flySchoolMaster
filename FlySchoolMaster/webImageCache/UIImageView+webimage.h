//
//  UIImageView+webimage.h
//  nanstreet
//
//  Created by 黄超 on 12-10-30.
//  Copyright (c) 2012年 shanchen. All rights reserved.
//



#import "SDWebImageCompat.h"
#import "SDWebImageManagerDelegate.h"
#import "SDWebImageManager.h"

@interface UIImageView (webimage) <SDWebImageManagerDelegate>

/**
 * Set the imageView `image` with an `url`.
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url that the image is found.
 * @see setImageWithURL:placeholderImage:
 */
- (void)setImageWithURL:(NSURL *)url;

/**
 * Set the imageView `image` with an `url` and a placeholder.
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url that the `image` is found.
 * @param placeholder A `image` that will be visible while loading the final image.
 * @see setImageWithURL:placeholderImage:options:
 */
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

/**
 * Set the imageView `image` with an `url`, placeholder and custom options.
 *
 * The downloand is asynchronous and cached.
 *
 * @param url The url that the `image` is found.
 * @param placeholder A `image` that will be visible while loading the final image.
 * @param options A list of `SDWebImageOptions` for current `imageView`. Available options are `SDWebImageRetryFailed`, `SDWebImageLowPriority` and `SDWebImageCacheMemoryOnly`.
 */
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

/**
 * Cancel the current download
 */
- (void)cancelCurrentImageLoad;

- (void)setLoadingImageWithURL:(NSURL *)url placeholderImage:(NSString *)placeholder;

@end
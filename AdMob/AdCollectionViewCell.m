//
//  AdCollectionViewCell.m
//  AdMob
//
//  Created by Plunien, Johannes on 07/10/15.
//  Copyright © 2015 eBay Kleinanzeigen. All rights reserved.
//

#import "AdCollectionViewCell.h"
#import "AppDelegate.h"
#import <GoogleMobileAds/GADExtras.h>
#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GADSearchBannerView.h>
#import <GoogleMobileAds/GADSearchRequest.h>

@interface AdCollectionViewCell () <GADBannerViewDelegate>

@property (nonatomic) GADSearchBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end

@implementation AdCollectionViewCell

- (void)setUpAd
{
    [self prepareViews];
    [self loadRequest];
}

- (void)prepareViews
{
    [self.bannerView removeFromSuperview];
    dispatch_async(dispatch_get_main_queue(), ^{
        CGRect frame = self.contentView.bounds;
        GADSearchBannerView *bannerView = [[GADSearchBannerView alloc] initWithAdSize:GADAdSizeFromCGSize(frame.size)];
        bannerView.rootViewController = AppDelegate.appDelegate.window.rootViewController;
        bannerView.adUnitID = @"ca-app-pub-3940256099942544/6300978111";
        bannerView.delegate = self;
        self.bannerView = bannerView;
    });
    self.bannerView.hidden = NO;
    [self.contentView addSubview:self.bannerView];

    [self.activityIndicatorView startAnimating];
    [self.contentView bringSubviewToFront:self.activityIndicatorView];
}

- (GADRequest *)buildRequest
{
    GADSearchRequest *searchRequest = [[GADSearchRequest alloc] init];
    searchRequest.query = @"fahrrad";
    return searchRequest;
}

- (void)loadRequest
{
    GADRequest *request = [self buildRequest];
    [self.bannerView loadRequest:request];
}

#pragma mark - GADBannerViewDelegate

- (void)adViewDidReceiveAd:(GADBannerView *)view
{
    [self.activityIndicatorView stopAnimating];
    [self setNeedsLayout];
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    [self.activityIndicatorView stopAnimating];
    self.bannerView.hidden = YES;
}

@end

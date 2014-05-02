//
//  MyLocationViewController.h
//  MyLocationMap
//
//  Created by David Barron on 4/30/14.
//  Copyright (c) 2014 David Barron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "PinAnnotation.h"

@interface MyLocationViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>



@property (nonatomic, strong) IBOutlet MKMapView *mapView;

- (void)addGestureRecogniserToMapView;
- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer;


@end


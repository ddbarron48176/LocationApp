//
//  PinAnnotation.h
//  MyLocationMap
//
//  Created by David Barron on 5/1/14.
//  Copyright (c) 2014 David Barron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PinAnnotation : NSObject <MKAnnotation>{

NSString *title;
NSString *subtitle;
CLLocationCoordinate2D coordinate;


}

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (retain, nonatomic) UIView *rightCalloutAccessoryView;

@end

//
//  MyLocationViewController.m
//  MyLocationMap
//
//  Created by David Barron on 4/30/14.
//  Copyright (c) 2014 David Barron. All rights reserved.
//

#import "MyLocationViewController.h"

@interface MyLocationViewController ()

@end

@implementation MyLocationViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mapView.delegate = self;
    [self addGestureRecogniserToMapView];
}
- (void)addGestureRecogniserToMapView{
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(addPinToMap:)];
    lpgr.minimumPressDuration = 0.5; //
    [self.mapView addGestureRecognizer:lpgr];
    
}

- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    PinAnnotation *toAdd = [[PinAnnotation alloc]init];
    
    toAdd.coordinate = touchMapCoordinate;
    toAdd.subtitle = @"Rating";
    toAdd.title = @"Bathroom Used";
   
    
    [self.mapView addAnnotation:toAdd];
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)amapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[PinAnnotation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[amapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc]
                              initWithAnnotation:annotation
                              reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        // Create a UIButton object to add on the
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [annotationView setRightCalloutAccessoryView:rightButton];
        
        
        return annotationView;
    }
    
    return nil;
}
- (void)mapView:(MKMapView *)mapView
 annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    if ([(UIButton*)control buttonType] == UIButtonTypeDetailDisclosure){
        
        // Do your thing when the detailDisclosureButton is touched
        UIViewController *mapDetailViewController = [[UIViewController alloc] init];
        [[self navigationController] pushViewController:mapDetailViewController animated:YES];
        
    } else if([(UIButton*)control buttonType] == UIButtonTypeInfoDark) {
        // Do your thing when the infoDarkButton is touched
        
        NSLog(@"infoDarkButton for longitude: %f and latitude: %f",
              [(PinAnnotation*)[view annotation] coordinate].longitude,
              [(PinAnnotation*)[view annotation] coordinate].latitude);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

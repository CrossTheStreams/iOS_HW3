//
//  ViewController.m
//  UW_iOS_HW3_arhautau
//
//  Created by Andrew Hautau on 4/27/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSDictionary *forecastDictionary;

@end

@implementation ViewController

- (void)viewDidLoad {

    [self forecast];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDictionary*) forecast {
    if (![self forecastDictionary]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"WeatherData" ofType:@"plist"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *plistArray = [[NSArray alloc] initWithContentsOfFile:path];
        [self setForecastDictionary: [plistArray firstObject]];
        NSLog(@"%@", [self forecastDictionary]);
    }
    return [self forecastDictionary];
}

-(NSString*) city {
    return [[self forecast] objectForKey: @"City"];
}

-(NSArray*) hourlyForecast {
    return [[self forecast] objectForKey: @"HourlyForecast"];
}

-(NSString*) sunrise {
    return [[self forecast] objectForKey: @"Sunrise"];
}

-(NSString*) sunset {
    return [[self forecast] objectForKey: @"Sunset"];
}

@end

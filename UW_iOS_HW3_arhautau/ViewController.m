//
//  ViewController.m
//  UW_iOS_HW3_arhautau
//
//  Created by Andrew Hautau on 4/27/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTemperatureLabel;
@property (strong, nonatomic) NSDictionary *forecastDictionary;

@property (weak, nonatomic) IBOutlet UILabel *firstHourLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondHourLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdHourLabel;

@property (weak, nonatomic) IBOutlet UILabel *firstTemperature;
@property (weak, nonatomic) IBOutlet UILabel *secondTemperature;
@property (weak, nonatomic) IBOutlet UILabel *thirdTemperature;

@property (weak, nonatomic) IBOutlet UILabel *sunriseLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLabel;

@property (weak, nonatomic) IBOutlet UILabel *sunriseTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetTimeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[self cityLabel] setText: [self city]];
    
    [[self currentTemperatureLabel] setText: [self temperatureForHour:9]];

    [[self firstHourLabel] setText: @"8 AM"];
    [[self secondHourLabel] setText: @"9 AM"];
    [[self thirdHourLabel] setText: @"10 AM"];
    
    [[self firstTemperature] setText: [self temperatureForHour:10]];
    [[self secondTemperature] setText: [self temperatureForHour:11]];
    [[self thirdTemperature] setText: [self temperatureForHour:12]];
    
    [[self sunriseTimeLabel] setText: [self sunriseTime]];
    [[self sunsetTimeLabel] setText: [self sunsetTime]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDictionary*) forecast {
    if (![self forecastDictionary]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"WeatherData" ofType:@"plist"];
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

-(NSString*) temperatureForHour:(NSUInteger) hourIndex {
    NSArray *forecast = [self hourlyForecast];
    NSNumber *temperature = [forecast objectAtIndex: hourIndex];
    NSString *stringTemperature = [NSString stringWithFormat:@"%@", temperature];
    
    return stringTemperature;
}

-(NSString*) sunriseTime {
    return [[self forecast] objectForKey: @"Sunrise"];
}

-(NSString*) sunsetTime {
    return [[self forecast] objectForKey: @"Sunset"];
}

@end

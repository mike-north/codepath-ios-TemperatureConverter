//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Mike North on 1/11/14.
//  Copyright (c) 2014 Mike North. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *farenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;

// Which of the two temperature fields was last edited? true=farenheit, false=celsius
@property (nonatomic) bool farenheitEditingInProgress;

- (IBAction)convertButtonClicked:(id)sender;

// Attach to "Editing did begin" event for each field, so we can tell which
// we should read the temperature from, and which to update

- (IBAction)farenheitEditingBegan:(id)sender;
- (IBAction)celsiusEditingBegan:(id)sender;

@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Window title
        self.title = @"Temperature";
        
        // We have to pick a side here. Unless user taps on the celsius text
        // field, we'll assume that farenheit is converted into ceisius
        self.farenheitEditingInProgress = true;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initial values for each temperature field are equivalent
    float initialTemperature = 72.0;
    
    self.farenheitTextField.text = [NSString stringWithFormat:@"%0.1f", initialTemperature];
    self.celsiusTextField.text = [NSString stringWithFormat:@"%0.1f", (initialTemperature - 32.0) * (5.0/9.0)];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertButtonClicked:(id)sender {
    if (self.farenheitEditingInProgress) {
        
        // Farenheit temperature used to update celsius
        float temperatureValue = ([self.farenheitTextField.text floatValue] - 32.0) * (5.0/9.0);
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.1f", temperatureValue];
    }
    else {
        
        // Celsius temperature used to update farenheit
        float temperatureValue = ([self.celsiusTextField.text floatValue] * 1.8) + 32.0;
        self.farenheitTextField.text = [NSString stringWithFormat:@"%0.1f", temperatureValue];
    }
    
}

- (IBAction)farenheitEditingBegan:(id)sender {
    self.farenheitEditingInProgress = true;
}

- (IBAction)celsiusEditingBegan:(id)sender {
    self.farenheitEditingInProgress = false;
}
@end

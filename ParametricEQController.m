

#import "ParametricEQController.h"

const float FcArray[58] = {28.0, 31.0, 35.0, 40.0, 45.0, 50.0, 56.0, 63.0, 70.0, 80.0, 90.0, 100.0, 112.0, 125.0, 141.0, 160.0, 180.0, 200.0, 225.0, 250.0, 280.0, 315.0, 350.0, 400.0, 450.0, 500.0, 560.0, 630.0, 700.0, 800.0, 900.0, 1000.0, 1120.0, 1250.0, 1400.0, 1600.0, 1800.0, 2000.0, 2250.0, 2500.0, 2800.0, 3150.0, 3500.0, 4000.0, 4500.0, 5000.0, 5600.0, 6300.0, 7000.0, 8000.0, 9000.0, 10000.0, 11200.0, 12500.0, 14100.0, 16000.0, 18000.0, 20000.0};

const float QArray[16] = {0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.2, 1.4, 2.0, 2.5, 3.0, 4.0, 5.0, 6.5, 8.0};


@interface ParametricEQController ()

@end

@implementation ParametricEQController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(id)del tag:(int)theTag
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    delegate = [del retain];
    
    tag = theTag;
    
    return self;
}

- (int)tag
{
    return tag;
}

- (IBAction)gainSlider_moved:(id)sender
{
    float Gdb = [sender floatValue];
    
    NSString *str = [NSString stringWithFormat:@"%4.1fdB", Gdb];
    
    [gainField setStringValue:str];
    
    [delegate bellGainSliderMoved:Gdb whichFilter:tag];
}


- (IBAction)QSlider_moved:(id)sender
{
    float Q = QArray[[sender intValue]];
    
    NSString *str = [NSString stringWithFormat:@"%4.1f", Q];
    
    [QField setStringValue:str];
    
    [delegate bellQSliderMoved:Q whichFilter:tag];
}

- (IBAction)FcSlider_moved:(id)sender
{
    float Fc = FcArray[[sender intValue]];
    
    NSString *str = [NSString stringWithFormat:@"%iHz", (int)Fc];
    
    [FcField setStringValue:str];
    
    [delegate bellFcSliderMoved:Fc whichFilter:tag];
}

- (void)setGain:(int)gIndex Q:(int)QIndex Fc:(int)FcIndex
{
    [gainSlider setIntValue:gIndex];
    
    [FcSlider setIntValue:FcIndex];
    
    [QSlider setIntValue:QIndex];
    
    [self FcSlider_moved:FcSlider];
    
    [self gainSlider_moved:gainSlider];
    
    [self QSlider_moved:QSlider];
}



- (void)setDelegate:(id)sender
{
    delegate = [sender retain];
}


@end



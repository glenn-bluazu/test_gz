//
//  ParametricEQController.h
//  Compressor
//
//  Created by Glenn Zelniker on 10/28/16.
//
//

#import <Cocoa/Cocoa.h>

@interface ParametricEQController : NSViewController
{

    IBOutlet NSSlider *gainSlider;
    IBOutlet NSTextField *gainField;
    IBOutlet NSSlider *QSlider;
    IBOutlet NSTextField *QField;
    IBOutlet NSSlider *FcSlider;
    IBOutlet NSTextField *FcField;
    id delegate;
    int tag;

}

- (IBAction)gainSlider_moved:(id)sender;
- (IBAction)QSlider_moved:(id)sender;
- (IBAction)FcSlider_moved:(id)sender;

- (int)tag;
- (void)setGain:(int)gIndex Q:(int)QIndex Fc:(int)FcIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(id)del tag:(int)theTag;

@end

@interface NSObject (ParametricEQControllerDelegate)

- (void)bellGainSliderMoved:(float)Gdb whichFilter:(int)filterNumber;
- (void)bellQSliderMoved:(float)Q whichFilter:(int)filterNumber;
- (void)bellFcSliderMoved:(float)Q whichFilter:(int)filterNumber;

@end
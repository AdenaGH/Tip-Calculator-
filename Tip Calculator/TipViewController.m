//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Adena Rowana Ninvalle on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentagesControl;
@property (weak, nonatomic) IBOutlet UIView *labelsView;
@property (weak, nonatomic) IBOutlet UITextField *customTipField;

@end

@implementation TipViewController

- (void)viewDidLoad {
    self.customTipField.alpha = 0;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    //NSLog(@"Hello World!");
    
    [self.view endEditing:(true)];
}
- (IBAction)updateLabels:(id)sender {
    self.customTipField.alpha = 0;
    if (self.billField.text.length== 0) {
        [self hideLabels];
    } else {
        [self showLabels];
    }
    //Custom tips
    if (self.tipPercentagesControl.selectedSegmentIndex == 3) {
        [self customTip];
    //All other tips
    } else {
        
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentagesControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", total];
}
}

- (void)hideLabels {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect labelsFrame = self.labelsView.frame;
        labelsFrame.origin.y += 150;
        self.labelsView.frame = labelsFrame;
        
       // self.labelsView.alpha = 0;
    }];
    
}

- (void)showLabels {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect labelsFrame = self.labelsView.frame;
        labelsFrame.origin.y = 150;
        self.labelsView.frame = labelsFrame;
        
       // self.labelsView.alpha = 0;
    }];
}
- (void)customTip {
    self.customTipField.alpha = 1;
    double bill = [self.billField.text doubleValue];
    double customTip = [self.customTipField.text doubleValue]/100 * bill;
    //printf("%f", customTip );
    double tip = customTip;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", total];
    [self showLabels];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

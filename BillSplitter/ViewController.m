//
//  ViewController.m
//  BillSplitter
//
//  Created by JIAN WANG on 5/16/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *totalAmountTextField;
@property (strong, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (strong, nonatomic) IBOutlet UILabel *billForEachLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (assign, nonatomic) float amountInput;
@property (assign, nonatomic) int numberofPeople;
@property (strong, nonatomic) NSNumberFormatter *nf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.numberOfPeopleSlider addTarget:self action:@selector(getNumberOfPeople:) forControlEvents:UIControlEventValueChanged];
    
    self.totalAmountTextField.delegate = self;
    [self.totalAmountTextField becomeFirstResponder];
    
    self.nf = [[NSNumberFormatter alloc] init];
    self.nf.numberStyle = NSNumberFormatterCurrencyStyle;
    self.nf.maximumFractionDigits = 2;
    
    self.numberofPeople = 2;
}

- (IBAction)calculateSplitAmountButtonPressed:(UIButton *)sender {
    [self.totalAmountTextField resignFirstResponder];
    
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d", self.numberofPeople];
    
    self.billForEachLabel.text = [self.nf stringFromNumber: [NSDecimalNumber numberWithFloat:self.amountInput/self.numberofPeople]];
}

-(IBAction)getNumberOfPeople:(UISlider *)sender {
    [self.totalAmountTextField resignFirstResponder];
    
    self.numberofPeople = sender.value;
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d", self.numberofPeople];
    
    self.billForEachLabel.text = [self.nf stringFromNumber: [NSDecimalNumber numberWithFloat:self.amountInput/self.numberofPeople]];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    self.amountInput = [self.totalAmountTextField.text floatValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

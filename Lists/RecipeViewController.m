//
//  RecipeViewController.m
//  Lists
//
//  Created by Sam Meech-Ward on 2017-06-13.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "RecipeViewController.h"

@interface RecipeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView.text = [NSString stringWithFormat:@"Recipe: %li", self.recipeIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)setRecipeIndex:(NSInteger)recipeIndex {
//    _recipeIndex = recipeIndex;
//    self.textView.text = [NSString stringWithFormat:@"Recipe: %li", self.recipeIndex];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

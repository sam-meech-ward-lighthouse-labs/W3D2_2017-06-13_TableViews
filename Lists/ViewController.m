//
//  ViewController.m
//  Lists
//
//  Created by Sam Meech-Ward on 2017-06-13.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "ViewController.h"
#import "FoodTableViewCell.h"
#import "RecipeViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *foods;
@property (nonatomic, strong) NSArray *drinks;
@property (nonatomic, strong) NSIndexPath *currentlySelectedIndexPath;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.foods = [NSMutableArray arrayWithArray:@[@"Pizza", @"Cheese Burger", @"Pasta", @"Fish and Chips", @"Curry", @"Sushi"]];
    
    self.drinks = @[@"Orange Juice", @"Tea", @"Water"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.foods.count;
    }
    if (section == 1) {
        return self.drinks.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Setup our cell and hand it to the table view
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
    
    NSString *title;
    if (indexPath.section == 0) {
        title = self.foods[indexPath.row];
    } else if (indexPath.section == 1) {
        title = self.drinks[indexPath.row];
    }
    
    cell.foodLabel.text = title;
    cell.foodImageView.image = [UIImage imageNamed:@"food"];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    if (indexPath.row == 0 && indexPath.section == 0) {
        return NO;
    }
    if (indexPath.section == 1) {
        return NO;
    }
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        if (indexPath.section == 0) {
            [self.foods removeObjectAtIndex:indexPath.row];
        } else if (indexPath.section == 0) {
//            [self.drinks removeObjectAtIndex:indexPath.row];
        }
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Table view cell tapped at row: %li", (long)indexPath.row);
    self.currentlySelectedIndexPath = indexPath;
    
    [self performSegueWithIdentifier:@"ShowRecipeViewController" sender:self];
    
    // Needs refactoring for drinks
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowRecipeViewController"]) {
        RecipeViewController *recipeViewController = segue.destinationViewController;
        
        recipeViewController.recipeIndex = self.currentlySelectedIndexPath.row;
    }
}

#pragma mark - Actions

- (IBAction)addNewFood:(id)sender {
    
    NSString *newFood = [NSString stringWithFormat:@"Food %li", self.foods.count];
    [self.foods addObject:newFood];
    
    [self.tableView reloadData];
}


@end

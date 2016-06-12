//
//  PATodoListViewController.m
//  todo
//
//  Created by Cadet on 6/11/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

// Controller
#import "PATodoListViewController.h"
#import "PADetailViewController.h"
#import "PAComposerViewController.h"

// Model
#import "PATodo.h"

@interface PATodoListViewController () <UITableViewDataSource, UITableViewDelegate, PAComposerDelegate, PADetailDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *todoList;
- (IBAction)addBarButtonClick:(id)sender;

@end

@implementation PATodoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Todo List";
    
    // Setup Data
    self.todoList = [[NSMutableArray alloc] init];
    for (int i = 0; i <10; i++) {
        NSString *title = [NSString stringWithFormat:@"My Todo %d",i];
        
        PATodo *todo =[[PATodo alloc] initWithTitle:title];
        [self.todoList addObject:todo];
    }
    
    
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.todoList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"TodoCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //config cell
    PATodo *todo = self.todoList[indexPath.row];
    cell.textLabel.text = todo.title;
    
    if (todo.isDone) {
        cell.textLabel.textColor = [UIColor grayColor];
    } else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];


    PATodo *todo = self.todoList[indexPath.row];

    
    PADetailViewController *detailVC = [[PADetailViewController alloc] initWithNibName:@"PADetailViewController" bundle:nil];
    
    detailVC.todo = todo;
    detailVC.delegate = self;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (IBAction)addBarButtonClick:(id)sender {
    PAComposerViewController *composerVC = [[PAComposerViewController alloc] initWithNibName:@"PAComposerViewController" bundle:nil];
    
    composerVC.delegate = self;
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:composerVC];
    
    [self presentViewController: navC animated: YES completion:nil];
}

#pragma mark - PAComposerDelegate
- (void)composer:(PAComposerViewController *)composerVC didCreateTodo:(PATodo *)todo {
    [self.todoList addObject:todo];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - PADetailDelegate
- (void) detailView:(PADetailViewController *)detailVC didDeleteTodo:(PATodo *)todo {
    [self.todoList removeObject:todo];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

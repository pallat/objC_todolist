//
//  PATodoListViewController.m
//  todo
//
//  Created by Cadet on 6/11/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import "PATodoListViewController.h"
#import "PATodo.h"

@interface PATodoListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *todoList;

@end

@implementation PATodoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    [todo toggleDone];
    
    [self.tableView reloadData];
}


@end

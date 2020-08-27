//
//  ViewController.m
//  tableViewTree
//
//  Created by 孙国立 on 2020/8/27.
//  Copyright © 2020 孙国立. All rights reserved.
//

#import "ViewController.h"
#import "LiModel.h"
#import "cell1.h"
#import "cell2.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView * tableView;
@property (nonatomic , strong) NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self.view addSubview:self.tableView];
}

- (void)setData{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        LiModel *model = [[LiModel alloc] init];
        model.index = [[NSString alloc] initWithFormat:@"%d",i];
        model.isOpen = NO;
        model.isMain = YES;
        NSMutableArray *chArray = [[NSMutableArray alloc] init];
        for (int k = 0; k < 3; k++) {
            LiModel *model1 = [[LiModel alloc] init];
            model1.index = [[NSString alloc] initWithFormat:@"%d-%d",i,k];
            model1.isOpen = NO;
            [chArray addObject:model1];
        }
        model.chArray = chArray;
        [dataArray addObject:model];
    }
    self.dataArray = dataArray;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor redColor];
    }
    return _tableView;
}

#pragma mark tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LiModel *model = self.dataArray[indexPath.row];
    if (model.isMain) {
        cell1 * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (cell == nil) {
            cell = [[cell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        cell.title.text = model.index;
        return cell;
    }else{
        cell2 * cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (cell == nil) {
            cell = [[cell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        cell.title.text = model.index;
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LiModel *model = self.dataArray[indexPath.row];
    model.isOpen = !model.isOpen;
    if (model.isOpen) {
        for (int i = 0 ; i < model.chArray.count; i++) {
            [self.dataArray insertObject:model.chArray[i] atIndex:indexPath.row + 1 + i];
        }
    }else{
        for (int i = 0 ; i < model.chArray.count; i++) {
            [self.dataArray removeObjectAtIndex:indexPath.row + 1];
        }
    }
    [self.tableView reloadData];
}


@end

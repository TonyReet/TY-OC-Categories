//
//  ViewController.m
//  TY-OC-Categories
//
//  Created by tonyreet on 2020/11/19.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic , copy) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupData];
    [self setupUI];
}

- (void)setupUI{
    //设置tableView
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
}

- (void)setupData{
    self.dataSource = @[
                        @{@"DeepCopyViewController":@"array,dict深层复制"},
                        @{@"RecursiveModifyDataViewController":@"递归修改dict的数据"}
                       ];
}

#pragma mark - delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger indexRow = indexPath.row;
    UIViewController *vc = [NSClassFromString([(NSDictionary *)self.dataSource[indexRow] allKeys].firstObject) new];
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *MyIdentifierID = @"ViewController_Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifierID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifierID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [(NSDictionary *)self.dataSource[indexPath.row] allValues].firstObject;
    return cell;
}


@end

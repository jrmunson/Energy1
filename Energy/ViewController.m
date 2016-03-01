//
//  ViewController.m
//  Energy
//
//  Created by Jim on 2/26/16.
//  Copyright © 2016 Jim. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "PeopleTableViewCell.h"


@interface ViewController ()

    @property NSMutableArray *objects;
    @property (nonatomic, strong) NSString *jsonUrl;
    @property (nonatomic, strong) NSDictionary *jsonDict;
    @property (nonatomic,retain) UIAlertController *alert;
    @property (nonatomic,retain) UIAlertAction *ok;
    @property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

    @property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItemBtn;
  
@end


@implementation ViewController

  
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
//    [_btnFaceBook setImage:[UIImage imageNamed:@"facebookicon32.png"] forState:UIControlStateNormal];
//    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    
 //   [self reloadData];
    
    ////////////////////////////////////////////////////////////////////////////////////////////
}

- (void)viewWillAppear:(BOOL)animated {
//    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    
    self.objects = nil;
    _objects = [[NSMutableArray alloc]init];
    
    //    _jsonUrl = @"https://s3-us-west-2.amazonaws.com/wirestorm/assets/response.json";
    //    [self loadDataUsingNSURLSession];
    ////////////////////////////////////////////////////////////////////////////////////////////
    // no working server yet, so fabricate data
    // multiple people objects are needed because the object is just a pointer. This will disappear
    // when we get a NSData object
    
    People *people = [[People alloc]init];
    People *people1 = [[People alloc]init];
    People *people2 = [[People alloc]init];
    People *people3 = [[People alloc]init];
    People *people4 = [[People alloc]init];
    People *people5 = [[People alloc]init];
    
    people.quoteTxt = @" I don't know, not having been there and not seeing all the facts, what role race played...the Cambridge police acted stupidly in arresting somebody when there was already proof that they were in their own home - Jul 22, 2009";
    people.recordingUrlTxt = @"/policeactedstupidly.mp3";
   [self.objects addObject:people];
 
    
    people1.quoteTxt = @"I think when you spread the wealth around, it's good for everybody - Oct 14, 2008";
    people1.recordingUrlTxt = @"/spreadwealthjoeplumber.mp3";
    [self.objects addObject:people1];
 
    
    people2.quoteTxt = @"Under my plan of a cap and trade system, electricity rates would necessarily skyrocket - Mar 18 2009";
    people2.recordingUrlTxt = @"/electricityskyrocket.mp3";
    [_objects addObject:people2];
    
    people3.quoteTxt = @"The real question is, Will this country be better off four years from now? - Oct 27, 2008";
    people3.recordingUrlTxt = @"/better4yearsfromnow.mp3";
    [_objects addObject:people3];
    
    people4.quoteTxt = @"I don't think they're better off than they were four years ago - Oct 3, 2011";
    people4.recordingUrlTxt = @"/notbetter4yearsago.mp3";
    [_objects addObject:people4];
    
    people5.quoteTxt = @"We are 5 days away from fundamentally transforming the United States of America - Oct 30, 2008";
    people5.recordingUrlTxt = @"/5daystotransform.mp3";
    [_objects addObject:people5];

    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
}
-(void)buttonDoThis:(UIBarButtonItem *)sender
{
    [self noData];
}

-(void)noData{
    // show error alert
    _alert=   [UIAlertController
               alertControllerWithTitle:@"No Data"
               message:@"No data returned from server for these parameters."
               preferredStyle:UIAlertControllerStyleAlert];
    
    _ok = [UIAlertAction
           actionWithTitle:@"OK"
           style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action)
           {
               [_alert dismissViewControllerAnimated:YES completion:nil];
               
           }];
    [_alert addAction:_ok];
    [self presentViewController:_alert animated:YES completion:nil];
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    self.tableView.frame = CGRectMake(0, 0, 340, 500);
    return 80;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    PeopleTableViewCell *cell = (PeopleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[PeopleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.rightSmallImageView.image = [UIImage imageNamed:@"play32.png"];
    People *people = self.objects[indexPath.row];
    cell.quoteLabel.text = people.quoteTxt;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self noData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



@end

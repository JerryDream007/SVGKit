//
//  RootViewController.m
//  SVGPad
//
//  Copyright Matt Rajca 2010-2011. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "UIView+Utility.h"

@interface MasterViewController()
@property(nonatomic,strong) NSString* nameOfBrokenSVGToLoad;

@property(nonatomic,strong) UIImageView *imageView1;
@property(nonatomic,strong) UIImageView *imageView2;
@property(nonatomic,strong) UIImageView *imageView3;
@property(nonatomic,strong) UIImageView *imageView4;
@property(nonatomic,strong) UIImageView *imageView5;
@property(nonatomic,strong) UIImageView *imageView6;
@property(nonatomic,strong) UIImageView *imageView7;
@property(nonatomic,strong) UIImageView *imageView8;
@property(nonatomic,strong) UIImageView *imageView9;

@end

@implementation MasterViewController

@synthesize sampleNames = _sampleNames;
@synthesize detailViewController = _detailViewController;
@synthesize nameOfBrokenSVGToLoad = _nameOfBrokenSVGToLoad;

- (void)setupSampleNames
{
    self.sampleNames = [NSMutableArray arrayWithObjects: @"map-alaska-onlysimple", @"g-element-applies-rotation", @"groups-and-layers-test", @"http://upload.wikimedia.org/wikipedia/commons/f/f9/BlankMap-Africa.svg", @"shapes", @"strokes", @"transformations", @"rounded-rects", @"gradients",@"radialGradientTest", @"PreserveAspectRatio", @"australia_states_blank", @"Reinel_compass_rose", @"Monkey", @"Blank_Map-Africa", @"opacity01", @"Note", @"Note@2x", @"heart", @"M-to-S-to-T", @"imageWithASinglePointPath", @"Lion", @"lingrad01", @"Map", @"CurvedDiamond", @"Text", @"text01", @"tspan01", @"Location_European_nation_states", @"uk-only", @"Europe_states_reduced", @"Compass_rose_pale", @"quad01", @"cubic01", @"rotated-and-skewed-text", @"RainbowWing", @"sakamura-default-fill-opacity-test", @"StyleAttribute", @"voies", @"nil-demo-layered-imageview", @"svg-with-explicit-width", @"svg-with-explicit-width-large", @"svg-with-explicit-width-large@160x240", @"BlankMap-World6-Equirectangular", @"Coins", @"parent-clip", @"CSS", @"imagetag-layered", @"ImageAspectRatio", @"test-stroke-dash-array", @"radial-gradient-opacity", @"radgrad01", @"pattern01", @"Mozilla_Firefox_logo_2013",
                        
        // This file is still not fully supported, arc to is missing, but it has the evenodd in it
        @"fillrule-evenodd",
                        nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self setupSampleNames];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self setupSampleNames];
	}
	return self;
}


- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.clearsSelectionOnViewWillAppear = NO;
	self.preferredContentSize = CGSizeMake(320.0f, 600.0f);
    
    //    NSString *urlString = @"https://raw.githubusercontent.com/Hxmic/cdn/master/badge.svg";
    NSString *urlString = @"https://s.qunarzz.com/test_color_hello/font/0.0.5/9106_yo-niujiaodayieb09-f.svg";
    [self testSVGImage:urlString];
    [self testTextField];

}

- (void)testTextField{
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor redColor];
    textField.delegate = self;
    textField.size = CGSizeMake(350, 50);
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.centerX = self.view.centerX;
    textField.top = 100;
    textField.placeholder = @"请输入SVG图片的地址，并点击回车按钮";
    textField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self testSVGImage:textField.text];
    return YES;
}

- (void)testSVGImage:(NSString *)urlString{
    [self testSVGImage1:urlString];
    [self testSVGImage2:urlString];
    [self testSVGImage3:urlString];
    [self testSVGImage4:urlString];
    [self testSVGImage5:urlString];
    [self testSVGImage6:urlString];
    [self testSVGImage7:urlString];
    [self testSVGImage8:urlString];
    [self testSVGImage9:urlString];
}

- (void)testSVGImage1:(NSString *)urlString{
    if (self.imageView1 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.top = 155;
        imageView.centerX = self.view.centerX - 130;
        imageView.clipsToBounds = YES;
        [self.view addSubview:imageView];
        self.imageView1 = imageView;
    }
    self.imageView1.contentMode = UIViewContentModeScaleToFill;
//    [self.imageView1 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView1.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage2:(NSString *)urlString{
    if (self.imageView2 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.clipsToBounds = YES;
        imageView.top = 155;
        imageView.centerX = self.view.centerX;
        [self.view addSubview:imageView];
        self.imageView2 = imageView;
    }
    self.imageView2.contentMode = UIViewContentModeScaleAspectFit;
//    [self.imageView2 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView2.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage3:(NSString *)urlString{
    if (self.imageView3 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.top = 155;
        imageView.centerX = self.view.centerX + 130;
        imageView.clipsToBounds = YES;
        [self.view addSubview:imageView];
        self.imageView3 = imageView;
    }
    self.imageView3.contentMode = UIViewContentModeScaleAspectFill;
//    [self.imageView3 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView3.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage4:(NSString *)urlString{
    if (self.imageView4 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.top = 260;
        imageView.centerX = self.view.centerX - 130;
        imageView.clipsToBounds = YES;
        [self.view addSubview:imageView];
        self.imageView4 = imageView;
    }
    self.imageView4.layer.borderWidth = 20;
    self.imageView4.layer.borderColor = UIColor.orangeColor.CGColor;
//    [self.imageView4 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView4.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage5:(NSString *)urlString{
    if (self.imageView5 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.clipsToBounds = YES;
        imageView.top = 260;
        imageView.centerX = self.view.centerX;
        [self.view addSubview:imageView];
        self.imageView5 = imageView;
    }
    self.imageView5.layer.cornerRadius = 50;
//    [self.imageView5 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView5.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage6:(NSString *)urlString{
    if (self.imageView6 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.top = 260;
        imageView.centerX = self.view.centerX + 130;
        imageView.clipsToBounds = YES;
        [self.view addSubview:imageView];
        self.imageView6 = imageView;
    }
    self.imageView6.layer.opacity = 0.2;
//    [self.imageView6 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView6.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage7:(NSString *)urlString{
    if (self.imageView7 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.top = 365;
        imageView.centerX = self.view.centerX - 130;
        imageView.clipsToBounds = YES;
        [self.view addSubview:imageView];
        self.imageView7 = imageView;
    }
    //shinobiHead = shinobiHead?.imageWithRenderingMode(.AlwaysTemplate)
    self.imageView7.tintColor = UIColor.blueColor;
//    @weakify(self)
//    [self.imageView7 setImageWithURL: urlString placeHolderImage:nil completion:^(UIImage *image, NSString *imageURL, QWImageCacheType cacheType) {
//        @strongify(self)
//        image = [image imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
//        self.imageView7.image = image;
//    }];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView7.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage8:(NSString *)urlString{
    if (self.imageView8 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.top = 365;
        imageView.centerX = self.view.centerX;
        [self.view addSubview:imageView];
        self.imageView8 = imageView;
    }
    self.imageView8.layer.shadowColor = UIColor.brownColor.CGColor;
        // 阴影偏移，默认(0, -3)
//    self.imageView8.layer.shadowOffset = CGSizeMake(10,-10);
        // 阴影透明度，默认0
    self.imageView8.layer.shadowOpacity = 1.0;
        // 阴影半径，默认3
    self.imageView8.layer.shadowRadius = 20;

//    [self.imageView8 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView8.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}

- (void)testSVGImage9:(NSString *)urlString{
    if (self.imageView9 == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = UIColor.redColor;
        imageView.size = CGSizeMake(100, 100);
        imageView.top = 365;
        imageView.centerX = self.view.centerX + 130;
        imageView.clipsToBounds = YES;
        [self.view addSubview:imageView];
        self.imageView9 = imageView;
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = CGRectMake(0, 0, imageView.frame.size.width * 0.5, imageView.frame.size.height);
        
        [imageView addSubview:effectView];
    }
    
//    [self.imageView9 setImageWithURL: urlString];
    SVGKImage *svgImage = [SVGKImage imageWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView9.image = [SVGKExporterUIImage exportAsUIImage:svgImage];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	return [_sampleNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:CellIdentifier];
	}
	
	cell.textLabel.text = [_sampleNames objectAtIndex:indexPath.row];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if( [[_sampleNames objectAtIndex:indexPath.row] isEqualToString:@"Reinel_compass_rose"])
	{
		NSLog(@"*****************\n*   WARNING\n*\n* The sample 'Reinel_compass_rose' is currently unsupported;\n* it is included in this build so that people working on it can test it and see if it works yet\n*\n*\n*****************");
		
		[[[UIAlertView alloc] initWithTitle:@"WARNING" message:@"Reinel_compass_rose breaks SVGKit, it uses unsupported SVG commands; until we have added support for those commands, it's here as a test - but it WILL CRASH if you try to view it" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK, crash",nil] show];
		
		self.nameOfBrokenSVGToLoad = [_sampleNames objectAtIndex:indexPath.row];
		
		return;
	}
	
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    if (!self.detailViewController) {
	        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"iPhoneDetailViewController" bundle:nil];
	    }
	    [self.navigationController pushViewController:self.detailViewController animated:YES];
		self.detailViewController.detailItem = [_sampleNames objectAtIndex:indexPath.row];
    } else {
        self.detailViewController.detailItem = [_sampleNames objectAtIndex:indexPath.row];
    }
}

#pragma mark - alertview delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if( buttonIndex == [alertView cancelButtonIndex] )
	{
		return;
	}
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    if (!self.detailViewController) {
	        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"iPhoneDetailViewController" bundle:nil];
	    }
	    [self.navigationController pushViewController:self.detailViewController animated:YES];
		self.detailViewController.detailItem = self.nameOfBrokenSVGToLoad;
    } else {
        self.detailViewController.detailItem = self.nameOfBrokenSVGToLoad;
    }
	
	self.nameOfBrokenSVGToLoad = nil;
}

@end

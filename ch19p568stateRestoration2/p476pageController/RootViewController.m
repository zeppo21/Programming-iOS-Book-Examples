

#import "RootViewController.h"
#import "Pep.h"

@interface RootViewController () <UIViewControllerRestoration>
@property (nonatomic, strong) NSArray* pep;
@end

@implementation RootViewController

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)ic
                                                            coder:(NSCoder *)coder {
    NSLog(@"rvc %@", ic);
    UIViewController* result = nil;
    NSString* id = [ic lastObject];
    if ([id isEqualToString:@"root"]) {
        // return the *existing* rvc
        result = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    }
    return result;
}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"rvc encode");
    // nothing to do
    [super encodeRestorableStateWithCoder:coder];
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"rvc decode");
    // nothing to do
    [super decodeRestorableStateWithCoder:coder];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self->_pep = @[@"Manny", @"Moe", @"Jack"];
        self.restorationIdentifier = @"root";
        self.restorationClass = [self class]; //
    }
    return self;
}

- (IBAction)doButton:(id)sender {
    NSInteger tag = [(UIButton*)sender tag];
    NSString* whichPep = self.pep[tag-1];
    Pep* onePep = [[Pep alloc] initWithPepBoy:whichPep nib:nil bundle:nil];
    [self presentViewController:onePep animated:YES completion:nil];
}


@end

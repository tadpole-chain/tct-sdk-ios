         The TCT SDK quickly accesses the document
1. Download the Dome
  1. Open dome with Xcode
2. Import TCTSDK
     3. Configure the SDK 
  

 Add –Objc and -all_load in Other Linker Flags 
 
     4. To initialize the SDK
      

Import the #import <TCTSDK / TCTSDK.h> header file in the UnityAppController.mm file
Initialize the SDK in the - (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions method
 
Replace your own appkey and SecretKey


5 Method introduction

Register SDK
/**
 *  Register SDK
 *  @param appKey appKey corresponds to the appkey assigned by the management background
  *  @param online online Whether to use online address, YES is to use NO not to use
 */

-(void)registerAppKey:(NSString*)appKey appSecretKey:(NSString*)secretKey withOnline:(BOOL)online
 
 Login method (login) 
  Called with [[TCTSDK sharedInstance] login] 
 
  Get advertising information (requestadvert)    
 Called with [[TCTSDK sharedInstance] requestadvert]
 
  online
  - (void)online;

  Record game score score score
  - (void)requestGameScore:(float)score;

 Record game data key request parameter score value
 - (void)requestGameDataKey:(NSString *)key withSoce:(float)score;

   Invitation code verification verify invitation code
  - (void)requestGameVerify:(NSInteger)verify;
 
   Custom ad str content type fixed value please pass 2
  - (void)diversionsAction:(NSString *)str withType:(NSInteger)type;
 
   Offline
   - (void)loginOut;

   Successful login callback  
 loginSuccessBlock       
  Use [TCTSDK sharedInstance].loginSuccessBlock = ^{
          Successful operation
        }; 
 Online callback
onLineSuccessBlock
 
  Get avatar, id, and name, both can be obtained directly after two successful callbacks
  [TCTSDK sharedInstance].idStr
  [TCTSDK sharedInstance].nickname
  [TCTSDK sharedInstance].avatar

/**
 
In-game consumption
*    In-game consumption
 *    @param amount  amount Amount
 *    @param content  content  Contents such as: "Recharge 400 diamonds, consume 0.8 yuan"
 */

- (void)requestGamePayAmount:(float)amount withontent:(NSString *)content complete:(payResultsBlock)resultsHandler;


2. Interact with Unity：
Define a .mm file
Use c to write the method corresponding to the Unity file, and then pass the value according to the corresponding parameter, you can call the oc method in the method.
Declaring methods in Unity
 
Use the figure in Unity
 



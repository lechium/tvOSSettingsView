# tvOSSettingsView
Basic settings style view for tvOS

I couldn't find a single example or tutorial online for what should have been a VERY basic view to create (It was SUPER easy on prior AppleTV's all the way up to tvOS). This should get you started on making a basic view like this.

This class MUST be used inside a navigation controller or the formatting will be completely destroyed! Check inside AppDelegate application:didFinishLaunchingWithOptions: for example usage.


Black background

![alt text](Settings_Black.png "Black Background")

Clear background

![alt text](Settings_View_Clear.png "Clear Background")


Notes:

The anatomy/hierarchy of this view is cumbersome and ugly but as far as I know, unavoidable, initially I tried to create it with Apple's UISplitViewController but it is impossible to remove the "gutter" without private methods / ivars and that looked terrible with a black background, that is why RZSplitViewController was taken and modified to create SettingsViewController.
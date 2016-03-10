# tvOSSettingsView
Basic settings style view for tvOS

I couldn't find a single example or tutorial online for what should have been a VERY basic view to create (It was SUPER easy on prior AppleTV's all the way up to tvOS). This should get you started on making a basic view like this.


The anatomy/hierarchy of this view is cumbersome and ugly but unfortunately unavoidable, initially I tried to create it with Apple's UISplitViewController but it is impossible to remove the "gutter" without private methods / ivars and that looked terrible with a black background, that is why RZSplitViewController is used in its place.

Black background

![alt text](Settings_Black.png "Black Background")

Clear background

![alt text](Settings_View_Clear.png "Clear Background")


UIViewController-Orientation
======================

Disclaimer
----
It's now easier to do everything in Auto Layout, but it's still useful in older projects. 

Please note that this category is not updated for newer devices.

Requirements
----
- DeviceSpecific class - you can download it from my github

Why ?
-----

Handling advanced orientation layout is a pain in the neck.

That's why I figured out a way to do it in a more controlled manner

Setup
-------

Just drag & drop files to your project.
You can either add UIViewController+Orientation.h directly in a file, or - for convenience - in pch file.

Usage
------

There should be one ViewController (preferrably the root VC) which sends Notifications during orientation changes.
So pick one and paste this code:
<pre><code>- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self postNotificationWillChangeIntefraceOrientationTo:toInterfaceOrientation withDuration:duration];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self postNotificationDidChangeInterfaceOrientationTo:self.interfaceOrientation];
}
</code></pre>



Every ViewController which has it's unique layout in every orientation should implement these methods:
<pre><code>//In viewDidLoad or viewWillAppear
[self signInForOrientationChanges];
</code></pre>

<pre><code>// In viewDidUnload, viewWillDisappear or viewDidDisappear
[self signOutForOrientationChanges];
</code></pre>

<pre><code>// In order to manually fire Layout and Completion blocks (if set)
[self updateInterface];
</code></pre>

Example - setting blocks for iPad with animation during orientation change

- note -
every animation should be set in Layout block, not in Completion block
<pre><code>
[self setIPadPortraitLayout:^{
        [UIView animateWithDuration:0.3 animations:^{
            [weakSelf.navBar setWidth:768.0];
            [weakSelf.detailVC.view setSize:CGSizeMake(448.0, 962.0)];
            [weakSelf.masterVC.view setHeight:962.0];
        }];
    }];
    [self setIPadLandscapeLayout:^{
        [UIView animateWithDuration:0.3 animations:^{
            [weakSelf.navBar setWidth:1024.0];
            [weakSelf.detailVC.view setSize:CGSizeMake(704.0, 706.0)];
            [weakSelf.masterVC.view setHeight:706.0];
        }];
    }];
</code></pre>

That's pretty much it
---

have fun rolling!

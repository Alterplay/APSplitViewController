APSplitViewController
=====================

A custom SplitViewController
----------------------------
* it always keeps both sides visible
* it's always launched in the Portrait but it's rotated to any direction properly
* each side contains UINavigationController so it's easy to make standard navigation by pushing and poping UIViewControllers
* several APSplitViewController can be contained in the custom UITabBarController (CustomTabBarController)


Future releases
---------------

### Besides the APSplitViewController is used in 3 real project it's still in the initial stage.
I'd like to have in future release:
* launch with landscape mode (not it makes 20px shift)
* optionally hide left side in Portrait
* the divider to be drawn in CoreGraphics instead of PNG image
* optionally move divider in runtime
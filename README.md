APSplitViewController – a custom SplitViewController
====================================================
* it always keeps both sides visible
* it's always launched in the Portrait but it's rotated to any direction properly
* each side contains UINavigationController so it's easy to make standard navigation by pushing and poping UIViewControllers
* several APSplitViewController can be contained in the custom UITabBarController (APTabBarControllerForSplitController)


APTabBarControllerForSplitController
------------------------------------
* Use it as base when you want APBaseSplitViewController to be contained in UITabBarController
* It sends rotation events to content-controllers

APNavigationControllerForSplitController
----------------------------------------
* it's used as a container for content–controllers in the APSplitViewController 
* it sends messages on pushing and poping subcontrollers


Split Sample project
--------------------
* Simple Split demonstrates how to use the component when you need divide the screen into two equal-funcional parts
* Master-Detail Split demonstrates more complex situation when you need two parts with Master-Detail relationships. It even has a connection from Detail to Master.

[![](https://lh6.googleusercontent.com/_bJJJYSjRDfE/TcUTkEMgj3I/AAAAAAAABXM/6jtHwUDqSyI/s288/11.png)](https://lh6.googleusercontent.com/_bJJJYSjRDfE/TcUTkEMgj3I/AAAAAAAABXM/6jtHwUDqSyI/s800/11.png)
[![](https://lh4.googleusercontent.com/_bJJJYSjRDfE/TcUTkT1RzTI/AAAAAAAABXU/QyV__UifQMs/s288/12.png)](https://lh4.googleusercontent.com/_bJJJYSjRDfE/TcUTkT1RzTI/AAAAAAAABXU/QyV__UifQMs/s800/12.png)
[![](https://lh5.googleusercontent.com/_bJJJYSjRDfE/TcUTkRGeJII/AAAAAAAABXQ/_koqbSLpDMs/s288/13.png)](https://lh5.googleusercontent.com/_bJJJYSjRDfE/TcUTkRGeJII/AAAAAAAABXQ/_koqbSLpDMs/s800/13.png)

[![](https://lh3.googleusercontent.com/_bJJJYSjRDfE/TcUTkkVvl3I/AAAAAAAABXY/9xoJOgY1Rug/s288/21.png)](https://lh3.googleusercontent.com/_bJJJYSjRDfE/TcUTkkVvl3I/AAAAAAAABXY/9xoJOgY1Rug/s800/21.png)
[![](https://lh6.googleusercontent.com/_bJJJYSjRDfE/TcUTk6E1RkI/AAAAAAAABXc/e1_mbP3vyM8/s288/22.png)](https://lh6.googleusercontent.com/_bJJJYSjRDfE/TcUTk6E1RkI/AAAAAAAABXc/e1_mbP3vyM8/s800/22.png)

Future releases
---------------
Besides APSplitViewController is used in 3 real project it's still in the initial stage.

Please look [the issue tracker](https://github.com/slatvick/APSplitViewController/issues) and feel free to add your own REAL needs.
Also try to look to the [develop branch](https://github.com/slatvick/APSplitViewController/tree/develop) to check the most latest updates.


Cheers,

[Slava Bushtruk](http://twitter.com/#!/CocoaTouchDev),
[Alterplay](http://www.alterplay.com)
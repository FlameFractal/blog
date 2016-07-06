---
layout: post
published: true
title: Keyboard shortcut to open Terminal in OSX
date: '2014-01-11'
---

### Since I've switched to OSX, I've always missed the convenience of just firing up the Terminal in Linux using Ctrl+Alt+T on whatever screen I may be.

So recently, I was digging through Automator when I realised I could create a Service to do just that!    

**Steps**:

1. Open Automator, choose Service for new document.
	
	![step1]({{site.baseurl}}/assets/img/step1.png)

2. Set these parameters at the top as **no input** in **any application** and drag the Launch Application from the left side onto the workflow canvas.
	
	![step2]({{site.baseurl}}/assets/img/step2.png)

3. Set Terminal in /Others from the dropdown menu, hit cmd+s to save, give a name and exit Automator.
	
	![step3]({{site.baseurl}}/assets/img/step3.png)

4. Go to System Preferences -> Keyboard -> Services. Head down to the bottom. Set a shortcut for Open Terminal service that you just created. Make sure that it doesn't conflict with a preset shortcut. I set mine to ⌃⌥⌘T (Ctrl_Alt_Command_T).
	
	![step4]({{site.baseurl}}/assets/img/step4.png)

5. 	 Now open App Shortcuts from the left pane. Hit the + , and set _Application_ to All Applications (**key point!**) and Menu Title as "Open Terminal" or something, enter the same keystrokes that you entered before.
	
	![step5]({{site.baseurl}}/assets/img/step5.png)


#### **_Voila_**! You're done. Now your keystroke will override in every app.<br/>So no matter where you are, ⌃⌥⌘T, will take you to your favourite place, the command center.  
  

_Extra Tip:_ Open Finder from terminal at your current working directory by using "open ." command.

# ui_maker

> Isn't flutter already a tool for building UIs?

Yes, in the same way that a game engine is a tool for building a game. The purpose of this package is to help make the process more accessible by enabling users to drag and drop widgets, easily sort by an index, and reorganize the UI as they see fit. This also gives app designers more freedom as they get to define specific areas (using the ```CreatorArea``` widget) where users can add their own widgets from a selection. 

## Q&A

> Can I add a widget to the CreatorBar widgets?

Yes, although only the provided widgets have been tested. Note that if you want right click functionality, you will need to wrap your widget with the ```CreatorBase``` widget.

> Do you have any updates planned for this library?

As of right now, I have other projects I want to pursue. That doesn't mean that you can't help update it though! This was my first flutter-dart package (and I'm sure it shows), so there's bound to be a lot that needs refactoring. Personally, I think the project has potential to be useful, but right now it's lacking customization and proper package configuration and organization. I think it could use a bit more user-choice for developers (ironic, for a package that's all about user choice).
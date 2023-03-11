# ui_maker

:warning: After careful consideration, I've decided to abandon this project (the code and project are public as a learning resource). For more about the project and reasons why, continue reading. 

## Purpose
- The original intent of the ui_maker flutter-dart library was to provide a collection of flutter widgets that could be used 
to allow users to create their own permanent interfaces inside an app. One specific usecase could've been if a developer wanted to allow an app to be easily expandable, but the users don't know about the flutter framework or the underlying code.

## Code
I coded and planned a few widgets:
- ```CreatorArea```: a DragTarget widget that can take in draggable widgets. Each CreatorArea widget would have an Isar collection (a form of database management) in which the json of the widget would be written as a map and then rendered procedurally upon loading of the CreatorArea
- ```CreatorBase```: a base widget for wrapping implemented widgets in if you want users to be able to drag and add them to the app (currently basic or incomplete implementations were created for the card, checkbox, dropdown, text input, and image (elevated button) widgets)
- ```CreatorBar```: a scaffold bar for all the implemented widgets supported by the library 
- ```CreatorScaffold```: an example scaffold including the CreatorBar and a CreatorArea
- ```CreatorContextMenu```: a context menu widget for changing widget properties (I was considering creating a designated ```WidgetEditor``` widget that could be accessed through context menu, which is what I would have done if I ended up continuing my implementation of this library)

I also wrote some Isar collections for my widgets themselves:
- Layout: for storing data about a layout and the widgets inside it
- WidgetSettings: for storing settings about widgets

along with other utilities. 

I learned a bit about dart, flutter, dart-flutter libraries, and testing throughout the course of this project, 
so I am glad about those takeaways irrespective of the project's outcome.

## Reasoning
After experimenting with this idea, I realized a couple of things: 
    - The solution I theorized (involving a mixture of db writing and code generation) in order to handle draggable 
    widgets ended up being complex, which defeated the purpose of simplicity.
    - The ways I approached the idea didn't seem to integrate well with the flutter framework; 
    for example if I were to use code generations to update the code for a dropped and then edited stateful widget, 
    setState wouldn't get called to update a variable, instead code would be generated DURING the runtime of the app, 
    increasing app size and (at least to me) appearing to be bad practice (or at least inefficient).
    - I just recently found flutterviz (https://flutterviz.com/), which, while not the exact same thing as my original 
    idea, is a better implementation of some of the core ideas.

## Future plans
NA (but that doesn't mean that **YOU** can't examine the code or repository if you have any ideas to move the project forward)
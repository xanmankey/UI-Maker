library ui_maker;

export 'dropdown_item_creator.dart';

// A dialog for creating dropdown items
import 'package:flutter/material.dart';

/// A dialog widget for selecting dropdown items when creating a
/// ```CreatorDialog``` widget. Radio buttons are used to determine the
/// types of dropdowns and further settings are generated based on
/// the selection of radio buttons. Submitted on button click.
///
/// ```
/// class DropdownItemCreator extends StatefulWidget {
///   const DropdownItemCreator({super.key});
///
///   @override
///   State<DropdownItemCreator> createState() => _DropdownItemCreatorState();
/// }
///
/// class _DropdownItemCreatorState extends State<DropdownItemCreator> {
///   late DropdownMenuTypes dropdownInputType = DropdownMenuTypes.string;
///   late List<dynamic> values;
///   int numItems = 10;
///   TextEditingController numItemsController = TextEditingController();
///
///   Widget dropdownItemOptions(DropdownMenuTypes type, int numItems) {
///     List<TextEditingController> controllers =
///         List.generate(numItems, (index) => TextEditingController());
///     switch (type) {
///       case DropdownMenuTypes.string:
///         // List<String> values = [];
///         return Column(
///           children: [
///             ListView.builder(
///               itemBuilder: ((context, index) {
///                 return TextField(
///                   controller: controllers[index],
///                   decoration: InputDecoration(labelText: '$index'),
///                   onEditingComplete: () =>
///                       values[index] = controllers[index].text,
///                 );
///               }),
///               itemCount: numItems,
///             ),
///           ],
///         );
///       case DropdownMenuTypes.nums:
///         num interval = 1;
///         TextEditingController intervalController = TextEditingController();
///         // List<num> values = [];
///         return Column(
///           children: [
///             Row(
///               children: [
///                 TextField(
///                   controller: intervalController,
///                   decoration: const InputDecoration(labelText: 'interval'),
///                   keyboardType: TextInputType.number,
///                   onEditingComplete: () =>
///                       interval = num.parse(intervalController.text),
///                 ),
///               ],
///             ),
///             ListView.builder(
///               itemBuilder: ((context, index) {
///                 return TextField(
///                   controller: controllers[index],
///                   decoration: InputDecoration(labelText: '$index'),
///                   onEditingComplete: () =>
///                       values[index] = int.parse(controllers[index].text),
///                   keyboardType: TextInputType.number,
///                 );
///               }),
///               itemCount: numItems,
///             ),
///           ],
///         );
///       case DropdownMenuTypes.bool:
///         // List<bool> values = [];
///         return ListView.builder(
///           itemBuilder: ((context, index) {
///             return TextField(
///               controller: controllers[index],
///               decoration: InputDecoration(labelText: '$index'),
///               onEditingComplete: () =>
///                   values[index] = bool.fromEnvironment(controllers[index].text),
///               keyboardType: TextInputType.text,
///             );
///           }),
///           itemCount: numItems,
///         );
///     }
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return Dialog(
///       child: Column(
///         children: [
///           Row(
///             children: [
///               RadioListTile(
///                   value: DropdownMenuTypes.string,
///                   groupValue: dropdownInputType,
///                   onChanged: (DropdownMenuTypes? type) {
///                     setState(() {
///                       dropdownInputType = type ?? dropdownInputType;
///                     });
///                   }),
///               RadioListTile(
///                   value: DropdownMenuTypes.nums,
///                   groupValue: dropdownInputType,
///                   onChanged: (DropdownMenuTypes? type) {
///                     setState(() {
///                       dropdownInputType = type ?? dropdownInputType;
///                     });
///                   }),
///               RadioListTile(
///                   value: DropdownMenuTypes.bool,
///                   groupValue: dropdownInputType,
///                   onChanged: (DropdownMenuTypes? type) {
///                     setState(() {
///                       dropdownInputType = type ?? dropdownInputType;
///                     });
///                   }),
///             ],
///           ),
///           TextField(
///             controller: numItemsController,
///             decoration: const InputDecoration(labelText: 'numItems'),
///             keyboardType: TextInputType.number,
///             onEditingComplete: () {
///               setState(() {
///                 numItems = int.parse(numItemsController.text);
///               });
///             },
///           ),
///           dropdownItemOptions(dropdownInputType, numItems),
///           ElevatedButton(
///             onPressed: () {
///               // Return dropdown values
///               // widget.onConfirm(valueToItem(dropdownInputType, values));
///               Navigator.pop(context, valueToItem(values));
///             },
///             child: const Text("Create items"),
///           ),
///         ],
///       ),
///     );
///   }
/// }
/// ```
class DropdownItemCreator extends StatefulWidget {
  const DropdownItemCreator({super.key});

  @override
  State<DropdownItemCreator> createState() => _DropdownItemCreatorState();
}

class _DropdownItemCreatorState extends State<DropdownItemCreator> {
  late DropdownMenuTypes dropdownInputType = DropdownMenuTypes.string;
  late List<dynamic> values;
  int numItems = 10;
  TextEditingController numItemsController = TextEditingController();

  Widget dropdownItemOptions(DropdownMenuTypes type, int numItems) {
    List<TextEditingController> controllers =
        List.generate(numItems, (index) => TextEditingController());
    switch (type) {
      case DropdownMenuTypes.string:
        // List<String> values = [];
        return Column(
          children: [
            ListView.builder(
              itemBuilder: ((context, index) {
                return TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(labelText: '$index'),
                  onEditingComplete: () =>
                      values[index] = controllers[index].text,
                );
              }),
              itemCount: numItems,
            ),
          ],
        );
      case DropdownMenuTypes.nums:
        num interval = 1;
        TextEditingController intervalController = TextEditingController();
        // List<num> values = [];
        return Column(
          children: [
            Row(
              children: [
                TextField(
                  controller: intervalController,
                  decoration: const InputDecoration(labelText: 'interval'),
                  keyboardType: TextInputType.number,
                  onEditingComplete: () =>
                      interval = num.parse(intervalController.text),
                ),
              ],
            ),
            ListView.builder(
              itemBuilder: ((context, index) {
                return TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(labelText: '$index'),
                  onEditingComplete: () =>
                      values[index] = int.parse(controllers[index].text),
                  keyboardType: TextInputType.number,
                );
              }),
              itemCount: numItems,
            ),
          ],
        );
      case DropdownMenuTypes.bool:
        // List<bool> values = [];
        return ListView.builder(
          itemBuilder: ((context, index) {
            return TextField(
              controller: controllers[index],
              decoration: InputDecoration(labelText: '$index'),
              onEditingComplete: () =>
                  values[index] = bool.fromEnvironment(controllers[index].text),
              keyboardType: TextInputType.text,
            );
          }),
          itemCount: numItems,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Row(
            children: [
              RadioListTile(
                  value: DropdownMenuTypes.string,
                  groupValue: dropdownInputType,
                  onChanged: (DropdownMenuTypes? type) {
                    setState(() {
                      dropdownInputType = type ?? dropdownInputType;
                    });
                  }),
              RadioListTile(
                  value: DropdownMenuTypes.nums,
                  groupValue: dropdownInputType,
                  onChanged: (DropdownMenuTypes? type) {
                    setState(() {
                      dropdownInputType = type ?? dropdownInputType;
                    });
                  }),
              RadioListTile(
                  value: DropdownMenuTypes.bool,
                  groupValue: dropdownInputType,
                  onChanged: (DropdownMenuTypes? type) {
                    setState(() {
                      dropdownInputType = type ?? dropdownInputType;
                    });
                  }),
            ],
          ),
          TextField(
            controller: numItemsController,
            decoration: const InputDecoration(labelText: 'numItems'),
            keyboardType: TextInputType.number,
            onEditingComplete: () {
              setState(() {
                numItems = int.parse(numItemsController.text);
              });
            },
          ),
          dropdownItemOptions(dropdownInputType, numItems),
          ElevatedButton(
            onPressed: () {
              // Return dropdown values
              // widget.onConfirm(valueToItem(dropdownInputType, values));
              Navigator.pop(context, valueToItem(values));
            },
            child: const Text("Create items"),
          ),
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> valueToItem(List<dynamic> items) {
  return [
    for (dynamic item in items)
      DropdownMenuItem(
        child: Text(item.toString()),
      )
  ];
}

enum DropdownMenuTypes {
  string,
  nums,
  bool;

  static DropdownMenuTypes? fromString(String string) {
    switch (string) {
      case "string":
        return DropdownMenuTypes.string;
      case "ints":
        return DropdownMenuTypes.nums;
      case "bool":
        return DropdownMenuTypes.bool;
      default:
        return null;
    }
  }
}

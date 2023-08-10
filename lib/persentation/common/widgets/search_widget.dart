import 'package:flutter/material.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

typedef ValueChanged<T> = void Function(T value, T value2);

class BaseSearchWidget extends StatefulWidget {
  final List<Filter> filters;
  final ValueChanged<String> onFilterChanged;

  const BaseSearchWidget({
    Key? key,
    required this.filters,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  BaseSearchWidgetState createState() => BaseSearchWidgetState();
}

class BaseSearchWidgetState extends State<BaseSearchWidget> {
  Filter? _activeFilter;

  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_activeFilter == null) {
        return;
      }
      widget.onFilterChanged(_activeFilter!.name, _searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void handleSelection(String selection) {
    widget.onFilterChanged(_activeFilter!.name, selection);
    // Here you can call any function or perform any action with the selected option
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          _searchInput(),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: PopupMenuButton<Filter>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                    color: Colors.grey, width: 2.0, style: BorderStyle.solid),
              ),
              iconSize: 30.0,
              icon: const Icon(Icons.filter_list),
              onOpened: () {
                setState(() {
                  _searchController.text = "Re";
                  _searchController.clear();
                  _activeFilter = null;
                });
              },
              onSelected: (Filter value) {
                setState(() {
                  _activeFilter = value;
                  _searchController.clear();
                });
              },
              itemBuilder: (BuildContext context) {
                return widget.filters
                    .expand<PopupMenuEntry<Filter>>((Filter filter) {
                  return <PopupMenuEntry<Filter>>[
                    PopupMenuItem<Filter>(
                      value: filter,
                      child: Text(filter.label),
                    ),
                    // const PopupMenuDivider(),
                  ];
                }).toList();
                //..removeLast(); // Remove the last divider
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchInput() {
    if (_activeFilter == null || _activeFilter!.type == FilterType.text) {
      return Expanded(
        child: TextFormField(
          controller: _searchController,
          //focusNode: searchFocusNode,
          decoration: InputDecoration(
            labelText: _activeFilter?.label ?? 'Select a filter to search',
            border: const OutlineInputBorder(),
          ),
        ),
      );
    } else if (_activeFilter!.type == FilterType.dropdown) {
      return Expanded(
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return _activeFilter!.options;
            }
            return _activeFilter!.options.where((String option) {
              return option.contains(textEditingValue.text);
            });
          },
          displayStringForOption: (option) => option,
          onSelected: (
            String selection,
          ) {
            handleSelection(selection);
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              onEditingComplete: onFieldSubmitted,
              decoration: InputDecoration(
                hintText: 'Enter ${_activeFilter!.label} or Select',
                labelText: '${_activeFilter!.label} ',
                //  border: const OutlineInputBorder(),
              ),
            );
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    maxWidth: MediaQuery.of(context).size.width * 0.77,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: ColorManager.primaryColor,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () => onSelected(option),
                          child: ListTile(
                            title: Text(option),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Expanded(
        child: TextFormField(
          controller: _searchController,
          //focusNode: searchFocusNode,
          decoration: InputDecoration(
            labelText: _activeFilter?.label ?? 'Select a filter to search',
            border: const OutlineInputBorder(),
          ),
        ),
      );
    }
  }
}

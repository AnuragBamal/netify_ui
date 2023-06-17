import 'package:flutter/material.dart';

class OptionSearchDelegate extends SearchDelegate<String> {
  final List<String> options;

  OptionSearchDelegate(this.options);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = options.where((option) {
      return option.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          close(context, suggestionList[index]);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = options.where((option) {
      return option.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
      ),
    );
  }
}


// usage ...
// case 'dropdown':
//   return ListTile(
//     title: Text(filter.name),
//     trailing: IconButton(
//       icon: Icon(Icons.search),
//       onPressed: () async {
//         final selected = await showSearch<String>(
//           context: context,
//           delegate: OptionSearchDelegate(filter.options ?? []),
//         );
//         if (selected != null) {
//           widget.onFilterChanged({filter.name: selected});
//         }
//       },
//     ),
//   );
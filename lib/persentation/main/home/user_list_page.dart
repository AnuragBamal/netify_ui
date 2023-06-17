import 'package:flutter/material.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/common/widgets/search_widget.dart';
import 'package:netify/persentation/main/home_page_view_model.dart';
import 'package:netify/persentation/main/user/create_user.dart';

import 'package:netify/persentation/resources/color_manager.dart';
import 'package:shimmer/shimmer.dart';

typedef ItemBuilder<T> = Widget Function(
    BuildContext context, int index, T? item);

class UserDataTypeScreen extends StatelessWidget {
  final HomepageViewModel homepageViewModel;
  final ItemBuilder<List<User>> itemBuilder;
  final List<Filter> filterList;
  final String screenName;

  const UserDataTypeScreen({
    super.key,
    required this.itemBuilder,
    required this.filterList,
    required this.homepageViewModel,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseSearchWidget(
            filters: filterList,
            onFilterChanged: homepageViewModel.updateSearchFilter,
          ),
          StreamBuilder<bool>(
              stream: homepageViewModel.outputForSearchState,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!
                      ? StreamBuilder<List<User>>(
                          stream: homepageViewModel.outputUserDataTypeSearch,
                          builder: userPageBuilder,
                        )
                      : screenName == ScreenTypeIdentity.reseller
                          ? StreamBuilder<List<User>>(
                              stream:
                                  homepageViewModel.outputForResellerTypeScreen,
                              builder: userPageBuilder,
                            )
                          : StreamBuilder<List<User>>(
                              stream:
                                  homepageViewModel.outputForOperatorTypeScreen,
                              builder: userPageBuilder,
                            );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return screenName == ScreenTypeIdentity.reseller
                      ? StreamBuilder<List<User>>(
                          stream: homepageViewModel.outputForResellerTypeScreen,
                          builder: userPageBuilder,
                        )
                      : StreamBuilder<List<User>>(
                          stream: homepageViewModel.outputForOperatorTypeScreen,
                          builder: userPageBuilder,
                        );
                }
              }),
          // StreamBuilder<List<User>>(
          //   stream: homepageViewModel.isSearchEnabled
          //       ? homepageViewModel.outputUserDataTypeSearch
          //       : screenName == ScreenTypeIdentity.reseller
          //           ? homepageViewModel.outputForResellerTypeScreen
          //           : homepageViewModel.outputForOperatorTypeScreen,
          //   builder: userPageBuilder,
          // ),
        ],
      ),
    );
  }

  Widget userPageBuilder(
      BuildContext context, AsyncSnapshot<List<User>> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data!.isEmpty) {
        return const Center(
          child: Text("No data found"),
        );
      } else {
        return Stack(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemBuilder(context, index, snapshot.data);
                },
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.08,
              right: MediaQuery.of(context).size.width * 0.05,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateUserView(
                                homepageViewModel: homepageViewModel,
                                screenTypeIdentity: screenName,
                                methodNameToExecute: "createUser",
                              )));
                },
                backgroundColor: ColorManager.primaryColor,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      }
    } else if (snapshot.hasError) {
      return Text("Error: ${snapshot.error}");
    } else {
      return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, __) => Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 184, 183, 183),
              highlightColor: const Color.fromARGB(255, 235, 234, 234),
              child: ListTile(
                leading: Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),
                title: Container(
                  height: 8.0,
                  color: Colors.white,
                ),
                subtitle: Container(
                  height: 8.0,
                  color: Colors.white,
                ),
              ),
            ),
          ));
    }
  }
}

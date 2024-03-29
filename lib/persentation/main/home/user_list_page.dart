import 'package:flutter/material.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/common/widgets/search_widget.dart';
import 'package:netify/persentation/main/home/expanded_panel.dart';
import 'package:netify/persentation/main/home/home_page_view_model.dart';
import 'package:netify/persentation/main/home/user/create_user.dart';

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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: BaseSearchWidget(
            filters: filterList,
            onFilterChanged: homepageViewModel.updateSearchFilter,
          ),
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
    );
  }

  Widget userPageBuilder(
      BuildContext context, AsyncSnapshot<List<User>> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data!.isEmpty) {
        return Stack(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.56,
              child: const Center(child: Text("No data found"))),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.08,
            right: MediaQuery.of(context).size.width * 0.05,
            child: FloatingActionButton(
              onPressed: () {
                homepageViewModel.navigateToCreateUser(CreateUserViewArguments(
                  screenTypeIdentity: screenName,
                ));
              },
              backgroundColor: ColorManager.primaryColor,
              child: const Icon(Icons.add),
            ),
          ),
        ]);
      } else {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.56,
                // constraints: BoxConstraints(
                //   maxHeight: ,
                // ),
                child: ExpandedPanelWidget(
                  dataTypeIdentity: DataTypeIdentity.user,
                  userItemSnapshot: snapshot.data,
                ),
                // child: ListView.builder(
                //   itemCount: snapshot.data!.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return itemBuilder(context, index, snapshot.data);
                //   },
                // ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.08,
              right: MediaQuery.of(context).size.width * 0.05,
              child: FloatingActionButton(
                onPressed: () {
                  homepageViewModel
                      .navigateToCreateUser(CreateUserViewArguments(
                    screenTypeIdentity: screenName,
                  ));
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
            maxHeight: MediaQuery.of(context).size.height * 0.55,
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

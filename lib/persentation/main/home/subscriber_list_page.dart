import 'package:flutter/material.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/common/widgets/search_widget.dart';
import 'package:netify/persentation/main/home/expanded_panel.dart';
import 'package:netify/persentation/main/home/home_page_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:shimmer/shimmer.dart';

class SubscriberDataTypeScreen extends StatelessWidget {
  final HomepageViewModel homepageViewModel;
  final List<Filter> filterList;
  final String screenName;

  const SubscriberDataTypeScreen(
      {super.key,
      required this.homepageViewModel,
      required this.filterList,
      required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BaseSearchWidget(
          filters: filterList,
          onFilterChanged: homepageViewModel.updateSubscriberSearchFilter,
        ),
        StreamBuilder<bool>(
            stream: homepageViewModel.outputForSearchState,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!
                    ? StreamBuilder<List<Subscriber>>(
                        stream:
                            homepageViewModel.outputSubscriberDataTypeSearch,
                        builder: subscriberPageBuilder,
                      )
                    : StreamBuilder<List<Subscriber>>(
                        stream: homepageViewModel.outputForSubscriberTypeScreen,
                        builder: subscriberPageBuilder,
                      );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return StreamBuilder<List<Subscriber>>(
                  stream: homepageViewModel.outputForSubscriberTypeScreen,
                  builder: subscriberPageBuilder,
                );
              }
            }),
      ],
    );
  }

  Widget subscriberPageBuilder(
      BuildContext context, AsyncSnapshot<List<Subscriber>> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data!.isEmpty) {
        return Stack(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: const Center(child: Text("No data found"))),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.08,
            right: MediaQuery.of(context).size.width * 0.05,
            child: FloatingActionButton(
              onPressed: () {
                homepageViewModel.navigateToCreateSubscriber();
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
                height: MediaQuery.of(context).size.height * 0.70,
                child: ExpandedPanelWidget(
                  dataTypeIdentity: DataTypeIdentity.subscriber,
                  subscriberItemSnapshot: snapshot.data,
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.08,
              right: MediaQuery.of(context).size.width * 0.05,
              child: FloatingActionButton(
                onPressed: () {
                  homepageViewModel.navigateToCreateSubscriber();
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
            maxHeight: MediaQuery.of(context).size.height * 0.70,
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

import 'package:flutter/material.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/common/widgets/dashboard_page_widget.dart';

typedef ItemBuilder<T> = Widget Function(
    BuildContext context, int index, T? item, Function onTap);

class DashboardView extends StatelessWidget {
  // final HomepageViewModel homepageViewModel;
  final Stream<List<DashboardItem>> dashboardStream;
  final ItemBuilder<List<DashboardItem>> itemBuilder;
  final Function onTap;

  const DashboardView({
    super.key,
    required this.itemBuilder,
    required this.dashboardStream,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<List<DashboardItem>>(
            stream: dashboardStream, //homepageViewModel.outputForDashboard,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.75,
                  ),
                  child: GridView.builder(
                      padding: const EdgeInsets.all(25.0),
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  1, // Change this number as per your need
                              crossAxisSpacing: 5.0, // Change as per your need
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 5 / 2 // Change as per your need
                              ),
                      itemBuilder: (BuildContext context, int index) {
                        return itemBuilder(
                            context, index, snapshot.data, onTap);
                      }),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return dashboardShimmer(context);
              }
            },
          ) // some widget at the top
        ],
      ),
    );
  }
}

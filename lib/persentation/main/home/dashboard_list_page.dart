import 'package:flutter/material.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/main/home_page_view_model.dart';
import 'package:shimmer/shimmer.dart';

typedef ItemBuilder<T> = Widget Function(
    BuildContext context, int index, T? item, Function onTap);

class DashboardView extends StatelessWidget {
  final HomepageViewModel homepageViewModel;
  final ItemBuilder<List<DashboardItem>> itemBuilder;
  final Function onTap;

  const DashboardView({
    super.key,
    required this.itemBuilder,
    required this.homepageViewModel,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('DashBoard'),
          StreamBuilder<List<DashboardItem>>(
            stream: homepageViewModel.outputForDashboard,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  child: GridView.builder(
                      padding: const EdgeInsets.all(25.0),
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // Change this number as per your need
                        crossAxisSpacing: 1.0, // Change as per your need
                        mainAxisSpacing: 1.0, // Change as per your need
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return itemBuilder(
                            context, index, snapshot.data, onTap);
                      }),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(25.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 3,
                    itemBuilder: (_, __) => Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 184, 183, 183),
                      highlightColor: const Color.fromARGB(255, 87, 85, 85),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              }
            },
          ) // some widget at the top
        ],
      ),
    );
  }
}

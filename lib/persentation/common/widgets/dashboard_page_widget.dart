import 'package:flutter/material.dart';
import 'package:netify/domain/model/model.dart';
import 'package:shimmer/shimmer.dart';

Widget mainDashboardWidget(
    BuildContext context,
    PageController pageController,
    Stream<SliderDisplayObject> sliderObjectStream,
    Function onPageChange,
    Function pageWidget) {
  return Center(
      child: StreamBuilder<SliderDisplayObject>(
    stream: sliderObjectStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            } else if (details.velocity.pixelsPerSecond.dx < 0) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            }
          },
          child: PageView.builder(
              pageSnapping: false,
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: snapshot.data!.numberOfDisplays,
              onPageChanged: (index) {
                onPageChange(index);
              },
              itemBuilder: (context, index) {
                return pageWidget(context, snapshot.data!.mainPageModel);
              }),
        );
      } else {
        return dashboardShimmer(context);
      }
    },
  ));
}

Widget dashboardShimmer(BuildContext context) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.75,
    ),
    child: GridView.builder(
      padding: const EdgeInsets.all(25.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 5 / 2),
      itemCount: 4,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 184, 183, 183),
        highlightColor: const Color.fromARGB(255, 214, 209, 209),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          color: Colors.grey,
        ),
      ),
    ),
  );
}

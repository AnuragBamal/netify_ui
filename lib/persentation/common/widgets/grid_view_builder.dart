import 'package:flutter/material.dart';
import 'package:netify/domain/model/home_model.dart';

Widget dashboardGridItemBuilder(
    BuildContext context, int index, List<DashboardItem>? data) {
  int colorValue = int.parse(data![index].color);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
        color: Color(colorValue),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(data[index].assetName),
          Text(data[index].assetCount.toString()),
        ])),
  );
}

import 'package:flutter/material.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/styles_manager.dart';

Widget dashboardGridItemBuilder(BuildContext context, int index,
    List<DashboardItem>? data, Function onTap) {
  int colorValue = int.parse(data![index].color);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        onTap(data[index].referenceScreenId);
      },
      child: Card(
          color: Color(colorValue),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data[index].assetCount.toString(),
                      style: getBoldStyle(color: Colors.white, fontSize: 45)),
                  Text(
                    data[index].assetName,
                    style: getSemiBoldStyle(
                        color: ColorManager.surfaceColor, fontSize: 20),
                  ),
                ]),
          )),
    ),
  );
}

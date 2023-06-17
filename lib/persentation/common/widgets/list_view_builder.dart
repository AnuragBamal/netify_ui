import 'package:flutter/material.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

Widget userListBuilder(BuildContext context, int index, List<User>? data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: const Icon(Icons.person),
      //title: Text(data![index].firstName),
      //subtitle: Text(data[index].lastName),
      title: customerTitleData(data![index]),
      subtitle: customerSubtitleData(data[index]),
      //trailing: Text(data[index].email),
      trailing: customerTrailingData(data[index]),
      style: ListTileStyle.list,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: ColorManager.primaryColor, width: 1),
      ),
      isThreeLine: false,
      titleAlignment: ListTileTitleAlignment.center,
    ),
  );
}

Widget customerSubtitleData(User user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(user.brandName),
      Text(user.companyName),
    ],
  );
}

Widget customerTitleData(User user) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(user.firstName),
      const SizedBox(
        width: 2,
      ),
      Text(user.lastName),
    ],
  );
}

Widget customerTrailingData(User user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(user.mobileNumber),
      FittedBox(child: Text(user.email)),
    ],
  );
}

// Widget expansionPanelBuilder(
//     BuildContext context, int index, List<User>? data) {
//   return ExpansionPanelList(
//     expansionCallback: (int index, bool isExpanded) {
//       // setState(() {
//       //   _data[index].isExpanded = !isExpanded;
//       // });
//     },
//     children: [
//       ExpansionPanel(
//         headerBuilder: (BuildContext context, bool isExpanded) {
//           return ListTile(
//             title: Text(data[index].firstName),
//           );
//         },
//         body: ListTile(
//           title: Text(data![index].lastName),
//           subtitle: Text(data[index].email),
//           trailing: Text(data[index].companyName),
//         ),
//         isExpanded: data[index].isExpanded,
//       ),
//     ],
//   );
// }

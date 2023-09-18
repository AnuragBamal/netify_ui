import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/main/settings/nas/create_nas_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class CreateNewNas extends StatefulWidget {
  final List<String> supportedNasType;
  const CreateNewNas({super.key, required this.supportedNasType});

  @override
  State<CreateNewNas> createState() => _CreateNewNasState();
}

class _CreateNewNasState extends State<CreateNewNas> {
  final _createNasViewModel = instance<NasEntryViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nasNameController = TextEditingController();
  final TextEditingController _shortNameController = TextEditingController();
  final TextEditingController _nasTypeController = TextEditingController();
  final TextEditingController portsController = TextEditingController();
  final TextEditingController _secretController = TextEditingController();
  final TextEditingController _serverController = TextEditingController();
  final TextEditingController _communityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _bind() {
    _nasNameController.addListener(() {
      _createNasViewModel.setNasName(_nasNameController.text);
    });
    _shortNameController.addListener(() {
      _createNasViewModel.setNasShortName(_shortNameController.text);
    });
    _nasTypeController.addListener(() {
      _createNasViewModel.setNasType(_nasTypeController.text);
    });
    portsController.addListener(() {
      _createNasViewModel.setNasPorts(portsController.text);
    });
    _secretController.addListener(() {
      _createNasViewModel.setNasSecret(_secretController.text);
    });
    _serverController.addListener(() {
      _createNasViewModel.setNasServer(_serverController.text);
    });
    _communityController.addListener(() {
      _createNasViewModel.setNasCommunity(_communityController.text);
    });
    _descriptionController.addListener(() {
      _createNasViewModel.setNasDescription(_descriptionController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _nasNameController.dispose();
    _shortNameController.dispose();
    _nasTypeController.dispose();
    portsController.dispose();
    _secretController.dispose();
    _serverController.dispose();
    _communityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      body: _getContentWidget(context),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p64),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  AppString.createNewNas,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              //_getAppBar(context),
              _getShortNameWidget(context),
              _getNasNameWidget(context),

              _getNasTypeWidget(context),
              //_getPortsWidget(context),
              _getSecretWidget(context),
              // _getServerWidget(context),
              // _getCommunityWidget(context),
              _getDescriptionWidget(context),
              _getCreateNasButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getNasNameWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: StreamBuilder<String?>(
          stream: _createNasViewModel.nasNameStream,
          builder: (context, snapshot) {
            return TextFormField(
              controller: _nasNameController,
              decoration: InputDecoration(
                labelText: AppString.nasName,
                hintText: AppString.nasNameHint,
                errorText: snapshot.data,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
    );
  }

  Widget _getShortNameWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
        controller: _shortNameController,
        decoration: const InputDecoration(
          labelText: AppString.nasShortName,
          hintText: AppString.nasShortNameHint,
        ),
      ),
    );
  }

  Widget _getNasTypeWidget(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
    //   child: TextFormField(
    //     controller: _nasTypeController,
    //     decoration: const InputDecoration(
    //       labelText: AppString.nasType,
    //       hintText: AppString.nasTypeHint,
    //     ),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          hintText: AppString.nasTypeHint,
          labelText: AppString.nasType,
        ),
        isDense: true,
        // value: _userViewModel.owner,
        onChanged: (String? newValue) {
          if (newValue != null && newValue != "Please Select") {
            _createNasViewModel.setNasType(newValue);
          }
        },
        items: widget.supportedNasType
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget _getPortsWidget(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
  //     child: TextFormField(
  //       controller: portsController,
  //       decoration: const InputDecoration(
  //         labelText: AppString.nasPorts,
  //         hintText: AppString.nasPortsHint,
  //       ),
  //     ),
  //   );
  // }

  Widget _getSecretWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
        controller: _secretController,
        decoration: const InputDecoration(
          labelText: AppString.nasSecret,
          hintText: AppString.nasSecretHint,
        ),
      ),
    );
  }

  // Widget _getServerWidget(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
  //     child: TextFormField(
  //       controller: _serverController,
  //       decoration: const InputDecoration(
  //         labelText: AppString.nasServer,
  //         hintText: AppString.nasServerHint,
  //       ),
  //     ),
  //   );
  // }

  // Widget _getCommunityWidget(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
  //     child: TextFormField(
  //       controller: _communityController,
  //       decoration: const InputDecoration(
  //         labelText: AppString.nasCommunity,
  //         hintText: AppString.nasCommunityHint,
  //       ),
  //     ),
  //   );
  // }

  Widget _getDescriptionWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
        controller: _descriptionController,
        decoration: const InputDecoration(
          labelText: AppString.nasDescription,
          hintText: AppString.nasDescriptionHint,
        ),
      ),
    );
  }

  Widget _getCreateNasButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: StreamBuilder<bool>(
          stream: _createNasViewModel.formValidStream,
          builder: (context, snapshot) {
            return ElevatedButton(
              onPressed: (snapshot.data == true)
                  ? () {
                      _createNasViewModel.createNas(context);
                    }
                  : null,
              child: const Text(AppString.nasSubmitButton),
            );
          }),
    );
  }
}

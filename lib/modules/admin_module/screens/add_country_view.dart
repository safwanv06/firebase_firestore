import 'package:firestore_project/modules/admin_module/services/service.dart';
import 'package:firestore_project/modules/widgets/custom_button.dart';
import 'package:firestore_project/services/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCountryView extends StatelessWidget {
  AddCountryView({super.key});

  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                controller: countryController,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                  onTap: () {
                    AdminService().addCountry(
                        FireStoreDataModel(name: countryController.text));
                    Navigator.pop(context);
                  },
                  buttonName: "Add country"),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                controller: stateController,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                  onTap: () {
                    AdminService().addState(
                        FireStoreDataModel(name: stateController.text));
                    Navigator.pop(context);
                  },
                  buttonName: "Add State"),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                controller: cityController,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                  onTap: () {
                    AdminService().addCity(
                        FireStoreDataModel(name: cityController.text));
                    Navigator.pop(context);
                  },
                  buttonName: "Add City"),
            ],
          ),
        ),
      ),
    );
  }
}

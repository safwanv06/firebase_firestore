import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/modules/admin_module/screens/add_country_view.dart';
import 'package:firestore_project/modules/widgets/custom_button.dart';
import 'package:firestore_project/modules/widgets/drawer.dart';
import 'package:firestore_project/services/model.dart';
import 'package:firestore_project/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/country_listing_component.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(
          title: "Admins dashboard",
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Admins dashboard",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            const ListingComponent(),
            Positioned(
                bottom: 30.h,
                child: CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCountryView(),
                          ));
                    },
                    buttonName: "Add location"))
          ],
        ));
  }
}

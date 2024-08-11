import 'package:firestore_project/modules/user_module/screens/weather_repost_screen.dart';
import 'package:firestore_project/modules/widgets/country_listing_component.dart';
import 'package:firestore_project/modules/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/model.dart';
import '../../../services/service.dart';
import '../../widgets/drawer.dart';

class UserDashboardView extends StatelessWidget {
  const UserDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(
          title: "User's dashboard",
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "User's dashboard",
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
                            builder: (context) => WeatherRepostScreen(),
                          ));
                    },
                    buttonName: "Weather report"))
          ],
        ));
  }
}

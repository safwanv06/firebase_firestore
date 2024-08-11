import 'package:firestore_project/modules/user_module/screens/widgets/file_picker_component.dart';
import 'package:firestore_project/modules/user_module/screens/widgets/weather_card.dart';
import 'package:firestore_project/modules/user_module/services/model.dart';
import 'package:firestore_project/modules/user_module/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/controller.dart';

class WeatherRepostScreen extends ConsumerWidget {
  WeatherRepostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationDetails = ref.watch(locationDetailsProvider).data;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              FilePickerComponent(),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                  child: FutureBuilder(
                future: locationDetails != null
                    ? WeatherService().fetchWeatherReport(locationDetails)
                    : null,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                        itemCount: snapshot.data?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) =>
                            WeatherCard(weatherReport: snapshot.data![index]));
                  } else {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.sp),
                        child: Text(
                            "Location details not found, to view weather details please provide accurate location details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ),
                    );
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

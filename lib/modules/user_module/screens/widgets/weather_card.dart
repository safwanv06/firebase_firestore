import 'package:firestore_project/modules/user_module/services/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weatherReport});

  final WeatherReport weatherReport;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/cloud_image.png"))),
      width: ScreenUtil().screenWidth / 2,
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  weatherReport.weather,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp),
                ),
              ),
              Image.network(
                "http://openweathermap.org/img/w/${weatherReport.icon}.png",
                height: 40.h,
                width: 40.h,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox();
                },
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Expanded(
            child: Text(
              weatherReport.description ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            weatherReport.location ?? "",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}

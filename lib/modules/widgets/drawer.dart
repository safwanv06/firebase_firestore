import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/authentication/screen/authentication_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth / 1.2,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: ScreenUtil().screenHeight / 4,
            width: ScreenUtil().screenWidth / 1.2,
            color: Colors.blue,
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
          SizedBox(height: 20.sp,),
          InkWell(
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthenticationView(),
                  ));
            },
            child: Container(
              width: ScreenUtil().screenWidth / 2,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(16.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Center(
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

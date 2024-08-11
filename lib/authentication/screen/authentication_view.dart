import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/modules/admin_module/screens/dashboard_view.dart';
import 'package:firestore_project/modules/user_module/screens/user_dashboard_view.dart';
import 'package:firestore_project/modules/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isHidden = true;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                controller: emailController,
              ),
              SizedBox(
                height: 16.h,
              ),
              StatefulBuilder(builder: (context, setState) {
                return TextField(
                  obscureText: isHidden,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        child: Icon(
                            isHidden == true ? Icons.lock : Icons.lock_open),
                      )),
                  controller: passwordController,
                );
              }),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                  onTap: () async {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then(
                      (value) {
                        if(value.user?.email=="admin@gmail.com"){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboardView(),));
                        }
                        else if(value.user?.email=="user@gmail.com"){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDashboardView(),));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("User not found!!")));
                        }
                      },
                    ).onError(
                      (error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Authentication Failed!!")));
                      },
                    );
                  },
                  buttonName: "Login"),
            ],
          ),
        ),
      ),
    );
  }
}

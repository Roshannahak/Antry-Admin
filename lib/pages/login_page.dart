import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:antry_admin/res/image.dart';
import 'package:antry_admin/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum UserType {
  Admin,
  SuperAdmin,
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserType userType = UserType.Admin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                child: Center(
                    child: Image.asset(
                  loginDoodle,
                  width: 550.w,
                  height: 550.h,
                )),
              )),
          Expanded(
            flex: 4,
            child: Center(
              child: Container(
                width: 300.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(antryLogo, width: 180.w),
                    SizedBox(height: 20.h),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      cursorColor: Colors.black,
                      decoration:
                          loginTextFieldDecoration(leble: "Employee Id"),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: loginTextFieldDecoration(leble: "Contact No"),
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      height: 35,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, RoutePath.dashboard),
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            backgroundColor: MaterialStateProperty.all(
                                AppColor.primaryColor)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

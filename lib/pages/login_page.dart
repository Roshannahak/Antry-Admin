import 'package:antry_admin/components/progress_loadder.dart';
import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/controller/adminlogin_provider.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:antry_admin/res/image.dart';
import 'package:antry_admin/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
  final formKey = GlobalKey<FormState>();
  final empIdController = TextEditingController();
  final contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminLoginProvider>(context);
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Row(
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
                        controller: empIdController,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) return "*required";
                          return null;
                        },
                        decoration:
                            loginTextFieldDecoration(leble: "Employee Id"),
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        controller: contactController,
                        obscureText: true,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty)
                            return "*required";
                          else if (value.length > 10 || value.length < 10)
                            return "*enter valid mobile no";
                          return null;
                        },
                        decoration:
                            loginTextFieldDecoration(leble: "Contact No"),
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        height: 35,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              provider.setIsLoad = true;
                              provider.loginRequestProvider(
                                  context: context,
                                  empId: empIdController.text.trim(),
                                  contactNo: contactController.text.trim());
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              provider.getIsLoad
                                  ? circulerLoadder(height: 20.r, width: 20.r)
                                  : SizedBox(),
                                  SizedBox(width: 5),
                              Text(
                                "SUBMIT",
                                style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
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
      ),
    );
  }
}

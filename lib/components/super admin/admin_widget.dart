import 'package:antry_admin/components/progress_loadder.dart';
import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/components/super%20admin/adminlist_viewholder.dart';
import 'package:antry_admin/controller/admin_provider.dart';
import 'package:antry_admin/model/adminlist_model.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

addAdminDialog(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final empIdCtrl = TextEditingController();
  final departmentCtrl = TextEditingController();
  final contactNoCtrl = TextEditingController();
  Dialog dialog = Dialog(
    backgroundColor: Colors.white,
    child: Form(
      key: formKey,
      child: Consumer<AdminProvider>(builder: (context, provider, child) {
        return Container(
          width: 500.w,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: AppColor.primaryColor)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Admin Registration",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: IconButton(
                          splashRadius: 16,
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close_rounded,
                              size: 24, color: Colors.black87)),
                    )
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: nameCtrl,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: fieldInputDecoration(label: "FullName"),
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          controller: empIdCtrl,
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) return "required";
                            return null;
                          },
                          cursorColor: Colors.black,
                          decoration: fieldInputDecoration(
                              label: "Emp Id", hintText: "Ex: 123"),
                        )),
                    SizedBox(width: 15),
                    Expanded(
                        flex: 7,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          controller: departmentCtrl,
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) return "required";
                            return null;
                          },
                          cursorColor: Colors.black,
                          decoration: fieldInputDecoration(label: "Department"),
                        ))
                  ],
                ),
                SizedBox(height: 18),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: contactNoCtrl,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  maxLength: 10,
                  cursorColor: Colors.black,
                  decoration: fieldInputDecoration(label: "Contact No"),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.setSubmitLoadder = true;
                        provider.addAdminProvider(
                            context: context,
                            employeeId: empIdCtrl.text.trim(),
                            fullName: nameCtrl.text.trim(),
                            department: departmentCtrl.text.trim(),
                            contactNo: contactNoCtrl.text.trim());
                      }
                    },
                    child: provider.getSubmitLoadder
                        ? circulerLoadder(height: 20.r, width: 20.r)
                        : Text("Submit"),
                    style: primaryButtonStyle()),
                SizedBox(height: 10)
              ],
            ),
          ),
        );
      }),
    ),
  );
  showDialog(context: context, builder: (context) => dialog);
}

Widget adminListWidget(
        {required BuildContext context, required AdminProvider provider}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 14),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    "Admin",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 26,
                        width: 26,
                        child: IconButton(
                          onPressed: () {
                            provider.setIsLoad = true;
                            provider.fetchAdminListProvider();
                          },
                          tooltip: "Refresh",
                          splashRadius: 20,
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.refresh, color: Colors.black87),
                          iconSize: 24,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                          onPressed: () => addAdminDialog(context),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 10)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black87),
                              shadowColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          icon: Icon(Icons.add, color: Colors.white, size: 18),
                          label: Text("ADD",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12))),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 207, 207, 207)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Emp ID",
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Name",
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Department",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Contact No",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: provider.getIsLoad
                ? progressLoadder()
                : ListView.separated(
                    padding: EdgeInsets.only(top: 5),
                    itemBuilder: (context, index) {
                      Admin admin = provider.getAdminList[index];
                      return AdminViewHolder(
                          empid: admin.empid!,
                          name: admin.fullname!,
                          department: admin.department!,
                          contactno: admin.contactno!);
                    },
                    separatorBuilder: (context, index) => Divider(
                        color: Color.fromARGB(255, 218, 218, 218), height: 1),
                    itemCount: provider.adminCount),
          )
        ],
      ),
    );

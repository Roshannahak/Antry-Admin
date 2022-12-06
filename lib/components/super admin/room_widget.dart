import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/components/super%20admin/roomlist_viewholder.dart';
import 'package:antry_admin/controller/generate_pdf.dart';
import 'package:antry_admin/controller/roomlist_provider.dart';
import 'package:antry_admin/model/roomlist_model.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

createRoomDialog(BuildContext context) {
  Dialog dialog = Dialog(
    backgroundColor: Colors.white,
    child: Container(
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
                  "Create Rooms",
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
              maxLines: 1,
              validator: (value) {
                if (value!.isEmpty) return "required";
                return null;
              },
              cursorColor: Colors.black,
              decoration: fieldInputDecoration(label: "Room Name"),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) return "required";
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: fieldInputDecoration(
                          label: "Room No", hintText: "Ex: G-09"),
                    )),
                SizedBox(width: 15),
                Expanded(
                    flex: 7,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
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
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {},
                child: Text("Submit"),
                style: primaryButtonStyle()),
            SizedBox(height: 10)
          ],
        ),
      ),
    ),
  );
  showDialog(context: context, builder: (context) => dialog);
}

Widget roomListWidget(
        {required BuildContext context, required RoomListProvider provider}) =>
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
                    "Rooms",
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
                          onPressed: () {},
                          tooltip: "Refresh",
                          splashRadius: 20,
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.refresh, color: Colors.black87),
                          iconSize: 24,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                          onPressed: () => createRoomDialog(context),
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
                      "Room No",
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Room Name",
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Department",
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.only(top: 5),
                itemBuilder: (context, index) {
                  Room room = provider.getRoomList[index];
                  return RoomViewHolder(
                      roomno: room.roomno!,
                      roomname: room.roomname!,
                      department: room.departmentname!);
                },
                separatorBuilder: (context, index) => Divider(
                    color: Color.fromARGB(255, 218, 218, 218), height: 1),
                itemCount: provider.roomCount),
          )
        ],
      ),
    );

Widget qrPrintPreview() => Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Generated QR Code",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
            Divider(thickness: 1, color: Colors.grey[350]),
            SizedBox(height: 16),
            Container(
              child: Column(
                children: [
                  Text(
                    "Intel Lab",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  QrImage(
                    data: "room id",
                    size: 170,
                    padding: EdgeInsets.zero,
                  ),
                  Text("scan me", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  Text(
                    "G-09",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 1, color: Colors.grey[350]),
            SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () => generateQrcodePdf(),
                style: primaryButtonStyle(),
                icon: Icon(Icons.print, size: 18),
                label: Text("Print"))
          ],
        ),
      ),
    );

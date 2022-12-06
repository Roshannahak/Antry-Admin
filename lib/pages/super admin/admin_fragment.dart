import 'package:antry_admin/components/super%20admin/admin_widget.dart';
import 'package:antry_admin/controller/adminlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminFragment extends StatefulWidget {
  AdminFragment({Key? key}) : super(key: key);

  @override
  State<AdminFragment> createState() => _AdminFragmentState();
}

class _AdminFragmentState extends State<AdminFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AdminListProvider>(context, listen: false).fetchAdminListProvider();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminListProvider>(context);
    return adminListWidget(context: context, provider: provider);
  }
}

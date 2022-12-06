import 'package:antry_admin/components/visitorfragment_widgets.dart';
import 'package:antry_admin/controller/visitorlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisitorFragment extends StatefulWidget {
  VisitorFragment({Key? key}) : super(key: key);

  @override
  State<VisitorFragment> createState() => _VisitorFragmentState();
}

class _VisitorFragmentState extends State<VisitorFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VisitorListProvider>(context, listen: false)
        .fetchVisitorListProvider();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VisitorListProvider>(context);
    return Row(
      children: [
        Expanded(
            flex: 6,
            child: visitorListWidget(provider: provider, context: context)),
        Expanded(child: Container())
      ],
    );
  }
}

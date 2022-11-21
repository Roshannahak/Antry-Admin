import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';

/*
ValueChanged<T> = void Function(T value) 
Signature for callbacks that report that an underlying value has changed. 
See also: ValueSetter, for callbacks that report that a value has been set.
*/
typedef ValueChanged<T> = void Function(T index);

class SideNavItems extends StatefulWidget {
  SideNavItems(
      {Key? key,
      required this.tabs,
      this.selectedIndex = 0,
      this.onTabSelected})
      : super(key: key);

  final List<String> tabs;

  final int selectedIndex;

  final ValueChanged<int>? onTabSelected;

  @override
  State<SideNavItems> createState() => _SideNavItemsState();
}

class _SideNavItemsState extends State<SideNavItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.tabs.length; i++)
          GestureDetector(
            onTap: () {
              if (widget.onTabSelected != null) widget.onTabSelected!(i);
            },
            child: NavigationItem(
              title: widget.tabs[i],
              selectedIndex: widget.selectedIndex,
              currentIndex: i,
            ),
          )
      ],
    );
  }
}

class NavigationItem extends StatefulWidget {
  NavigationItem(
      {Key? key,
      required this.title,
      required this.selectedIndex,
      this.currentIndex})
      : super(key: key);

  final String title;
  final int selectedIndex;
  final int? currentIndex;

  @override
  State<StatefulWidget> createState() => _NavigationItem();
}

class _NavigationItem extends State<NavigationItem> {
  bool isHovered = false;
  onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: widget.selectedIndex == widget.currentIndex
                ? AppColor.primaryColor
                : isHovered
                    ? AppColor.primaryColor50
                    : Colors.white),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 16,
                color: widget.selectedIndex == widget.currentIndex
                    ? Colors.white
                    : Color.fromARGB(188, 0, 0, 0),
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

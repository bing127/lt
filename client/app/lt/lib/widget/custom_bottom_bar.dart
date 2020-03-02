import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    this.color,
    this.fabLocation,
    this.shape,
    this.items,
    this.currentIndex: 0,
    this.onTap,
  });

  final ValueChanged<int> onTap;
  final Color color;
  final int currentIndex;
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;
  final List<BottomNavigationBarItemData> items;

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  static final List<FloatingActionButtonLocation> kCenterLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  addItem(List<Widget> rowContents, int index, BuildContext context) {
    var item = widget.items[index];
    bool isSelect;
    if (widget.currentIndex == 2) {
      isSelect = false;
    } else {
      isSelect = (widget.currentIndex > 1
          ? (widget.currentIndex - 1)
          : widget.currentIndex) ==
          index;
    }

    rowContents.add(
      Expanded(
        child: new InkResponse(
          onTap: () {
            widget.onTap(index);
          },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IndexedStack(
                index: isSelect ? 1 : 0,
                children: <Widget>[
                  Image.asset(
                    item.normalIcon,
                  ),
                  Image.asset(
                    item.selectIcon,
                  ),
                ],
              ),
              new Text(
                item.title,
                style: TextStyle(
                    color:
                    isSelect ? Theme.of(context).accentColor : widget.color,
                    fontSize: 10.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowContents = <Widget>[];
    addItem(rowContents, 0, context);
    addItem(rowContents, 1, context);
    if (kCenterLocations.contains(widget.fabLocation)) {
      rowContents.add(
        const Expanded(child: SizedBox()),
      );
    }
    addItem(rowContents, 2, context);
    addItem(rowContents, 3, context);

    return BottomAppBar(
      color: widget.color,
      child: SizedBox(
        height: 49.0,
        child: Row(children: rowContents),
      ),
      shape: widget.shape,
    );
  }
}

class BottomNavigationBarItemData {
  final String normalIcon;
  final String selectIcon;
  final String title;

  BottomNavigationBarItemData({this.normalIcon, this.selectIcon, this.title});
}
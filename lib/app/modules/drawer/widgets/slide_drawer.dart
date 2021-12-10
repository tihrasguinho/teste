import 'package:flutter/material.dart';
import 'package:test/app/modules/drawer/models/drawer_item_model.dart';

class SlideDrawer extends StatefulWidget {
  const SlideDrawer({
    Key? key,
    required this.body,
    required this.items,
    this.showAppBar = false,
    this.appBarColor,
    this.appBarTitle,
    this.appBarCenterTitle,
    this.appBarIconLeading,
    this.appBarElevation = 0.0,
    this.appBarAnimatedIcon = false,
    this.menuBackgroundColor,
    this.onItemSelected,
  }) : super(key: key);

  final Widget body;
  final List<DrawerItemModel> items;
  final bool showAppBar;
  final Color? appBarColor;
  final String? appBarTitle;
  final bool? appBarCenterTitle;
  final IconData? appBarIconLeading;
  final double appBarElevation;
  final bool appBarAnimatedIcon;
  final Color? menuBackgroundColor;
  final ValueChanged<int>? onItemSelected;

  @override
  _SlideDrawerState createState() => _SlideDrawerState();
}

class _SlideDrawerState extends State<SlideDrawer>
    with SingleTickerProviderStateMixin {
  // Animation Controller for all drawer
  late final _ctrl = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 350),
  );

  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  void close() => _ctrl.reverse();

  void open() => _ctrl.forward();

  void toggle() {
    if (_ctrl.isCompleted) {
      close();
    } else {
      open();
    }
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft =
        _ctrl.isDismissed && startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight =
        _ctrl.isCompleted && startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _ctrl.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_ctrl.isDismissed || _ctrl.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _ctrl.fling(velocity: visualVelocityInPx);
    } else if (_ctrl.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _ctrl,
            builder: (context, _) {
              var _animVal = _ctrl.value;
              var _translateVal = _animVal * (_width * 0.7);

              return Transform(
                transform: Matrix4.identity()..translate(_translateVal),
                child: Stack(
                  children: [
                    Scaffold(
                      appBar: widget.showAppBar
                          ? AppBar(
                              elevation: widget.appBarElevation,
                              backgroundColor: widget.appBarColor ??
                                  Theme.of(context).primaryColor,
                              title: Text(widget.appBarTitle ?? ''),
                              centerTitle: widget.appBarCenterTitle ?? false,
                              leading: IconButton(
                                onPressed: () {
                                  toggle();
                                },
                                icon: widget.appBarAnimatedIcon
                                    ? AnimatedIcon(
                                        icon: AnimatedIcons.menu_arrow,
                                        progress:
                                            Tween<double>(begin: 0.0, end: 1.0)
                                                .animate(_ctrl),
                                      )
                                    : Icon(
                                        widget.appBarIconLeading ??
                                            Icons.menu_rounded,
                                      ),
                              ),
                            )
                          : null,
                      body: widget.body,
                    ),
                    _animVal > 0.1
                        ? Positioned.fill(
                            child: Opacity(
                              opacity: _animVal,
                              child: Container(
                                color: Colors.black26,
                              ),
                            ),
                          )
                        : SizedBox(),
                    _animVal > 0.1
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: GestureDetector(
                              onTap: () => close(),
                              child: Container(
                                height: kToolbarHeight,
                                width: kToolbarHeight,
                                color: Colors.transparent,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: -(_width * 0.7),
            child: AnimatedBuilder(
              animation: _ctrl,
              builder: (context, _) {
                var _animVal = _ctrl.value;
                var _translateVal = -_animVal * -(_width * 0.7);

                return Transform(
                  transform: Matrix4.identity()..translate(_translateVal),
                  child: SizedBox(
                    width: _width * 0.7,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Material(
                            color: widget.menuBackgroundColor ??
                                Theme.of(context).primaryColor,
                          ),
                        ),
                        _animVal > 0.1
                            ? Positioned.fill(
                                child: Opacity(
                                  opacity: _animVal,
                                  child: Container(
                                    color: Colors.black26,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Material(
                          color: Colors.transparent,
                          child: Theme(
                            data: ThemeData.dark(),
                            child: Column(
                              children: [
                                Expanded(child: SizedBox()),
                                ...widget.items
                                    .map((e) => ListTile(
                                          title: Text(e.title),
                                          leading: Icon(e.icon),
                                          onTap: () {
                                            toggle();

                                            widget.onItemSelected!(
                                                widget.items.indexOf(e));
                                          },
                                        ))
                                    .toList(),
                                Expanded(flex: 3, child: SizedBox()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? child;
  final ScrollNotificationPredicate notificationPredicate;

  const AppBar({
    super.key,
    this.child,
    this.notificationPredicate = defaultScrollNotificationPredicate,
  });

  @override
  State<AppBar> createState() => _AppBarState();

  @override
  Size get preferredSize => const Size(0, 0);
}

class _AppBarState extends State<AppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);

    if (scaffoldState != null &&
        (scaffoldState.isDrawerOpen || scaffoldState.isEndDrawerOpen)) {
      return;
    }
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        widget.notificationPredicate(notification)) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    return Material(
      type: MaterialType.canvas,
      child: NavigationToolbar(middle: widget.child, centerMiddle: true),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget? child;

  @override
  final TickerProvider vsync;

  _SliverAppBarDelegate({required this.child, required this.vsync});

  // The height of the app bar when it is fully expanded.
  @override
  double get maxExtent => 20;

  @override
  double get minExtent => 20;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return child != oldDelegate.child ||
        vsync != oldDelegate.vsync ||
        snapConfiguration != oldDelegate.snapConfiguration ||
        stretchConfiguration != oldDelegate.stretchConfiguration ||
        showOnScreenConfiguration != oldDelegate.showOnScreenConfiguration;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AppBar(child: child);
  }
}

class Grabber extends StatefulWidget {
  const Grabber({super.key});

  @override
  State<Grabber> createState() => _GrabberState();
}

class _GrabberState extends State<Grabber> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        vsync: this,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          height: 4,
          width: 76,
        ),
      ),
    );
  }
}

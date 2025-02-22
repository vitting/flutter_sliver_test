import 'package:flutter/material.dart';
import 'package:sliver_test_2025/grabber.dart';

class Sliver3 extends StatelessWidget {
  const Sliver3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ColoredBox(color: Colors.yellow, child: Placeholder()),
          DraggableScrollableSheet(
            maxChildSize: 0.9,
            minChildSize: 0.3,
            initialChildSize: 0.5,
            expand: true,
            snap: true,
            snapSizes: const [0.3, 0.5, 0.7],
            builder: (BuildContext context, scrollController) {
              return SafeArea(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Material(
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        const SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          sliver: Grabber(),
                        ),
                        SliverList.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              tileColor: Colors.red,
                              title: Text('List item $index'),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 2);
                          },
                          itemCount: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

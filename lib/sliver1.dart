import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Sliver1 extends StatelessWidget {
  const Sliver1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Sliver 1'),
              centerTitle: true,
              // pinned: true,
            ),
            PinnedHeaderSliver(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),

                height: 100,
                child: const Center(child: Text('PinnedHeaderSliver1')),
              ),
            ),
            SliverList.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      tileColor: Colors.green,
                      title: Text('Tile $index'),
                    ),
                    const Gap(10),
                  ],
                );
              },
            ),
            PinnedHeaderSliver(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.orange,
                height: 80,
                child: const Center(child: Text('PinnedHeaderSliver2')),
              ),
            ),
            SliverList.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: Colors.blue,
                  title: Text('Tile $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class Sliver2 extends StatelessWidget {
  const Sliver2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.red),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Sliver 2'),
                centerTitle: true,
                // pinned: true,
              ),
              const SliverGap(20),

              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: ColoredBox(color: Colors.yellow),
                ),
              ),
              SliverResizingHeader(
                child: SizedBox(
                  height: 400,
                  child: Image.network(
                    fit: BoxFit.cover,
                    'https://loremflickr.com/600/400/dog?random=1',
                  ),
                ),
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
                  child: const Center(child: Text('SliverList.builder')),
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
                      const Gap(2),
                    ],
                  );
                },
              ),
              PinnedHeaderSliver(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 40,
                  child: const Center(child: Text('SliverGrid.builder')),
                ),
              ),
              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  crossAxisCount: 3,
                ),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Image.network(
                    'https://loremflickr.com/200/200/dog?random=$index',
                  );
                },
              ),
              SliverOpacity(
                opacity: 0.5,
                sliver: PinnedHeaderSliver(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.orange,
                    height: 50,
                    child: const Center(child: Text('SliverList.separated')),
                  ),
                ),
              ),

              SliverList.separated(
                itemCount: 20,
                separatorBuilder:
                    (context, index) =>
                        Container(height: 10, color: Colors.blueGrey),

                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: Colors.blue,
                    title: Text('Tile $index'),
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: Text(
                  'Proin ullamcorper orci justo, at elementum lectus varius mollis. Donec convallis velit turpis, vitae facilisis nisl finibus ut. Nam pellentesque, sem ut vulputate lobortis, ex purus rutrum quam, in consequat turpis orci id turpis. Nullam vulputate vehicula semper. Nullam ac felis sit amet nisi pellentesque dignissim a nec quam. Etiam dictum tellus sit amet justo faucibus, non luctus velit volutpat. Pellentesque a eros vel orci porta rhoncus. Fusce venenatis faucibus nulla vel eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent volutpat at felis a iaculis. Pellentesque aliquam mollis mi non malesuada. Sed lorem leo, molestie ac efficitur at, bibendum hendrerit lectus. Sed porttitor eros vel tortor scelerisque ultricies.',
                ),
              ),
              PinnedHeaderSliver(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.pink,
                  height: 30,
                  child: const Center(child: Text('SliverList.builder')),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverList.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          tileColor: Colors.purple,
                          title: Text('Tile $index'),
                        ),
                        if (index != 19) const Gap(3),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

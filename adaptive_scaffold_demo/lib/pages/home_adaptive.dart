import 'package:adaptive_scaffold_demo/model/item.dart';
import 'package:adaptive_scaffold_demo/pages/example_page.dart';
import 'package:adaptive_scaffold_demo/widgets/detail_tile.dart';
import 'package:adaptive_scaffold_demo/widgets/item_list.dart';
import 'package:custom_adaptive_scaffold/custom_adaptive_scaffold.dart';
import 'package:flutter/material.dart';

@deprecated
class HomeAdaptive extends StatefulWidget {
  const HomeAdaptive({super.key});

  @override
  State<StatefulWidget> createState() => _HomeAdaptiveState();
}

class _HomeAdaptiveState extends State<HomeAdaptive> {
  final int _transitionDuration = 200;
  int selectedNavigation = 0;

  int? selected;

  void selectCard(int? index) {
    setState(() {
      selected = index;
    });
  }

  List<NavigationDestination> destinations = <NavigationDestination>[
    const NavigationDestination(
      label: 'Inbox',
      icon: Icon(Icons.inbox),
    ),
    const NavigationDestination(
      label: 'Articles',
      icon: Icon(Icons.article_outlined),
    ),
    const NavigationDestination(
      label: 'Chat',
      icon: Icon(Icons.chat_bubble_outline),
    ),
    const NavigationDestination(
      label: 'Video',
      icon: Icon(Icons.video_call_outlined),
    )
  ];

  @override
  Widget build(BuildContext context) {
    // AdaptiveLayout has a number of slots that take SlotLayouts and these
    // SlotLayouts' configs take maps of Breakpoints to SlotLayoutConfigs.
    return AdaptiveLayout(
      // An option to override the default transition duration.
      transitionDuration: Duration(milliseconds: _transitionDuration),
      // Primary navigation config has nothing from 0 to 600 dp screen width,
      // then an unextended NavigationRail with no labels and just icons then an
      // extended NavigationRail with both icons and labels.
      primaryNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.medium: SlotLayout.from(
            inAnimation: AdaptiveScaffold.leftOutIn,
            key: const Key('Primary Navigation Medium'),
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedNavigation,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  selectedNavigation = newIndex;
                });
              },
              leading: const Icon(Icons.menu),
              destinations: destinations
                  .map((NavigationDestination destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
            ),
          ),
          Breakpoints.mediumLarge: SlotLayout.from(
            key: const Key('Primary Navigation MediumLarge'),
            inAnimation: AdaptiveScaffold.leftOutIn,
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedNavigation,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  selectedNavigation = newIndex;
                });
              },
              extended: true,
              leading: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'REPLY',
                  ),
                  Icon(Icons.menu_open)
                ],
              ),
              destinations: destinations
                  .map((NavigationDestination destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
            ),
          ),
          Breakpoints.large: SlotLayout.from(
            key: const Key('Primary Navigation Large'),
            inAnimation: AdaptiveScaffold.leftOutIn,
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedNavigation,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  selectedNavigation = newIndex;
                });
              },
              extended: true,
              leading: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'REPLY',
                  ),
                  Icon(Icons.menu_open)
                ],
              ),
              destinations: destinations
                  .map((NavigationDestination destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
            ),
          ),
          Breakpoints.extraLarge: SlotLayout.from(
            key: const Key('Primary Navigation ExtraLarge'),
            inAnimation: AdaptiveScaffold.leftOutIn,
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedNavigation,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  selectedNavigation = newIndex;
                });
              },
              extended: true,
              leading: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'REPLY',
                  ),
                  Icon(Icons.menu_open)
                ],
              ),
              destinations: destinations
                  .map((NavigationDestination destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
            ),
          ),
        },
      ),
      // Body switches between a ListView and a GridView from small to medium
      // breakpoints and onwards.
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
            key: const Key('Body Small'),
            builder: (_) => (selectedNavigation == 0)
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                    child: ItemList(
                      selected: selected,
                      items: allItems,
                      selectCard: selectCard,
                    ),
                  )
                : const ExamplePage(),
          ),
        },
      ),
      secondaryBody: selectedNavigation == 0
          ? SlotLayout(
              config: <Breakpoint, SlotLayoutConfig?>{
                Breakpoints.mediumAndUp: SlotLayout.from(
                  // This overrides the default behavior of the secondaryBody
                  // disappearing as it is animating out.
                  outAnimation: AdaptiveScaffold.stayOnScreen,
                  key: const Key('Secondary Body'),
                  builder: (_) => SafeArea(
                    child: DetailTile(item: allItems[selected ?? 0]),
                  ),
                )
              },
            )
          : null,

      // BottomNavigation is only active in small views defined as under 600 dp
      // width.
      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('Bottom Navigation Small'),
            inAnimation: AdaptiveScaffold.bottomToTop,
            outAnimation: AdaptiveScaffold.topToBottom,
            builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
              destinations: destinations,
              currentIndex: selectedNavigation,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  selectedNavigation = newIndex;
                });
              },
            ),
          )
        },
      ),
    );
  }
}

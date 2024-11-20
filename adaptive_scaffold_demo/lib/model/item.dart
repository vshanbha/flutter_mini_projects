import 'package:adaptive_scaffold_demo/model/email.dart';
import 'package:flutter/material.dart';

class Item {
  const Item({
    required this.title,
    required this.emails,
  });

  final String title;
  final List<Email>? emails;
}

/// List of items, each representing a thread of emails which will populate
/// the different layouts.
const List<Item> allItems = <Item>[
  Item(
    title: 'Dinner Club',
    emails: <Email>[
      Email(
        sender: 'So Duri',
        recipients: 'me, Ziad and Lily',
        image: Icons.stream,
        time: '20 min',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec gravida tellus, vel scelerisque nisi. Mauris egestas, augue nec dictum tempus, diam sapien luctus odio, a posuere sem neque at nulla. Vivamus pulvinar nisi et dapibus dapibus. Donec euismod pellentesque ultrices. Vivamus quis condimentum metus, in venenatis lorem. Proin suscipit tincidunt eleifend. Praesent a nisi ac ipsum sodales gravida.',
        bodyImage: Icons.stream,
      ),
      Email(
        sender: 'Me',
        recipients: 'me, Ziad, and Lily',
        image: Icons.plumbing,
        time: '4 min',
        body:
            'Donec non mollis nulla, in varius mi. Ut id lorem eget felis lobortis tincidunt. Curabitur facilisis ex vitae tristique efficitur. Aenean eget augue finibus, tempor eros vitae, tempor neque. In sed pellentesque elit. Donec lacus lacus, malesuada in tincidunt sit amet, condimentum vel enim. Cras dapibus erat quis nisl hendrerit, vel pretium turpis condimentum. ',
        bodyImage: Icons.plumbing,
      ),
      Email(
        sender: 'Ziad Aouad',
        recipients: 'me, Ziad and Lily',
        image: Icons.museum,
        time: '2 min',
        body:
            'Duis sit amet nibh a diam placerat aliquam nec ac mi. Aenean hendrerit efficitur tellus, non pharetra eros posuere sit amet. Maecenas interdum lacinia eleifend. Nam efficitur tellus et dolor vestibulum, non dictum quam iaculis. Aenean id nulla ut erat placerat feugiat. Mauris in quam metus. Aliquam erat volutpat.',
        bodyImage: Icons.museum,
      ),
    ],
  ),
  Item(
    title: '7 Best Yoga Poses',
    emails: <Email>[
      Email(
        sender: 'Elaine Howley',
        time: '2 hours',
        body:
            'Curabitur tincidunt purus at vulputate mattis. Nam lectus urna, varius eget quam in, ultricies ultrices libero. Curabitur rutrum ultricies varius. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vulputate auctor est, non semper velit eleifend sit amet.',
        image: Icons.podcasts,
        bodyImage: Icons.abc,
        recipients: '',
      ),
    ],
  ),
  Item(
    title: 'A Programming Language',
    emails: <Email>[
      Email(
        sender: 'Laney Mansell',
        time: '10 min',
        body:
            'Cras egestas ultricies elit, vitae interdum lorem aliquam et. Donec quis arcu a quam tempor rutrum vitae in lectus. Nullam elit nunc, lacinia sed luctus non, mollis id nulla. Morbi luctus turpis sapien, id molestie ante maximus vel. Vivamus sagittis consequat nisl nec placerat.',
        image: Icons.pedal_bike,
        bodyImage: Icons.pedal_bike,
        recipients: '',
      ),
    ],
  ),
];

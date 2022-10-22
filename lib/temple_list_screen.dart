// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'temple_list_contents_screen.dart';
import 'temple_list_menu_screen.dart';

class TempleListScreen extends ConsumerWidget {
  const TempleListScreen({super.key, required this.year});

  final String year;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          TempleListMenuScreen(year: year),
          TempleListContentsScreen(year: year),
        ],
      ),
    );
  }
}

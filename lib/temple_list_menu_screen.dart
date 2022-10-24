// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temple/screens/temple_search_screen.dart';
import 'package:temple/temple_list_screen.dart';

import 'utility/utility.dart';

import 'viewmodel/app_value_viewmodel.dart';
import 'viewmodel/temple_all_viewmodel.dart';

class TempleListMenuScreen extends ConsumerWidget {
  TempleListMenuScreen({super.key, required this.year});

  final String year;

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final yearListState = ref.watch(yearListProvider);

    return Stack(
      fit: StackFit.expand,
      children: [
        _utility.getBackGround(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TempleSearchScreen(year: year),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text('Search'),
                ),
              ),
            ),
            Expanded(
              child: makeYearList(data: yearListState),
            ),
          ],
        ),
      ],
    );
  }

  ///
  Widget makeYearList({required Map<String, int> data}) {
    final list = <Widget>[];
    data.forEach((key, value) {
      list.add(
        GestureDetector(
          onTap: () {
            _ref.watch(appValueProvider.notifier).setDrawnOpen(value: false);

            Navigator.pushReplacement(
              _context,
              MaterialPageRoute(
                builder: (context) => TempleListScreen(year: key),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Text('$key（${value.toString()}）'),
          ),
        ),
      );
    });

    return Column(
      children: list,
    );
  }
}

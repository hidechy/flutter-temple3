// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utility/utility.dart';

import 'viewmodel/app_value_viewmodel.dart';
import 'viewmodel/temple_all_viewmodel.dart';

import 'screens/temple_detail_display_screen.dart';

class TempleListContentsScreen extends ConsumerWidget {
  TempleListContentsScreen({super.key, required this.year});

  final String year;

  double xOffset = 0;
  double yOffset = 0;

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templeAllState = ref.watch(templeAllProvider(year));

    final drawnOpenState = ref.watch(drawnOpenProvider);

    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      transform: Matrix4.translationValues(
        xOffset,
        yOffset,
        0,
      )..rotateZ(drawnOpenState == 1 ? (pi / 60) : 0),
      curve: Curves.elasticIn,
      decoration: const BoxDecoration(color: Colors.black),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown.withOpacity(0.5),
          title: Text('Temple List $year'),
          leading: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                if (drawnOpenState == 1) {
                  xOffset = 0;
                  yOffset = 0;
                  ref.watch(drawnOpenProvider.notifier).setValue(value: 0);
                } else {
                  xOffset = size.width - 200;
                  yOffset = size.height / 10;
                  ref.watch(drawnOpenProvider.notifier).setValue(value: 1);
                }
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 3000),
                switchInCurve: Curves.easeInOutBack,
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: (drawnOpenState == 1)
                    ? const Icon(Icons.arrow_back,
                        size: 40, key: ValueKey('close'))
                    : const Icon(Icons.arrow_forward,
                        size: 40, key: ValueKey('open')),
              ),
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            _utility.getBackGround(),
            Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final date = templeAllState.record[index].date
                          .toString()
                          .split(' ')[0];

                      return Card(
                        color: Colors.black.withOpacity(0.2),
                        child: ListTile(
                          leading: SizedBox(
                            width: 40,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/no_image.png',
                              image: templeAllState.record[index].thumbnail,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(date),
                              Text(templeAllState.record[index].temple),
                              if (templeAllState.record[index].memo != '')
                                Text(
                                  'with.${templeAllState.record[index].memo}',
                                )
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TempleDetailDisplayScreen(
                                    temple: templeAllState.record[index],
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.call_made,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Container(),
                    itemCount: templeAllState.record.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

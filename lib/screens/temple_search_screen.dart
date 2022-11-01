// ignore_for_file: must_be_immutable, cascade_invocations

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../models/name.dart';
import '../models/temple.dart';
import '../temple_list_screen.dart';
import '../viewmodel/app_value_viewmodel.dart';
import '../viewmodel/temple_all_viewmodel.dart';
import '../viewmodel/temple_search_viewmodel.dart';
import 'temple_detail_display_screen.dart';

class TempleSearchScreen extends ConsumerWidget {
  TempleSearchScreen({super.key, required this.year});

  final String year;

  final TextEditingController searchTempleController = TextEditingController();

  late BuildContext _context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;

    final templeSearchState = ref.watch(templeSearchProvider);

    final dateListState = ref.watch(dateListProvider);

    final size = MediaQuery.of(context).size;

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      widget: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onTap: () {
                    ref
                        .watch(appValueProvider.notifier)
                        .setDrawnOpen(value: false);

                    Navigator.pop(context);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TempleListScreen(year: year),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.3),
                          filled: true,
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 4,
                          ),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              searchTempleController.text = '';
                            },
                            child: const Icon(Icons.change_circle_outlined),
                          )),
                      controller: searchTempleController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .watch(templeSearchProvider.notifier)
                          .getSearchTemple(name: searchTempleController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height / 10 * 8,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final date =
                        '${templeSearchState[index].year}-${templeSearchState[index].month}-${templeSearchState[index].day}';

                    return Card(
                      color: Colors.black.withOpacity(0.2),
                      child: ListTile(
                        title: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: size.height / 6,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(date),
                                  GestureDetector(
                                    onTap: () {
                                      goTempleDetailDisplayScreen(
                                        data: dateListState[date],
                                      );
                                    },
                                    child: const Icon(
                                      Icons.call_made,
                                      color: Colors.redAccent,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                              makeTempleName(name: templeSearchState[index]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(),
                  itemCount: templeSearchState.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///
  Widget makeTempleName({required Name name}) {
    final list = <Widget>[];

    list.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name.data[0].temple),
          Text(name.data[0].address),
        ],
      ),
    );

    if (name.data.length > 1) {
      final list2 = <String>[];

      for (var i = 1; i < name.data.length; i++) {
        list2.add(name.data[i].temple);
      }

      list.add(
        Text(
          'with.${list2.join('、')}',
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  ///
  void goTempleDetailDisplayScreen({Temple? data}) {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) => TempleDetailDisplayScreen(
          temple: data!,
        ),
      ),
    );
  }
}

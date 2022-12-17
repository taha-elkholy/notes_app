import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/constants.dart';


class ColorsNotifier extends StateNotifier<int> {
  ColorsNotifier() : super(colorsList[0]);

  void changeColor(int color) {
    state = color;
  }
}

final colorsProvider = StateNotifierProvider<ColorsNotifier, int>((ref) {
  return ColorsNotifier();
});

class ColorsListView extends ConsumerStatefulWidget {
  const ColorsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends ConsumerState<ColorsListView> {

  @override
  Widget build(BuildContext context) {
    final currentColor = ref.watch(colorsProvider);
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: colorsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
               ref.read(colorsProvider.notifier).changeColor(colorsList[index]);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(colorsList[index]),
                      ),
                    ),
                    if (currentColor == colorsList[index])
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
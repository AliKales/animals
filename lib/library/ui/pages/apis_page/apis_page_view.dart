import 'package:animals/library/api_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:uikit/uikit.dart';

import '../../../../router.dart';

class ApisPageView extends StatefulWidget {
  const ApisPageView({super.key});

  @override
  State<ApisPageView> createState() => _ApisPageState();
}

class _ApisPageState extends State<ApisPageView> {
  int _selectedWidget = -1;

  void _onItemClicked(int index) {
    _changeSelectedWidget(index);
    Future.delayed(context.durationLow).then((value) => _push(index));
  }

  void _changeSelectedWidget(int index) {
    setState(() {
      _selectedWidget = index;
    });
  }

  Future<void> _push(int index) async {
    ApiList apiList = ApiList.values[index];
    if (apiList == ApiList.catGifs) {
      context.push(PagePaths.apiCatPhotos(true));
    } else {
      context.push('/apis/${ApiList.values[index].name}');
    }

    _changeSelectedWidget(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animals"),
      ),
      body: Padding(
        padding: context.paddingNormal,
        //ListView to show all APIs
        //with ListView.separated
        child: _listView(),
      ),
    );
  }

  Widget _listView() {
    return AnimatedListSeparated(
      itemBuilder: (context, index, animation) => SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
          ),
        ),
        child: _item(index, context),
      ),
      count: ApiList.values.length,
      separateWidget: _divider(),
    );
  }

  Widget _item(int index, BuildContext context) {
    return InkWell(
      onTap: () => _onItemClicked(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Text(
                ApiList.values[index].title,
                style: context.textTheme.titleLarge,
              ),
            ).animate().fadeIn(),
            AnimatedRotation(
              duration: context.durationLow,
              turns: _selectedWidget == index ? 0.5 : 0,
              child: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() => const Divider().animate().scale(
      duration: context.durationLow,
      delay: context.durationLow - 200.ms,
      curve: Curves.easeOutBack);
}

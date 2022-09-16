import 'package:animals/common_libs.dart';
import 'package:animals/library/api_list.dart';
import 'package:animals/library/core/models/m_animal.dart';
import 'package:animals/library/core/services/dio/dio_all_animals.dart';
import 'package:animals/library/core/utilities/u_url_launcher.dart';
import 'package:animals/library/ui/components/apis_appbar.dart';
import 'package:animals/library/ui/components/cubit_api_widget/cubit_api_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';

import '../../../core/cubit/cubit_api/cubit_api.dart';

part 'complete_widget.dart';
part 'all_animals_details.dart';

class AllAnimalsPageView extends StatefulWidget {
  const AllAnimalsPageView({super.key, required this.apiList});

  final ApiList apiList;

  @override
  State<AllAnimalsPageView> createState() => _AllAnimalsPageViewState();
}

class _AllAnimalsPageViewState extends State<AllAnimalsPageView> {
  late final ScrollController _scrollController = ScrollController();

  final ValueNotifier<bool> _isScrolled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _scrollControllerListener();
  }

  void _scrollControllerListener() {
    _scrollController.addListener(() {
      double y = _scrollController.offset;

      if (y > 300 && !_isScrolled.value) {
        _isScrolled.value = true;
      } else if (y < 10) {
        _isScrolled.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CubitApi>().reset();

        return true;
      },
      child: Scaffold(
        appBar: ApisAppBar(
          context,
          text: widget.apiList.title,
          resetCubit: true,
          actions: [
            _iconButtonUpArrow(),
          ],
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: CubitApiWidget(
            function: DioAllAnimals(Dio()).fetchData(),
            completeWidget: (p0) {
              if (p0 is List<MAnimal>) {
                return _CompleteWidget(
                  scrollController: _scrollController,
                  animals: p0,
                );
              }
              return const SizedBox.shrink();
            },
            description: "You will see a list of all animals and and details",
          ),
        ),
      ),
    );
  }

  Widget _iconButtonUpArrow() {
    return ValueListenableBuilder(
        valueListenable: _isScrolled,
        builder: (context, _, __) {
          return AnimatedSlide(
            duration: context.durationNormal,
            curve: Curves.ease,
            offset: _isScrolled.value ? const Offset(0, 0) : const Offset(1, 0),
            child: IconButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: context.durationNormal, curve: Curves.bounceOut);
              },
              icon: const Icon(Icons.arrow_upward_sharp),
            ),
          );
        });
  }
}

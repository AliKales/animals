import 'package:animals/library/api_list.dart';
import 'package:animals/library/ui/pages/all_animals_page/all_animals_page_view.dart';
import 'package:animals/library/ui/pages/apis_page/apis_page_view.dart';
import 'package:animals/library/ui/pages/bird_sounds/bird_sounds_view.dart';
import 'package:animals/library/ui/pages/cat_facts/cat_facts_view.dart';
import 'package:animals/library/ui/pages/cat_photos/cat_photos_view.dart';
import 'package:animals/library/ui/pages/dog_facts/dog_facts_view.dart';
import 'package:animals/library/ui/pages/dog_photos/dog_photos_view.dart';
import 'package:animals/library/ui/pages/duck_fox_photos/duck_fox_photos_view.dart';
import 'package:animals/library/ui/pages/start_page/start_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String lastPage = "";

class PagePaths {
  static String start = '/';
  static String apis = '/apis';
  static String apiAllAnimals = '/apis/allAnimals';
  static String apiCatFacts = '/apis/catFacts';
  static String apiDogFacts = '/apis/dogFacts';
  static String apiCatPhotos(bool isGif) =>
      '/apis/catPhotos?gif=${isGif.toString()}';
  static String apiFoxPhotos(bool isGif) =>
      '/apis/foxPhotos?gif=${isGif.toString()}';
  static String apiDogPhotos = '/apis/dogPhotos';
  static String apiShibePhotos = '/apis/shibePhotos';
  static String apiBirds = '/apis/birds';
}

final appRouter = GoRouter(
  redirect: _handleRedirect,
  navigatorBuilder: (context, state, child) => child,
  routes: [
    AppRoute(PagePaths.start, (s) => const StartPageView()),
    AppRoute(PagePaths.apis, (s) => const ApisPageView()),
    AppRoute(
      PagePaths.apiAllAnimals,
      (s) => const AllAnimalsPageView(
        apiList: ApiList.allAnimals,
      ),
    ),
    AppRoute(
      PagePaths.apiCatFacts,
      (s) => const CatFactsView(
        apiList: ApiList.catFacts,
      ),
    ),
    AppRoute(
      PagePaths.apiDogFacts,
      (s) => const DogFactsView(
        apiList: ApiList.dogFacts,
      ),
    ),
    AppRoute(
      PagePaths.apiDogPhotos,
      (s) => const DogPhotosView(
        apiList: ApiList.dogPhotos,
      ),
    ),
    AppRoute(
      PagePaths.apiShibePhotos,
      (s) => const DogPhotosView(
        apiList: ApiList.shibePhotos,
      ),
    ),
    AppRoute(
      "/apis/catPhotos",
      (s) {
        bool? isGif = (s.queryParams['gif'] ?? false) == "true";
        return CatPhotosView(
          apiList: isGif ? ApiList.catGifs : ApiList.catPhotos,
          isGif: isGif,
        );
      },
    ),
    AppRoute(
      "/apis/foxPhotos",
      (s) {
        bool? isGif = (s.queryParams['gif'] ?? false) == "true";
        return DuckFoxPhotosView(
          apiList: ApiList.foxPhotos,
          isGif: isGif,
        );
      },
    ),
    AppRoute(
      PagePaths.apiBirds,
      (s) => const BirdSoundsView(apiList: ApiList.birds),
    ),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder)
      : super(
          path: path,
          pageBuilder: (context, state) => MaterialPage(
            child: builder(state),
          ),
        );
}

String? _handleRedirect(GoRouterState state) {
  if (state.location == lastPage) {
    return null;
  }
  lastPage = state.location;
  return lastPage;
}

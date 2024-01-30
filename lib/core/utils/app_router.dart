import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kHomeView = "/homeView";
  static const String kBookDetailsView = "/bookDetailsView";
  static const String kSearchView = "/searchView";
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
      //     child: BookDetailsView(book: state.extra as BookModel,),
      //   ),
      // ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}

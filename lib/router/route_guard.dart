import 'package:auto_route/auto_route.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';

class RouteGuard extends AutoRedirectGuard {
  final AuthRepository _authRepository;
  RouteGuard(this._authRepository) {
    _authRepository.addListener(() {
      if (!_authRepository.authenticated) {
        reevaluate();
      }
    });
  }
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authRepository.authenticated) return resolver.next();
    router.pushNamed('/login');
  }
}

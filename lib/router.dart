import 'ui/screens/add_company.dart';
import 'ui/screens/home.dart';
import 'ui/screens/search_address.dart';

class AppRouter {
  static const String homePage = '/home';
  static const String addCompanyPage = '/add_company';
  static const String searchAddressPage = '/search_address';

  static final routes = {
    homePage: (context) => const Home(),
    addCompanyPage: (context) => AddCompany(),
    searchAddressPage: (context) => const SearchAddress(),
  };
}

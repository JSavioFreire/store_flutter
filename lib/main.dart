import 'package:store/pages/each_category.dart';
import 'package:store/pages/each_product.dart';
import 'package:store/theme/theme.dart';
import './pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Store',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/eachproduct': (context) => const EachProduct(),
        '/eachcategory' :(context) => const EachCategory()
      },
    );
  }
}

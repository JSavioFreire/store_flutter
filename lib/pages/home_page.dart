import 'package:flutter/material.dart';
import 'package:store/components/menu_category/category.dart';
import 'package:store/components/products/products.dart';
import 'package:store/model/model_api.dart';
import '../components/appBar/app_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier api = ValueNotifier([]);
    ValueNotifier more = ValueNotifier(5);
    callApi() async {
      var client = http.Client();
      try {
        var response = await client
            .get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
        var res = jsonDecode(response.body);
        var resData = res as List;
        api.value = resData.map((e) => Model.fromJson(e)).toList();
      } finally {
        client.close();
      }
    }

    seeMore() {
      if (more.value < api.value.length - 5) {
        more.value += 5;
      }
    }

    callApi();
    return Scaffold(
        appBar: const AppBarDesign(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                  width: double.infinity, height: 300, child: Categorys()),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                child: const Text('All Products',
                    style: TextStyle(color: Colors.black54, fontSize: 30)),
              ),
              Column(
                children: [
                  ValueListenableBuilder(
                      valueListenable: api,
                      builder: (_, value, __) => ValueListenableBuilder(
                          valueListenable: more,
                          builder: (_, moreValue, __) => Column(
                                children: [
                                  for (var i = 0; i < moreValue; i++)
                                    Products(value[i].title, value[i].price,
                                        value[i].description, value[i].images)
                                ],
                              ))),
                  ElevatedButton(
                      onPressed: () => seeMore(), child: const Text('See More'))
                ],
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:store/components/appBar/app_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../components/products/products.dart';
import '../model/model_api.dart';

class EachCategory extends StatelessWidget {
  const EachCategory({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier api = ValueNotifier([]);
    ValueNotifier more = ValueNotifier(15);

    callApi() async {
      var client = http.Client();
      try {
        var response = await client
            .get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
        var res = jsonDecode(response.body);
        var resData = res as List;
        api.value = resData.map((e) => Model.fromJson(e)).toList();
        print(api.value[0].category.name);
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
    final arg = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: const AppBarDesign(),
      body: SingleChildScrollView(
        child: Column(children: [
          ValueListenableBuilder(
              valueListenable: api,
              builder: (_, value, __) => ValueListenableBuilder(
                  valueListenable: more,
                  builder: (_, moreValue, __) => Column(
                        children: [
                          for (var i = 0; i < moreValue; i++)
                            if (arg['category'] == value[i].category.name)
                              Products(value[i].title, value[i].price,
                                  value[i].description, value[i].images)
                        ],
                      ))),
          ElevatedButton(
              onPressed: () => seeMore(), child: const Text('See More'))
        ]),
      ),
    );
  }
}


        
//[Text(arg['category']),]
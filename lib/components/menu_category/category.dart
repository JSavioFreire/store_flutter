import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/modal_categories.dart';

class Categorys extends StatelessWidget {
  const Categorys({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier apiC = ValueNotifier([]);
    callApi() async {
      var client = http.Client();
      try {
        var response = await client
            .get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
        var res = jsonDecode(response.body);
        var resData = res as List;
        apiC.value = resData.map((e) => Categories.fromJson(e)).toList();
      } finally {
        client.close();
      }
    }

    callApi();
    return ValueListenableBuilder(
        valueListenable: apiC,
        builder: (_, value, __) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: value.length,
            itemBuilder: ((_, index) => Container(
                  margin: const EdgeInsets.all(1),
                  child: GridTile(
                      child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/eachcategory', arguments: {
                        'category': value[index].name
                      });
                    },
                    child: Column(
                      children: [
                        Image.network(value[index].image),
                        Text(
                          value[index].name,
                          style: const TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                  )),
                ))));
  }
}

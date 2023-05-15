import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practical_5/network/store/http/http_get_store.dart';
import 'package:provider/provider.dart';

class HttpGetMethod extends StatelessWidget {
  const HttpGetMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.read<HttpGetStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Http Method'),
      ),
      body: Observer(builder: (context) {
        return readStore.result.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: readStore.result.length,
                itemBuilder: (_, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Id is ${readStore.result[index].userId.toString()}'),
                        Text(
                          'Title is ${readStore.result[index].title}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('Body is ${readStore.result[index].body}'),
                      ],
                    ),
                  );
                },
              );
      }),
    );
  }
}

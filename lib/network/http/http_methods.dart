import 'package:flutter/material.dart';
import 'package:practical_5/extension/provider_extension.dart';
import 'package:practical_5/network/http/http_get.dart';
import 'package:practical_5/network/http/http_post.dart';
import 'package:practical_5/network/store/http/http_delete_store.dart';
import 'package:practical_5/network/store/http/http_get_store.dart';
import 'package:practical_5/network/store/http/http_post_store.dart';
import 'package:practical_5/network/store/http/http_update_store.dart';
import 'package:provider/provider.dart';

class HttpMethods extends StatelessWidget {
  const HttpMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const HttpGetMethod().withProvider(HttpGetStore()),
                ),
              ),
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                      providers: [
                        Provider(create: (_) => HttpUpdateStore()),
                        Provider(create: (_) => HttpDeleteStore()),
                      ],
                      child:
                          const HttpPostMethod().withProvider(HttpPostStore())),
                ),
              ),
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}

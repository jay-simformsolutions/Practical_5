import 'package:flutter/material.dart';
import 'package:practical_5/network/model/http/http_post_model.dart';
import 'package:practical_5/network/store/http/http_delete_store.dart';
import 'package:practical_5/network/store/http/http_post_store.dart';
import 'package:practical_5/network/store/http/http_update_store.dart';
import 'package:provider/provider.dart';

class HttpPostMethod extends StatefulWidget {
  const HttpPostMethod({Key? key}) : super(key: key);

  @override
  State<HttpPostMethod> createState() => _HttpPostMethodState();
}

class _HttpPostMethodState extends State<HttpPostMethod> {
  @override
  Widget build(BuildContext context) {
    final readStore = context.read<HttpPostStore>();
    final readUpdate = context.read<HttpUpdateStore>();
    final readDelete = context.read<HttpDeleteStore>();
    HttpPostModel httpPostModel =
        HttpPostModel(name: '', createdAt: '', id: '0', job: '');

    String name = '';
    String job = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Method'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: readStore.nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: readStore.jobController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Job'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    name = readStore.nameController.text;
                    job = readStore.jobController.text;
                  });

                  httpPostModel = await readStore.submitData(name, job);

                  debugPrint('Name is ${httpPostModel.name}');
                  debugPrint('Job is ${httpPostModel.job}');
                },
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String name = readStore.nameController.text;
                  String job = readStore.jobController.text;

                  httpPostModel = await readUpdate.updateData(name, job);

                  debugPrint('Updated name is ${httpPostModel.name}');
                  debugPrint('Updated job is ${httpPostModel.job}');
                },
                child: const Text('Update'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var delete = await readDelete.deleteResponse('1');

                  // debugPrint('Http Model now ${delete}');

                  //debugPrint('Http Model is ${httpPostModel.}');
                },
                child: const Text('Delete'),
              ),

              //Text('Added Name is ${readUpdate}'),
            ],
          ),
        ),
      ),
    );
  }
}

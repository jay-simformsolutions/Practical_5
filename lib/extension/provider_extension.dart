import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AccessParentProvider on Widget {
  Widget accessParentProvider<U, P extends U>(P provider) => MultiProvider(
        providers: [
          Provider<U>(
            create: (_) => provider,
          ),
          Provider<P>(
            create: (_) => provider,
          ),
        ],
        child: this,
      );

  Widget withProvider<T>(T provider) => Provider(
        create: (_) => provider,
        child: this,
      );
}

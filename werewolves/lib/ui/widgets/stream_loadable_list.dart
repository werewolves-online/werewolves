import 'package:flutter/material.dart';

typedef ItemBuilder = Widget Function(BuildContext context, String item);

class StreamLoadableList extends StatelessWidget {
  final List<Widget> extraItems;
  final ItemBuilder itemBuilder;
  final Stream<List<String>> stream;
  const StreamLoadableList({
    Key? key,
    required this.extraItems,
    required this.itemBuilder,
    required this.stream,
  }) : super(key: key);

  Widget _loadingWidget() => const Text('loading....');

  Widget _errorWidget(String error) => Text(error);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      builder: (context, snapshot) {
        if (snapshot.hasError) return _errorWidget(snapshot.error.toString());
        if (!snapshot.hasData) return _loadingWidget();
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.length + extraItems.length,
          itemBuilder: (context, n) {
            if (n < snapshot.data!.length) {
              return itemBuilder(context, snapshot.data![n]);
            }
            return extraItems[n - snapshot.data!.length];
          },
        );
      },
      stream: stream,
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:counter/counters_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'main.dart';
import 'counter.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: const CountersList(),
    );
  }
}

class CountersList extends HookConsumerWidget {
  const CountersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('たくさんかうんたー')),
      body: _buildList(ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String title = await _showCreateCounterDialog(context);
          if (title != "") {
            ref.watch(countersViewModelProvider.notifier).createCouter(title);
          }
        },
        tooltip: 'ついか',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(WidgetRef ref) {
    final countersState = ref.watch(countersViewModelProvider);
    final _countersList = countersState.countersList;
    ref.listen(countersViewModelProvider,
        (CountersState? state1, CountersState state2) async {
      await writeCounters(state2.countersList);
    });

    readCounters().then((value) {
      if (value == null) return;
      ref.watch(countersViewModelProvider.notifier).loadData(value);
    });

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _countersList.length,
      itemBuilder: (BuildContext context, int index) {
        return _dismissible(_countersList[index], context, ref);
      },
    );
  }

  Widget _dismissible(Counter counter, BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final confirmResult =
              await _showDeleteConfirmDialog(counter.title, context);
          return confirmResult;
        }
        final newTitle = await _showChangeTitleDialog(context, counter.title);
        if (newTitle != "") {
          ref
              .watch(countersViewModelProvider.notifier)
              .changeTitle(counter.id, newTitle);
        }
        return null;
      },
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.startToEnd) {
          ref
              .watch(countersViewModelProvider.notifier)
              .deleteCounter(counter.id);
        }
      },
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        color: Colors.blue,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
      child: _countersItem(counter, context, ref),
    );
  }

  Widget _countersItem(Counter counter, BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: ListTile(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  counter.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              child: const Icon(Icons.remove),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
              onPressed: () => ref
                  .watch(countersViewModelProvider.notifier)
                  .decrement(counter.id),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Icon(Icons.refresh),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              onPressed: () => ref
                  .watch(countersViewModelProvider.notifier)
                  .reset(counter.id),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Icon(Icons.edit),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              onPressed: () async {
                final newValue =
                    await _showChangeValueDialog(context, counter.count);
                ref
                    .watch(countersViewModelProvider.notifier)
                    .set(counter.id, newValue);
              },
            ),
          ],
        ),
        onTap: () =>
            ref.watch(countersViewModelProvider.notifier).increment(counter.id),
      ),
    );
  }

  Future<String> _showCreateCounterDialog(BuildContext context) async {
    String text = "";
    final resalt = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ついか'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: "たいとる",
            ),
            onChanged: (value) => text = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(""),
              child: const Text('やめた'),
            ),
            TextButton(
              onPressed: () {
                if (text == "") text = "たいとりゅ";
                Navigator.of(context).pop(text);
              },
              child: const Text('おっけー'),
            ),
          ],
        );
      },
    );
    if (resalt == null) return "";
    return resalt;
  }

  Future<String> _showChangeTitleDialog(
      BuildContext context, String beforeText) async {
    String text = "";
    final resalt = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('たいとるへんこー'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: "たいとる",
            ),
            onChanged: (value) => text = value,
            controller: TextEditingController(text: beforeText),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(beforeText),
              child: const Text('やめた'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(text),
              child: const Text('おっけー'),
            ),
          ],
        );
      },
    );
    if (resalt == null) return beforeText;
    return resalt;
  }

  Future<int> _showChangeValueDialog(
      BuildContext context, int beforeValue) async {
    String text = "";
    final resalt = await showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('あたいへんこー'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: "たいとる",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => text = value,
            controller: TextEditingController(text: '$beforeValue'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(beforeValue),
              child: const Text('やめた'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(int.parse(text)),
              child: const Text('おっけー'),
            ),
          ],
        );
      },
    );
    if (resalt == null) return beforeValue;
    return resalt;
  }

  Future<bool> _showDeleteConfirmDialog(
      String title, BuildContext context) async {
    final resalt = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('さくじょ'),
            content: Text('$titleをけしちゃうの？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('だめ'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('いいよ'),
              ),
            ],
          );
        });
    if (resalt == null) return false;
    return resalt;
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counters.json');
}

Future<List<Counter>?> readCounters() async {
  try {
    final file = await _localFile;
    String jsonString = await file.readAsString();

    List<Counter> counters =
        CountersJson.fromJson(jsonDecode(jsonString)).counters;
    return counters;
  } catch (e) {
    return null;
  }
}

Future<bool> writeCounters(List<Counter> counters) async {
  try {
    CountersJson countersJson = CountersJson(counters);
    String jsonString = jsonEncode(countersJson.toJson());

    final file = await _localFile;
    await file.writeAsString(jsonString);

    return true;
  } catch (e) {
    return false;
  }
}

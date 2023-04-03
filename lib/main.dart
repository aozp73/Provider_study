import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고가 관리할 데이터 타입을 적어 줘야 함 <int>
// 아래 Counter가 창고임
class Counter extends StateNotifier<int>{
  Counter() : super(0);

  void increment(){
    // state 자체가 int임
    state++;
  }
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(counterProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text("$value"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            ref.read(counterProvider.notifier).increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
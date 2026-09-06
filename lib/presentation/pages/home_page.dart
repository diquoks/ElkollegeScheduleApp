import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text("ElkollegeScheduleApp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: <Widget>[
            RichText(
              textAlign: .center,
              text: TextSpan(
                text: "You have pushed the button this many times:\n",
                style: theme.textTheme.bodyMedium,
                children: <InlineSpan>[
                  TextSpan(
                    text: "$_counter",
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}

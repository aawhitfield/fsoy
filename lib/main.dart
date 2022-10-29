import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title: 'Game of Life -- For the Strength of Youth Edition'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // a gridview of 15 elevated buttons that are 5 columns and 3 rows and that say 'Pick Me',
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3,
                  children: List.generate(
                      15,
                      (index) => ElevatedButton(
                          onPressed: () {},
                          child: const Text('Pick Me',
                              style: TextStyle(fontSize: 20))))),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  // height that is 1/3 of the screen height
                  height: MediaQuery.of(context).size.height / 6,
                  child: ListView.builder(
                      // 8 rectangles that are 100x100 and that say 'I am a rectangle'
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 11,
                      itemBuilder: (context, index) {
                        TextStyle style = const TextStyle(fontSize: 20);
                        late Widget child;
                        switch (index) {
                          case 0:
                            child = Text('Hell', style: style);
                            break;
                          case 10:
                            child = Text('Heaven', style: style);
                            break;
                          case 5:
                            child = Text('X', style: style);
                            break;
                          default:
                            child = Container();
                        }

                        return Container(
                          height: 100,
                          width: 100,
                          // black border
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                          child: Center(
                            child: child,
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

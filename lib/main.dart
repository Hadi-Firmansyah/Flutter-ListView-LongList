import 'dart:developer';

import 'package:flutter/material.dart';
// import '.app/app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter List View dan Long List',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      LongList.routeName: (context) => LongList(),
    },
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View : Hadi Firmansyah'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          ListTile(
            leading: Icon(Icons.landscape),
            title: Text("Menu"),
            subtitle: Text("Beautiful View!"),
            trailing: Icon(Icons.wb_sunny),
            onTap: () {
              Navigator.pushNamed(context, LongList.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.traffic),
            title: Text("Traffic"),
            subtitle: Text("Description Traffic!"),
            trailing: Icon(Icons.my_location_sharp),
            onTap: () {
              debugPrint("On Tapped");
            },
          )
        ]),
      ),
    );
  }
}

class LongList extends StatelessWidget {
  static const String routeName = '/longlist';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Long List')),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Working!");
        },
        child: Icon(Icons.add),
        tooltip: 'Add One More Item!',
      ),
    );
  }
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("You Just Tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: () {
        debugPrint("Undo Operation");
      },
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(101, (counter) => "Weather City $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(listItems[index]),
        onTap: () {
          showSnackBar(context, listItems[index]);
        });
  });
  return listView;
}

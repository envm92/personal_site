import 'package:flutter/material.dart';
import 'package:personal_site/widgets/intro.dart';

import '../widgets/demos.dart';
import '../widgets/links.dart';
import '../widgets/readme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
    int _tabSelected = 0;

  final List<Map> _tabs = <Map>[
    {'index': 0, 'text': 'intro.html', 'widget': const Intro()},
    {'index': 1, 'text': 'readme.md', 'widget': const Readme()},
    {'index': 2, 'text': '.links', 'widget': const Links()},
    {'index': 3, 'text': '.demos', 'widget': const Demos()}
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _tabController.addListener(() {
      setState(() {
        _tabSelected = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {},
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text('personal_site'),
            );
          },
          body: Column(
              children: _tabs.map<ListTile>((Map tab) {
            return ListTile(
              title: Text(tab['text']),
              onTap: () {
                _tabController.animateTo(tab['index']);
              },
              selected: tab['index'] == _tabSelected,
            );
          }).toList()),
          isExpanded: true,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Text('EV'),
          ),
        )),
        body: DefaultTabController(
          length: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: _buildPanel(),
                    ),
                  )
                ],
              )),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    TabBar(
                        controller: _tabController,
                        tabs: _tabs.map<Tab>((Map tab) {
                          return Tab(
                            text: tab['text'],
                          );
                        }).toList()),
                    Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: _tabs.map<Widget>((Map tab) {
                            return tab['widget'];
                          }).toList()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

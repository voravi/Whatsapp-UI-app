import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_4/widgets/cupertino_listtile.dart';
import 'package:outcaster_4/widgets/data.dart';
import 'package:outcaster_4/widgets/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final CupertinoTabController _cupertinoTabController =
      CupertinoTabController(initialIndex: 0);
  final PageController _pageController = PageController();
  int floatingCount = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return (Global.isIos == false)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text("WhatsApp"),
              actions: [
                Switch(
                    value: Global.isIos,
                    onChanged: (val) {
                      setState(() {
                        Global.isIos = val;
                      });
                    }),
                const Icon(Icons.more_vert),
                const SizedBox(
                  width: 10,
                ),
              ],
              bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  onTap: (val) {
                    setState(() {
                      floatingCount = val;
                      _pageController.animateToPage(val,
                          duration: const Duration(microseconds: 800),
                          curve: Curves.linear);
                    });
                  },
                  tabs: const [
                    Tab(
                      text: "CHATS",
                    ),
                    Tab(
                      text: "STATUS",
                    ),
                    Tab(
                      text: "CALLS",
                    )
                  ]),
            ),
            floatingActionButton: (floatingCount == 0)
                ? FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {},
                    child: const Icon(
                      Icons.message,
                    ),
                  )
                : (floatingCount == 1)
                    ? FloatingActionButton(
                        backgroundColor: Colors.green,
                        onPressed: () {},
                        child: const Icon(
                          Icons.camera_alt,
                        ),
                      )
                    : FloatingActionButton(
                        backgroundColor: Colors.green,
                        onPressed: () {},
                        child: const Icon(
                          Icons.settings_phone_rounded,
                        ),
                      ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (val) {
                setState(() {
                  _tabController.animateTo(val);
                });
              },
              children: [
                Column(
                  children: List.generate(
                      ContactList.length,
                      (index) => ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage(ContactList[index].image)),
                                  shape: BoxShape.circle,
                                  color: Colors.grey),
                            ),
                            title: Text(ContactList[index].name),
                            subtitle: Text(ContactList[index].msg),
                          )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(ContactList[0].image)),
                            shape: BoxShape.circle,
                            color: Colors.grey),
                      ),
                      title: const Text("My status"),
                      subtitle: const Text("44 minutes ago"),
                      trailing: const Icon(
                        Icons.more_horiz,
                        color: Colors.teal,
                      ),
                    ),
                    const Text("   Recently Updated"),
                    Column(
                      children: List.generate(
                          3,
                          (index) => ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              ContactList[index].image)),
                                      shape: BoxShape.circle,
                                      color: Colors.grey),
                                ),
                                title: Text(ContactList[index].name),
                                subtitle:
                                    Text("${Random().nextInt(50)} minutes ago"),
                              )),
                    ),
                    const Text("   Viewed status"),
                    Column(
                      children: List.generate(
                          3,
                          (index) => ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              ContactList[index + 2].image)),
                                      shape: BoxShape.circle,
                                      color: Colors.grey),
                                ),
                                title: Text(ContactList[index + 2].name),
                                subtitle:
                                    Text("${Random().nextInt(50)} minutes ago"),
                              )),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                      ContactList.length,
                      (index) => ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage(ContactList[index].image)),
                                  shape: BoxShape.circle,
                                  color: Colors.grey),
                            ),
                            title: Text(ContactList[index].name),
                            subtitle:
                                Text("${Random().nextInt(50)} minutes ago"),
                            trailing:
                                const Icon(Icons.phone, color: Colors.teal),
                          )),
                ),
              ],
            ))
        : CupertinoTabScaffold(
            controller: _cupertinoTabController,
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.circle_bottomthird_split),
                    label: "Status"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.phone), label: "Calls"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.camera), label: "Camera"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chat_bubble_2), label: "Chats"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings), label: "Settings"),
              ],
            ),
            tabBuilder: (BuildContext context, i) {
              if (i == 3) {
                return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: const Text("What's up"),
                      trailing: CupertinoSwitch(
                          value: Global.isIos,
                          onChanged: (val) {
                            setState(() {
                              Global.isIos = val;
                            });
                          }),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const CupertinoSearchTextField(),
                        Column(
                          children: List.generate(
                              ContactList.length,
                              (index) => CupertinoListTile(
                                  title: Text(ContactList[index].name),
                                  subtitle: Text(ContactList[index].msg),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ContactList[index].image)),
                                        shape: BoxShape.circle,
                                        color: CupertinoColors.inactiveGray),
                                  ),
                                  trailing: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CupertinoColors.activeGreen,
                                    ),
                                    child: Center(
                                        child: Text(
                                            Random().nextInt(10).toString())),
                                  ))),
                        )
                      ],
                    ));
              } else if (i == 1) {
                return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                        middle: const Text("What's up"),
                        trailing: CupertinoSwitch(
                            value: Global.isIos,
                            onChanged: (val) {
                              setState(() {
                                Global.isIos = val;
                              });
                            })),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const CupertinoSearchTextField(),
                        Column(
                          children: List.generate(
                              ContactList.length,
                              (index) => CupertinoListTile(
                                  title: Text(ContactList[index].name),
                                  subtitle: Text(
                                      "${Random().nextInt(50)} minutes ago"),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ContactList[index].image)),
                                        shape: BoxShape.circle,
                                        color: CupertinoColors.inactiveGray),
                                  ),
                                  trailing: const Icon(
                                    CupertinoIcons.phone_fill,
                                    color: CupertinoColors.activeGreen,
                                  ))),
                        )
                      ],
                    ));
              } else if (i == 0) {
                return CupertinoPageScaffold(
                    navigationBar: const CupertinoNavigationBar(
                      middle: Text("What's up"),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const CupertinoSearchTextField(),
                        Column(
                          children: List.generate(
                              ContactList.length,
                              (index) => CupertinoListTile(
                                  title: Text(ContactList[index].name),
                                  subtitle: Text(
                                      "${Random().nextInt(50)} minutes ago"),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ContactList[index].image)),
                                        shape: BoxShape.circle,
                                        color: CupertinoColors.inactiveGray),
                                  ),
                                  trailing: const Text(""))),
                        )
                      ],
                    ));
              }
              return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                      middle: const Text("What's up"),
                      trailing: CupertinoSwitch(
                          value: Global.isIos,
                          onChanged: (val) {
                            setState(() {
                              Global.isIos = val;
                            });
                          })),
                  child:
                      const Center(child: Material(child: Text("What's Up"))));
            });
  }
}

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ad1clar',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 25)),
      //   backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      //   centerTitle: true,
      // ),
      appBar: AppBar(
        leading: IconButton(
          
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: null,
        ),
        title: const Text('Selamat Datang di Adira Finance',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontFamily: 'Kanit',
              fontSize: 25
            ), textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Log Out',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Harusnya Balik ke login page')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Color.fromARGB(255, 172, 172, 172),
              selectedHoverColor: Color.fromARGB(255, 240, 240, 240),
              selectedColor: Color.fromARGB(255, 42, 42, 41),
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              backgroundColor: Colors.yellow[600],
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/images/adiraLogo.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  //   decoration: BoxDecoration(
                  //       color: Color.fromARGB(255, 49, 67, 75),
                  //       borderRadius: BorderRadius.circular(12)),
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  //     child: Text(
                  //       'mohada',
                  //       style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  //     ),
                  //   ),
                  ),
            ),
            items: [
              SideMenuItem(
                title: 'Home',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
                //  badgeContent: const Text(
                //    '3',
                //    style: TextStyle(color: Colors.white),
                //  ),
                // tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Management Commercial Fleet',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.menu_book_rounded),
              ),
              SideMenuItem(
                title: 'Manajemen Sistem',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.account_circle_sharp),
              ),
              SideMenuItem(
                title: 'Manajemen Collection',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.collections),
              ),
              SideMenuItem(
                builder: (context, displayMode) {
                  return const Divider(
                    endIndent: 8,
                    indent: 8,
                  );
                },
              ),
              SideMenuItem(
                title: 'Manajemen Recovery',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.restart_alt_rounded),
              ),
              const SideMenuItem(
                title: 'Manajemen Warehouse',
                icon: Icon(Icons.warehouse),
              ),
              const SideMenuItem(
                title: 'Riwayat Pembayaran',
                icon: Icon(Icons.history),
              ),
              const SideMenuItem(
                title: 'FAQ',
                icon: Icon(Icons.menu_rounded),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Title',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Icon',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

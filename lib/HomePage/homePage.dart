import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

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

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: null),
        title: const Text('Selamat datang di Adira Finance',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit',
                fontSize: 25)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Log Out',
            onPressed: () {
              Navigator.pushNamed(context, '/');
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Berhasil keluar')));
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
              selectedHoverColor: Color.fromARGB(255, 191, 191, 191),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 5),
                      Card(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(20, 20),
                          ),
                          child: const Text(
                            'To Do List',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(20, 20),
                          ),
                          child: const Text(
                            'Track Your Request',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(20, 20),
                          ),
                          child: const Text(
                            'Monitor Your Request',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        endIndent: 8,
                        indent: 8,
                      ),
                      const SizedBox(height: 50),
                      Container(
                        child: const Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text('Nama',
                                    style: TextStyle(
                                        fontFamily: 'Sans',
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 100),
                                Text(':',
                                    style: TextStyle(
                                        fontFamily: 'Sans',
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 10),
                                Text('Anik Widiastuti',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Sans',
                                        color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text('NIK',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 115),
                                    Text(':',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    Text('10081654',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text('No Hp',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 98),
                                    Text(':',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    Text('081380636708',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text('Email',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 105),
                                    Text(':',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    Text('anik.widiastuti@adira.co.id',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text('Role',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 111),
                                    Text(':',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    Text('COLLECTION DEVELOPMENT OFFICER',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text('Jabatan',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 92),
                                    Text(':',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    Text('COLLECTION DEVELOPMENT OFFICER',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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
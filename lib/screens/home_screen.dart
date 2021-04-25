part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFC),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>('contacts').listenable(),
        builder: (context, Box<Contact> box, child) {
          if (box.values.isEmpty)
            return Center(
              child: Text('Tidak ada Kontak'),
            );
          var listContact = box.values.toList();
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: listContact
                  .map((e) => ContactCard(
                        contact: e,
                        index: listContact.indexOf(e),
                      ))
                  .toList(),
            ),
          ));
        },
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed('/add');
          },
        ),
      ),
    );
  }
}

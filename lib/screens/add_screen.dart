part of 'screens.dart';

class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    ageController = TextEditingController();
    phoneController = TextEditingController();
    outcomeController = TextEditingController();
  }

  void dispose() {
    super.dispose();
    nameController!.dispose();
    ageController!.dispose();
    phoneController!.dispose();
    outcomeController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Your New Ex'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(hintText: 'Age'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(hintText: 'Phone Number'),
                ),
                TextField(
                  controller: outcomeController,
                  decoration: InputDecoration(hintText: 'Outcome'),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Text("Submit"),
                    onPressed: onFormSubmit,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onFormSubmit() {
    Box<Contact> contactsBox = Hive.box<Contact>('contacts');
    contactsBox.add(Contact(
        name: nameController!.text,
        age: int.parse(ageController!.text),
        phoneNumber: phoneController!.text,
        totalOutcome: int.parse(outcomeController!.text)));

    Get.back();
  }
}

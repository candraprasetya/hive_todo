part of 'screens.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Contact contact = Get.arguments[0];
  int index = Get.arguments[1];

  void initState() {
    super.initState();
    nameController = TextEditingController();
    ageController = TextEditingController();
    phoneController = TextEditingController();
    outcomeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail - ${contact.name}'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(hintText: contact.name),
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(hintText: contact.age.toString()),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(hintText: contact.phoneNumber),
                ),
                TextField(
                  controller: outcomeController,
                  decoration: InputDecoration(
                      hintText: contact.totalOutcome.toString()),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () => onFormSubmit(index)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onFormSubmit(int index) {
    Box<Contact> contactsBox = Hive.box<Contact>('contacts');
    contactsBox.putAt(
        index,
        Contact(
            name: nameController!.text != ''
                ? nameController!.text
                : contact.name,
            age: ageController!.text != ''
                ? int.parse(ageController!.text)
                : contact.age,
            phoneNumber: phoneController!.text != ''
                ? phoneController!.text
                : contact.phoneNumber,
            totalOutcome: outcomeController!.text != ''
                ? int.parse(outcomeController!.text)
                : contact.totalOutcome));
    Get.back();
  }
}

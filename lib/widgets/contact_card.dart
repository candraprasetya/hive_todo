part of 'widgets.dart';

class ContactCard extends StatelessWidget {
  final Contact? contact;
  final int? index;

  const ContactCard({this.contact, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/detail', arguments: [contact, index]);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact!.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('Age: ${contact!.age!}'),
                      SizedBox(height: 4)
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.person_remove,
                  color: Colors.red[400],
                ),
                onPressed: () {
                  Box<Contact> contactsBox = Hive.box<Contact>('contacts');
                  contactsBox.deleteAt(index!);
                })
          ],
        ));
  }
}

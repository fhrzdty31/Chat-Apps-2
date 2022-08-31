import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Dismissible(
            key: Key(index.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: const Color.fromARGB(250, 240, 240, 240),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete_forever, color: Colors.grey,),
            ),
            confirmDismiss: (direction) {
              return showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content: const Text("Apakah anda yakin untuk menghapus chat ini?"),
                  actions: [
                    RaisedButton(
                      color: Colors.white,
                      child: const Text("No"),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    RaisedButton(
                      color: Colors.white,
                      child: const Text("Yes"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              });
            },
            child: Item(
              img: "${index + 1}",
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
            ));
      },
    );
  }
}

class Item extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;

  const Item({Key? key,
    required this.img,
    required this.title,
    required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          child: Center(
              child: Text(img)
          ),
        ),
        title: Text(title),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
            DateFormat.Hm().format(DateTime.now())
        ));
  }
}

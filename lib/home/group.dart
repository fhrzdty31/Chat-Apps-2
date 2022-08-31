import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Group extends StatefulWidget {
  const Group({Key? key}) : super(key: key);

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Item(
          imgUrl: "https://picsum.photos/id/$index/200/300",
          title: faker.person.name(),
          subtitle: faker.lorem.sentence(),
        );
      },
    );
  }
}

class Item extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;

  const Item(
      {Key? key,
        required this.imgUrl,
        required this.title,
        required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
        title: Text(title),
        subtitle: Text(
          "Name : $subtitle",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
            DateFormat.jm().format(DateTime.now())
        ));
  }
}

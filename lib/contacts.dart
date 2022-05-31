import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'avatar.dart';
import 'contact_page.dart';

class Contacts extends StatefulWidget {
  static const routeName = '/contact';
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact>? _contacts;

  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: (_contacts) == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _contacts!.length,
              itemBuilder: (context, i) {
                final contact = _contacts![i];
                return Card(
                  elevation: 1,
                  child: ListTile(
                      leading: avatar(contact, 18.0),
                      title: Text(_contacts![i].displayName),
                      onTap: () async {
                        final fullContact =
                            await FlutterContacts.getContact(_contacts![i].id);
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ContactPage(fullContact!)));
                      }),
                );
              }),
    );
  }
}

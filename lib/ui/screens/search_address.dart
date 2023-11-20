import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../repositories/address_repository.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Address> _addresses = [];

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rechercher une adresse',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                labelText: 'Addresse de l\'entreprise',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              controller: _textFieldController,
              onChanged: (String value) async {
                if (value.trim().length < 3) return;
                final AddressRepository addressRepository = AddressRepository();
                final List<Address> addresses =
                    await addressRepository.fetchAddresses(value);
                setState(() {
                  _addresses = addresses;
                });
              },
            ),
            Expanded(
                child: ListView.builder(
              itemCount: _addresses.length,
              itemBuilder: (BuildContext context, int index) {
                final address = _addresses[index];
                return ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.grey),
                  title: Text(address.street),
                  subtitle: Text('${address.postcode} ${address.city}'),
                  onTap: () {},
                );
              },
            ))
          ])),
    );
  }
}

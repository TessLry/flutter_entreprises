import 'package:flutter/material.dart';
import 'package:flutter_entreprises/models/Company.dart';
import 'package:flutter_entreprises/models/address.dart';
import 'package:flutter_entreprises/router.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final TextEditingController _textFieldController = TextEditingController();

  final TextEditingController _addressFieldController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  Address? _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajouter une entreprise',
              style: TextStyle(color: Colors.white)),
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
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      prefixIcon: Icon(Icons.business, color: Colors.grey),
                      hintText: 'Nom de l\'entreprise',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _textFieldController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir le nom de l\'entreprise';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    readOnly: true,
                    onTap: () async {
                      _address = await Navigator.of(context)
                          .pushNamed(AppRouter.searchAddressPage) as Address?;
                      if (_address != null) {
                        _addressFieldController.text =
                            '${_address!.street}, ${_address!.city}, ${_address!.postcode}';
                      }
                    },
                    controller: _addressFieldController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir l\'adresse de l\'entreprise';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                      hintText: 'Adresse de l\'entreprise',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final String name = _textFieldController.text;
                      if (_formKey.currentState!.validate()) {
                        Company company = Company(name, _address!);
                        Navigator.of(context).pop(company);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    child: const Text(
                      'Valider',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
        ));
  }
}

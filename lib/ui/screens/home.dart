import 'package:flutter/material.dart';
import 'package:flutter_entreprises/models/Company.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    const Company(0, 'Entreprise 1'),
    const Company(1, 'Entreprise 2'),
    const Company(2, 'Entreprise 3'),
  ];

  void _addCompany(Company company) {
    setState(() {
      _companies.add(company);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Liste des entreprises',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: ListView.separated(
          itemCount: _companies.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_companies[index].name),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 0);
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //Navigator.of(context).pushNamed('/add_company');
            final Company? company = await Navigator.of(context)
                .pushNamed('/add_company') as Company?;
            if (company != null) {
              _addCompany(company);
            }
          },
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_entreprises/blocs/company_cubit.dart';
import 'package:flutter_entreprises/models/company.dart';
import 'package:flutter_entreprises/router.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: BlocBuilder<CompanyCubit, List<Company>>(
          builder: (context, state) {
            return ListView.separated(
              itemCount: state.length,
              itemBuilder: (BuildContext context, int index) {
                final Company company = state[index];
                return ListTile(
                  title: Text(company.name),
                  subtitle: Text(company.address.toString()),
                  onTap: () {},
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.of(context).pushNamed(AppRouter.addCompanyPage);
          },
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}

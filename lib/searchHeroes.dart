import 'package:drift/native.dart';
import 'package:heroes_api/database/database.dart';
import 'package:heroes_api/api/Heroe.dart';
import 'package:heroes_api/api/Service.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as dr;
import 'package:heroes_api/sharedPreferences.dart';

class searchHeroes extends StatefulWidget {
  const searchHeroes({super.key});

  @override
  State<searchHeroes> createState() => _searchHeroesState();
}

class _searchHeroesState extends State<searchHeroes> {
  Future<List<Heroe>>? _futureHeroes;
  final Service _service = Service();
  final TextEditingController _keywordController = TextEditingController();
  final AppDatabase database = AppDatabase(NativeDatabase.memory());
  final PreferencesService _preferencesService = PreferencesService();
  int _resultCount = 0;

  @override
  void initState() {
    super.initState();
    _loadResultCount();
    _futureHeroes = _service.consultaHeroe("hawk");
  }

  Future<void> _storeResultCount(int count) async {
    await _preferencesService.saveSuperHeroCount(count);
    setState(() {
      _resultCount = count;
    });
  }

  Future<void> _loadResultCount() async {
    final count = await _preferencesService.getSuperHeroCount();
    setState(() {
      _resultCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Heroes',),
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepOrange[300],
        ),
        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Number of results: $_resultCount'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: _keywordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      hintText: 'Ingrese el nombre del heroe',
                    )
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrange[300],
                  ),
                  onPressed: () {
                    setState(() {
                      _futureHeroes = _service.consultaHeroe(_keywordController.text.toString());
                    });
                  },
                  child: Text('Consultar heroe', style: TextStyle(
                    color: Colors.white,
                  ),
                  )
              ),
              SizedBox(height: 10),
              Expanded(
                  child: FutureBuilder<List<Heroe>>(
                      future: _futureHeroes,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _storeResultCount(snapshot.data!.length);
                          });
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final heroe = snapshot.data![index];
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(heroe.name),
                                    subtitle: Text('Full Name: ${heroe.fullName}\nGender: ${heroe.gender}\nIntelligence: ${heroe.intelligence}'),
                                    leading: Image.network(heroe.imageUrl, width: 50),
                                    trailing: IconButton(
                                      onPressed: () async {
                                        final existingHero = await database.getHeroByName(heroe.name);
                                        if (existingHero == null) {
                                          final heroCompanion = HeroPostedCompanion(
                                            name: dr.Value(heroe.name),
                                            fullName: dr.Value(heroe.fullName),
                                            gender: dr.Value(heroe.gender),
                                            intelligence: dr.Value(heroe.intelligence),
                                            image: dr.Value(heroe.imageUrl),
                                          );
                                          await database.insertHero(heroCompanion);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Hero succesfully added to the database'))
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Hero already exists in the database'))
                                          );
                                        }},
                                      icon: Icon(Icons.favorite, color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('No data found'));
                        }
                      }
                  )
              )
            ]
        )
    );
  }
}
import 'dart:ffi';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:heroes_api/database/database.dart';
import 'package:drift/drift.dart' as dr;

class favHeroes extends StatefulWidget {
  const favHeroes({super.key});

  @override
  State<favHeroes> createState() => _favHeroesState();
}

class _favHeroesState extends State<favHeroes> {
  final AppDatabase database = AppDatabase(NativeDatabase.memory());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Heroes'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange[300],
      ),
      body: FutureBuilder<List<HeroPostedData>>(
        future: database.getAllHeroes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text('No favorite heroes found'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final hero = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: Image.network(hero.image).image,
                  ),
                  title: Text(hero.name),
                  subtitle: Text('Full Name: ${hero.fullName}\nGender: ${hero.gender}\nIntelligence: ${hero.image}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
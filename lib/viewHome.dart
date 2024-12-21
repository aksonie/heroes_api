import 'package:flutter/material.dart';
import 'package:heroes_api/favHeroes.dart';
import 'package:heroes_api/searchHeroes.dart';
class viewHome extends StatelessWidget {
  const viewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes API',),
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepOrange[300],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Comics App', style: TextStyle(
            fontSize: 60,
            color: Colors.deepOrange[300],
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 50),
          Image.asset('assets/images/comics.jpeg', width: 300),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrange[300],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => searchHeroes()));
                  },
                  child: Text('Buscar Heroes', style: TextStyle(
                      fontSize: 20))
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrange[300],
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => favHeroes()));
                  },
                  child: Text('Favorite Heroes', style: TextStyle(
                    fontSize: 20
                  ),)
              )

            ],
          )

        ],
      ),
    );
  }
}

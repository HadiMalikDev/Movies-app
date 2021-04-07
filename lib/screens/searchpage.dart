import 'package:flutter/material.dart';
import 'package:movies/models/movieModel.dart';
import 'package:movies/models/searchpagemodel.dart';
import 'package:movies/screens/moviepage.dart';

class SearchPage extends StatelessWidget {
  SearchPageModel _model = SearchPageModel();
  @override
  Widget build(BuildContext context) {
    String name;
    return Scaffold(
      backgroundColor: Color(0xFF485160),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  cursorColor: Colors.white,
                  onChanged: (val) => name = val,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Enter Movie name',
                    labelStyle:
                        TextStyle(color: Colors.white, fontSize: 25, height: 0),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      MovieModel model = await _model.searchForMovie(name);
                      if (model == null) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("An error occured. Please enter a valid movie name"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context,rootNavigator: true).pop();
                                      },
                                      child: Text(
                                          "Okay"),
                                    )
                                  ],
                                ),
                            barrierDismissible: false);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviePage(
                              movie: model,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text("Search"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

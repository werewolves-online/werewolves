import 'package:flutter/material.dart';
import 'package:werewolves/model/game_information_model.dart';

class CreateGameModal extends StatefulWidget {
  Function addGameToList;
  CreateGameModal(this.addGameToList, {Key? key}) : super(key: key);

  @override
  State<CreateGameModal> createState() => _CreateGameModal();
}

class _CreateGameModal extends State<CreateGameModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GameInformationModel createGameModel = GameInformationModel.static();

  final double textModalMargin = 15;
  final double textFormPadding = 20;
  final Color modalColor = const Color.fromARGB(255, 240, 240, 240);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(textModalMargin),
        child: Dialog(
          child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(textFormPadding),
              color: modalColor,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  getFormTextFields(),
                ],
              )),
            ),
          ),
        ));
  }

  Widget getFormTextFields() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Game Name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'This is a required field';
              }
              return null;
            },
            onSaved: (value) {
              createGameModel.gameName = value.toString();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  widget.addGameToList(createGameModel);
                  Navigator.pop(context);
                }
              },
              child: const Text('Create Game'),
            ),
          ),
        ],
      ),
    );
  }
}

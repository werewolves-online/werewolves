import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:werewolves/model/room.dart';
import 'package:werewolves/ui/widgets/input_field.dart';
import 'package:werewolves/utils/authentication.dart';
import 'package:werewolves/utils/data.dart';

class CreateRoom extends StatelessWidget {
  static const String name = 'create_room';

  final TextEditingController nameController = TextEditingController();

  CreateRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Room'),
      ),
      body: Center(
        child: Column(
          children: [
            TextInputField(
              label: 'room name',
              controller: nameController,
            ),
            MaterialButton(
              child: const Text('Create'),
              onPressed: () async {
                final Room room = Room.createNew(
                  nameController.text,
                  Authentication.currentUserUid() ?? 'invalid owner!!',
                );
                await FirestoreHelper.createOrUpdateRoom(room);
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Created room ${room.name}'),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Text('Room ID: ${room.uid}')),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: room.uid))
                                    .then(
                                  (_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Copied uuid to clipboard"),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.copy),
                            )
                          ],
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK!'),
                          )
                        ],
                      );
                    });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

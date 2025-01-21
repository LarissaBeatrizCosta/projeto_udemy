import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_curso_app/providers/image_picker_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImagePickerState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Consumer<ImagePickerState>(
          builder: (context, state, _) {
            return Center(
              child: ProfileScreen(
                avatar: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Column(
                          //deixa o modal menor
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                child: Icon(
                                  Icons.photo_camera,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text("Câmera"),
                              onTap: () async {
                                await state.getImageFromCamera();
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                child: Icon(
                                  Icons.photo,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text("Galeria"),
                              onTap: () async {
                                await state.getImageFromGallery();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  iconSize: 170,
                  color: Colors.black,
                  icon: state.file != null
                      ? CircleAvatar(
                          radius: 75,
                          backgroundImage:
                              MemoryImage(state.file!.readAsBytesSync()),
                        )
                      : Icon(
                          Icons.account_circle,
                          size: 170,
                        ),
                ),
                actions: [
                  SignedOutAction((context) async {

                    await Navigator.popAndPushNamed(context, '/login');
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

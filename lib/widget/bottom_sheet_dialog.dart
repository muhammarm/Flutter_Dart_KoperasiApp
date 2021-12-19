import 'package:flutter/material.dart';
import 'package:koperasi/widget/form_button.dart';

enum DialogType { EXIT, INFO, CUSTOM, SEARCH_DROP_DOWN }

showButtomSheetDialog(BuildContext context, String title,
    DialogType dialogType, Widget? child, Function? actionCallBack,
    {String? imageName}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5,
                color: Theme.of(context).primaryColor,
              ),
              _buildBottomDialogBody(
                  context, dialogType, child, actionCallBack, imageName)
            ],
          ),
        );
      });
}

Widget _buildBottomDialogBody(BuildContext context, DialogType dialogType,
    Widget? child, Function? actionCallBack, String? imageName) {
  switch (dialogType) {
    case DialogType.EXIT:
      {
        return Column(
          children: [
            imageName != null
                ? Container(
              margin: const EdgeInsets.all(16),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageName),
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Container(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: KaskitaFormButton(
                        title: 'Tidak',
                        actionCallback: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: KaskitaFormButton(
                        title: 'Ya',
                        actionCallback: () {
                          Navigator.pop(context);
                          if (actionCallBack != null) {
                            actionCallBack();
                          }
                        }),
                  ),
                )
              ],
            )
          ],
        );
      }
    case DialogType.INFO:
      {
        return Column(
          children: [
            imageName != null
                ? Container(
              margin: const EdgeInsets.all(16),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageName),
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Container(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: KaskitaFormButton(
                        title: 'Ok',
                        actionCallback: () {
                          Navigator.pop(context);
                          if (actionCallBack != null) {
                            actionCallBack();
                          }
                        }),
                  ),
                )
              ],
            )
          ],
        );
      }
    case DialogType.CUSTOM:
      {
        return Column(
          children: [
            imageName != null
                ? Container(
              margin: const EdgeInsets.all(16),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageName),
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Container(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: KaskitaFormButton(
                        title: 'Bagikan',
                        actionCallback: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: KaskitaFormButton(
                        title: 'Unduh',
                        actionCallback: () {
                          Navigator.pop(context);
                          if (actionCallBack != null) {
                            actionCallBack();
                          }
                        }),
                  ),
                )
              ],
            )
          ],
        );
      }
    case DialogType.SEARCH_DROP_DOWN:
      {
        return Container();
      }
  }
}

import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';
import 'package:movable_cube/widgets/my_button.dart';
import 'package:movable_cube/widgets/my_text_field.dart';

class MyFieldsScreen extends StatefulWidget {
  const MyFieldsScreen({super.key});

  @override
  State<MyFieldsScreen> createState() => _MyFieldsScreenState();
}

class _MyFieldsScreenState extends State<MyFieldsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool _areFieldsFilled() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'My Fields',
              style: theme.titleMedium,
            )),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
              child: Column(
                children: [
                  TextFieldInput(
                    textEditingController: firstNameController,
                    hintText: 'First name',
                    textInputType: TextInputType.emailAddress,
                    color: MyColors.inputColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    textEditingController: lastNameController,
                    hintText: 'Last name',
                    textInputType: TextInputType.emailAddress,
                    color: MyColors.inputColor,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: MyButton(
                      onTapButton: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  actions: [
                                    Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Hello',
                                            style: theme.labelSmall,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          _areFieldsFilled()
                                              ? Text(
                                                  'Hello, ${firstNameController.text} ${lastNameController.text}')
                                              : const Text(
                                                  'Hello, Fields is empty.')
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                      },
                      text: 'Say Hi!',
                      isActive: true)),
            ),
          ],
        ));
  }
}

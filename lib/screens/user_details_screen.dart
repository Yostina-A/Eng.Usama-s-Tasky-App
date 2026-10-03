import 'package:flutter/material.dart';
import 'package:tasky/Core/Widgets/custom_text_form_field.dart';
import 'package:tasky/Core/services/prefences_manager.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    super.key,
    required this.userName,
    required this.motivationQuote,
  });

  final String userName;
  final String? motivationQuote;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late final TextEditingController userNameController = TextEditingController();
  late final TextEditingController motivationQuoteController;

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    // TextEditingValue(text: doesn't accpet a null string)
    userNameController.value = TextEditingValue(text: widget.userName);
    // TextEditingController(text: accepts null strings)
    motivationQuoteController = TextEditingController(
      text: widget.motivationQuote,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: [
              CustomTextFormField(
                label: "User Name",
                controller: userNameController,
                hintText: "Enter User Name",
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? false) {
                    return "Please enter User Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                label: "Motivation Quote",
                controller: motivationQuoteController,
                hintText: "Enter your Motivation Quote",
                maxLines: 3,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? false) {
                    return "Please enter motivation quote";
                  }
                  return null;
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    await PrefrencesManager().setString(
                      "username",
                      userNameController.value.text,
                    );

                    await PrefrencesManager().setString(
                      "motivationQuote",
                      motivationQuoteController.value.text,
                    );

                    Navigator.pop(context, true);
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 44),
                  // you can't use double.infinity with Size and so we need to use MediaQuery
                ),
                child: Text("Save Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

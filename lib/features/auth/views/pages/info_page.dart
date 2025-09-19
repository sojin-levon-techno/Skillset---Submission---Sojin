import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/auth/bloc/auth_bloc.dart';
import 'package:skilltest/features/auth/views/widgets/app_button.dart';
import 'package:skilltest/features/bottom_nav/bottom_nav.dart';

class InfoPage extends StatefulWidget {
  final String? phoneNumber;
  const InfoPage({super.key, this.phoneNumber});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: kPadding16,
          child: ListView(
            children: [
              const SizedBox(height: 28),

              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your name";
                  }
                  final nameRegEx = RegExp(r'^[a-zA-Z ]+$');
                  if (!nameRegEx.hasMatch(value.trim())) {
                    return "Name can only contain letters and spaces";
                  }
                  return null;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter Full Name",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimary),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 231, 231, 231),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 28),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoginOrRegister) {
                    context.pushAndRemoveUntil(
                      page: AppBottomNav(
                        name: _nameController.text.trim(),
                        phoneNumber: widget.phoneNumber,
                      ),
                    );
                  }
                  if (state is AuthError) {
                    final message = state.message;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: kPrimary,
                        content: Text(
                          message,
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    name: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          AuthLoginOrRegisterEvent(
                            phoneNumber: widget.phoneNumber ?? "",
                            firstName: _nameController.text.trim(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

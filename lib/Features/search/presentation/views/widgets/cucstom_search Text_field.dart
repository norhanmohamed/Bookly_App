import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({Key? key, required this.onSubmitted})
      : super(key: key);
  void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          enabledBorder: BuildOutlineBorderMethod(),
          focusedBorder: BuildOutlineBorderMethod(),
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Opacity(
              opacity: .8,
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ),
            ),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  OutlineInputBorder BuildOutlineBorderMethod() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}

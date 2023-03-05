import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy ',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(10),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Nec feugiat in fermentum posuere urna. Amet massa vitae tortor condimentum lacinia quis vel eros. Nec feugiat nisl pretium fusce id velit ut. Tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse. Ornare massa eget egestas purus viverra accumsan in nisl. Facilisi cras fermentum odio eu feugiat pretium nibh. Non enim praesent elementum facilisis leo vel fringilla. Imperdiet massa tincidunt nunc pulvinar sapien et. Pharetra convallis posuere morbi leo urna molestie at elementum eu. Euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis. Ultrices mi tempus imperdiet nulla. Aliquam ut porttitor leo a diam sollicitudin tempor. Ipsum suspendisse ultrices gravida dictum fusce. Sed augue lacus viverra vitae congue eu consequat ac felis Sed augue lacus viverra vitae congue eu consequat ac felis.Ultrices mi tempus imperdiet nulla. Aliquam ut porttitor leo a diam sollicitudin tempor. Ipsum suspendisse ultrices gravida dictum fusce. Sed augue lacus viverra vitae congue eu consequat ac felis. Sed augue lacus viverra vitae congue eu consequat ac felis.",
              style: context.$style.bodyMedium?.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}

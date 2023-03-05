import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/widgets/src/custom_button.dart';
import 'package:kabor/features/all_services/widgets/all_services_list.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Widget build(BuildContext context) {
    var isChecked = List<bool>.filled(6, false);
    return Scaffold(
      appBar: KaborAppBar(
        title: 'All Services',
        trailing: AppFilterButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              clipBehavior: Clip.none,
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              builder: (context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text(
                                  'Salon',
                                  style: context.$style.bodyMedium,
                                ),
                                trailing: Checkbox(
                                  value: isChecked[index],
                                  checkColor: Colors.white,
                                  shape: const CircleBorder(),
                                  side: BorderSide.none,
                                  activeColor: const Color(0xff3DA925),
                                  onChanged: (val) {
                                    setState(() {
                                      isChecked[index] = val!;
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    isChecked[index] = true;
                                  });
                                },
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              height: 3,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            itemCount: 6,
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        const Gap(5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: MyCustombutton(
                            onTap: () {
                              setState(() {
                                isChecked = List<bool>.filled(6, false);
                              });
                            },
                            text: 'Clear Filter',
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppSearchField(),
              Expanded(
                child: AllServicesCard(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

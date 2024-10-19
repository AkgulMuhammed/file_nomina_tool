import 'package:filenominatool/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:filenominatool/widgets/sidebar/title_section.dart';
import 'package:filenominatool/widgets/sidebar/menu_header_section.dart';
import 'package:filenominatool/widgets/sidebar/theme_toggle_section.dart';
import 'package:filenominatool/widgets/sidebar/support_section.dart';
import 'package:filenominatool/widgets/sidebar/developer_info_section.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  rive.StateMachineController? controller;
  rive.SMIInput<bool>? switchInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: AppColor.primaryColor.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const TitleSection(),
          const SizedBox(height: 20),
          const MenuHeaderSection(
            iconPath: "assets/theme.png",
            title: "Tema",
          ),
          const SizedBox(height: 10),
          ThemeToggleSection(
            controller: controller,
            switchInput: switchInput,
            onThemeToggle: (c, i) {
              setState(() {
                controller = c;
                switchInput = i;
              });
            },
          ),
          const SizedBox(height: 20),
          const MenuHeaderSection(
            iconPath: "assets/activity.png",
            title: "Araçlar",
          ),
          const SizedBox(height: 20),
          const Spacer(),
          const SupportSection(),
          const DeveloperInfoSection(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

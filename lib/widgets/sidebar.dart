import 'package:filenominatool/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart' as rive;

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
      color: Colors.blue.withOpacity(0.2),
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
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              double scaleFactor = 0.3;
              double width = 200 * scaleFactor;
              double height = 130 * scaleFactor;

              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      state.themeMode == ThemeMode.dark
                          ? 'Karanlık'
                          : 'Aydınlık',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (switchInput == null) return;
                      final isDark = switchInput?.value ?? false;
                      context.read<ThemeCubit>().changeTheme(
                            switchInput?.value == true
                                ? ThemeMode.light
                                : ThemeMode.dark,
                          );
                      switchInput?.change(!isDark);
                    },
                    borderRadius: BorderRadius.circular(150),
                    child: SizedBox(
                      height: height, // Oranlı yükseklik
                      width: width, // Oranlı genişlik
                      child: rive.RiveAnimation.asset(
                        "assets/switch_theme.riv",
                        fit: BoxFit.fill,
                        stateMachines: const ["Switch Theme"],
                        onInit: (artboard) {
                          controller = rive.StateMachineController.fromArtboard(
                            artboard,
                            "Switch Theme",
                          );
                          if (controller == null) return;
                          artboard.addController(controller!);
                          switchInput = controller?.findInput("isDark");
                          final mode =
                              context.read<ThemeCubit>().state.themeMode;
                          switchInput?.change(mode == ThemeMode.dark);
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          const MenuHeaderSection(
            iconPath: "assets/activity.png",
            title: "Araçlar",
          ),
          const SizedBox(height: 20),
          const MenuHeaderSection(
            iconPath: "assets/technical-support.png",
            title: "Bizi Destekleyin",
          ),
          const Spacer(),
          const DeveloperInfoSection(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text('File Nomina Tool',
          style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class MenuHeaderSection extends StatelessWidget {
  final String iconPath;
  final String title;

  const MenuHeaderSection(
      {super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                iconPath,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.3,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              indent: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class DeveloperInfoSection extends StatelessWidget {
  const DeveloperInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset('assets/instagram.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () {
                // Instagram linkine yönlendirme yapılabilir.
              },
            ),
            IconButton(
              icon: Image.asset('assets/github.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () {
                // GitHub linkine yönlendirme yapılabilir.
              },
            ),
            IconButton(
              icon: Image.asset('assets/linkedin.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () {
                // LinkedIn linkine yönlendirme yapılabilir.
              },
            ),
            IconButton(
              icon: Image.asset('assets/twitter.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () {
                // LinkedIn linkine yönlendirme yapılabilir.
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Coded By Muhammed Akgül',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        GestureDetector(
          onTap: () {
            // Burada web sitesine yönlendirme işlemi yapılabilir.
          },
          child: Text(
            'www.muhammedakgul.com',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                decoration: TextDecoration.underline,
                fontSize: 11,
                fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}

import 'package:filenominatool/core/theme/app_color.dart';
import 'package:filenominatool/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart' as rive;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

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
          const Spacer(),
          const MenuHeaderSection(
            iconPath: "assets/technical-support.png",
            title: "Bizi Destekleyin",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Aşağıdaki Cüzdan Adresini Kullanarak Gelişmemiz için Bize Destek olabilirsiniz",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColor.secondaryColor
                      : AppColor.black,
                  fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/binance-qr.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "TQCwGy6F3w77uQqZn63bNDM1J7szqx9b68",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColor.secondaryColor
                              : AppColor.black,
                        ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColor.secondaryColor
                        : AppColor.black,
                    size: 16,
                  ),
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(
                      text: "TQCwGy6F3w77uQqZn63bNDM1J7szqx9b68",
                    ));

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cüzdan adresi kopyalandı!'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
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
            width: 20,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                iconPath,
                color: Theme.of(context).iconTheme.color,
                height: 15, // Social icon size adjustment
                width: 15,
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
                  : AppColor.black,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset('assets/instagram.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () async {
                final url =
                    Uri.parse("https://www.instagram.com/akgulmuhammed_");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            IconButton(
              icon: Image.asset('assets/github.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () async {
                final url = Uri.parse("https://github.com/AkgulMuhammed");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            IconButton(
              icon: Image.asset('assets/linkedin.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () async {
                final url = Uri.parse(
                    "https://tr.linkedin.com/in/muhammed-akgul-b36828253");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            IconButton(
              icon: Image.asset('assets/twitter.png',
                  color: Theme.of(context).iconTheme.color,
                  height: 15,
                  width: 15),
              onPressed: () async {
                final url = Uri.parse("https://x.com/muhammedakgul_");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
          ],
        ),
        Text(
          'Coded By Muhammed Akgül',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 8, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () async {
            final url = Uri.parse("https://www.muhammedakgul.com");
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Text(
            'www.muhammedakgul.com',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.grey,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}

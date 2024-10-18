import 'package:filenominatool/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filenominatool/core/theme/cubit/theme_cubit.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Scaffold(
        body: Stack(
          children: [
            // Ana arka planı oval yapıyoruz
            GlassmorphicContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              borderRadius: 25,
              blur: 20,
              alignment: Alignment.center,
              border: 0,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.1),
                ],
                stops: const [0.1, 1],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.1),
                ],
              ),
              child: Row(
                children: [
                  // Sol tarafta side bar olacak
                  const SideBar(), // SideBar bileşenini burada kullanıyoruz
                  // Sağ tarafta dosyalar ile ilgili işlemler
                  Expanded(
                    child: Center(
                      child: Text('Dosyalar ile ilgili işlemler',
                          style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  ),
                ],
              ),
            ),
            // Pencereyi sürüklemek için kullanılan alan
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (details) {
                  appWindow.startDragging();
                },
                child: Container(
                  height: 40,
                  color: Colors.transparent,
                ),
              ),
            ),
            // Sağ üst köşeye pencere kontrol butonları ekleme
            Align(
              alignment: Alignment.topRight,
              child: WindowTitleBarBox(
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    final isDark = state.themeMode == ThemeMode.dark;
                    final iconColor = isDark ? Colors.white : Colors.black;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MinimizeWindowButton(
                            colors: WindowButtonColors(iconNormal: iconColor)),
                        MaximizeWindowButton(
                            colors: WindowButtonColors(iconNormal: iconColor)),
                        CloseWindowButton(
                            colors: WindowButtonColors(iconNormal: iconColor)),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

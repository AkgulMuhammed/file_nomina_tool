import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filenominatool/core/theme/cubit/theme_cubit.dart';

class ThemeToggleSection extends StatelessWidget {
  final rive.StateMachineController? controller;
  final rive.SMIInput<bool>? switchInput;
  final Function(rive.StateMachineController?, rive.SMIInput<bool>?)
      onThemeToggle;

  const ThemeToggleSection({
    super.key,
    this.controller,
    this.switchInput,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
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
                state.themeMode == ThemeMode.dark ? 'Karanlık' : 'Aydınlık',
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
                height: height,
                width: width,
                child: rive.RiveAnimation.asset(
                  "assets/switch_theme.riv",
                  fit: BoxFit.fill,
                  stateMachines: const ["Switch Theme"],
                  onInit: (artboard) {
                    final ctrl = rive.StateMachineController.fromArtboard(
                      artboard,
                      "Switch Theme",
                    );
                    if (ctrl == null) return;
                    artboard.addController(ctrl);
                    final input = ctrl.findInput<bool>("isDark");
                    input?.change(
                      context.read<ThemeCubit>().state.themeMode ==
                          ThemeMode.dark,
                    );
                    onThemeToggle(ctrl, input);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

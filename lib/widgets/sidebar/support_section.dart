import 'package:filenominatool/widgets/sidebar/menu_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:filenominatool/core/theme/app_color.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(
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
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperInfoSection extends StatelessWidget {
  const DeveloperInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
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

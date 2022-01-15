import 'package:flutter/material.dart';
import 'package:flutter_website/pages/home/components/carousel.dart';
import 'package:flutter_website/pages/home/components/cv_section.dart';
import 'package:flutter_website/pages/home/components/education_section.dart';
import 'package:flutter_website/pages/home/components/footer.dart';
import 'package:flutter_website/pages/home/components/header.dart';
import 'package:flutter_website/pages/home/components/ios_app_ad.dart';
import 'package:flutter_website/pages/home/components/portfolio_stats.dart';
import 'package:flutter_website/pages/home/components/skill_section.dart';
import 'package:flutter_website/pages/home/components/sponsors.dart';
import 'package:flutter_website/pages/home/components/testimonial_widget.dart';
import 'package:flutter_website/pages/home/components/website_ad.dart';
import 'package:flutter_website/utils/constants.dart';
import 'package:flutter_website/utils/globals.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title!,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(),
              ),
              Carousel(),
              const SizedBox(
                height: 20.0,
              ),
              CvSection(),
              IosAppAd(),
              const SizedBox(
                height: 70.0,
              ),
              WebsiteAd(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: PortfolioStats(),
              ),
              const SizedBox(
                height: 50.0,
              ),
              EducationSection(),
              const SizedBox(
                height: 50.0,
              ),
              SkillSection(),
              const SizedBox(
                height: 50.0,
              ),
              Sponsors(),
              const SizedBox(
                height: 50.0,
              ),
              TestimonialWidget(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

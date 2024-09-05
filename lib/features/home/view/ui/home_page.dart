import 'package:flutter/material.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/features/addlisting/view/ui/account_information.dart';
import 'package:vylee_partner/features/addlisting/view/ui/service_categories/service_category.dart';
import 'package:vylee_partner/features/home/view%20model/home_view_model.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.name});

  final String? name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeViewModel {
  int pageIndex = 0;
  List<Widget> screens = [];
  @override
  void initState() {
    super.initState();
    screens = [
      getFirstScreen(widget.name, () {
        setState(() {
          pageIndex = 2;
        });
      }),
      const ServiceCategory(),
      const AccountInformation()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.black,
          selectedItemColor: AppColors.black,
          backgroundColor: Colors.grey.shade300,
          currentIndex: pageIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                break;
              case 1:
                //navigate to add listings
                break;
              case 2:
                //navigate to profile
                break;
              default:
            }
            setState(() {
              pageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: pageIndex == 0
                          ? AppColors.bottomNavigationIcon
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    ImagePath.bookingsIcon,
                    width: 30,
                    height: 30,
                    color: pageIndex == 0 ? AppColors.white : null,
                  ),
                ),
                label: "Bookings"),
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: pageIndex == 1
                          ? AppColors.bottomNavigationIcon
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    ImagePath.addListingIcon,
                    width: 30,
                    height: 30,
                    color: pageIndex == 1 ? AppColors.white : null,
                  ),
                ),
                label: "Manage Services"),
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: pageIndex == 2
                          ? AppColors.bottomNavigationIcon
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    ImagePath.profileIcon,
                    width: 30,
                    height: 30,
                    color: pageIndex == 2 ? AppColors.white : null,
                  ),
                ),
                label: "Profile"),
          ],
        ),
        body: screens.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : screens[pageIndex]);
  }
}

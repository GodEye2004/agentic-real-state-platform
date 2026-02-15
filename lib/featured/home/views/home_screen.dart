import 'package:flutter/material.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_state.dart';
import 'package:flutter_application_1/featured/home/providers/show_properies_provider.dart';
import 'package:flutter_application_1/featured/home/widget/home_box.dart';
import 'package:flutter_application_1/featured/home/widget/home_property_card.dart';
import 'package:flutter_application_1/featured/home/widget/home_searchbox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: authState.when(
        data: (state) {
          if (state is Authenticated) {
            return SafeArea(
              top: true,
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: .all(20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'ملکینو',
                        style: GoogleFonts.vazirmatn(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  HomeSearchbox(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      HomeBox(
                        title: 'ثبت آگهی',
                        icon: Icon(Icons.add_sharp),
                        onClick: () {
                          context.go('/property-submit');
                        },
                      ),
                      HomeBox(
                        title: 'چت با هوش مصنوعی',
                        icon: Icon(Icons.chat),
                        onClick: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: .all(20.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'ملک ها',
                        style: GoogleFonts.vazirmatn(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // show property listings
                  Expanded(
                    child: ref
                        .watch(propertiesProvider)
                        .when(
                          data: (PropertyResponse) {
                            return ListView.builder(
                              itemCount: PropertyResponse.properties.length,
                              itemBuilder: (context, index) {
                                final item = PropertyResponse.properties[index];
                                return HomePropertyCard(property: item);
                              },
                            );
                          },
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (err, stack) =>
                              Center(child: Text(err.toString())),
                        ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Not authenticated'));
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

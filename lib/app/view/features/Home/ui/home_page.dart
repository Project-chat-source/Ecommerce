import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/app/core/routes/app_route.dart';
import 'package:learning/app/global/secure%20storage/secure_storage.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_bloc.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_event.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_state.dart';
import 'package:learning/app/view/features/Home/ui/widgets/products_list.dart';
import 'package:learning/main.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SecureStorage pref = getIt<SecureStorage>();
  final ScrollController scrollController = ScrollController();

  String username = '';
  String image = '';
  String email = '';
  String firstName = '';
  String lastName = '';
  String gender = '';

  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(LoadProducts());
    fetchUserDetails(); 
  }

  Future<void> fetchUserDetails() async {
    final u = await pref.getValue('username');
    final img = await pref.getValue('image');
    final em = await pref.getValue('email');
    final fn = await pref.getValue('firstName');
    final ln = await pref.getValue('lastName');
    final g = await pref.getValue('gender');

    if (!mounted) return;

    setState(() {
      username = u ?? '';
      image = img ?? '';
      email = em ?? '';
      firstName = fn ?? '';
      lastName = ln ?? '';
      gender = g ?? '';
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onlogOut() {
    pref.removeAllValues();
    context.router.replaceAll([LoginRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    final avatarLetter = username.isNotEmpty ? username[0].toUpperCase() : '?';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 5,
        actions: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(child: Text(avatarLetter)),
              OutlinedButton(onPressed: onlogOut, child: Icon(Icons.logout)),
              SizedBox(),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 40, child: Text(avatarLetter)),
                    Text(
                      '$firstName $lastName',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      selected: true,
                      selectedTileColor: Colors.white12,
                    ),
                    ListTile(
                      leading: Icon(Icons.work_rounded),
                      title: Text('Products'),
                    ),
                    ListTile(
                      leading: Icon(Icons.post_add),
                      title: Text('Posts'),
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt),
                      title: Text('Recipes'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(
          context,
        ).copyWith(scrollbars: false, overscroll: false),
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    Expanded(
                      child: ProductsList(
                        products: state.products,
                        scrollController: scrollController,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

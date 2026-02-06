import 'package:flutter/material.dart';

class AppDetailScreen extends StatelessWidget {
  final String appId;
  const AppDetailScreen({super.key, required this.appId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.apps, size: 60),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dynamic App Name', style: Theme.of(context).textTheme.titleLarge),
                      const Text('Developer Name'),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Download / Buy'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text('About this app', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            const Text(
              'This is a placeholder for the app description. It will contain detailed information about the app, its features, and recent updates.',
            ),
            const SizedBox(height: 32),
            Text('Screenshots', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(right: 16),
                    child: Container(width: 300, color: Colors.white10),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

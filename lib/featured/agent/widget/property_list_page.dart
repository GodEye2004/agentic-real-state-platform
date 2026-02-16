import 'package:flutter/material.dart';
import 'package:flutter_application_1/featured/agent/widget/property_card.dart';
import 'package:flutter_application_1/models/agentTalk/agent_talk.dart';

class PropertyCardsPage extends StatelessWidget {
  final List<AgentTalkProperty> properties;

  const PropertyCardsPage({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '${properties.length} ملک',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return PropertyCard(property: properties[index]);
        },
      ),
    );
  }
}

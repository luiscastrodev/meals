import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChange;
  final Settings settings;

  SettingsScreen(this.settings, this.onSettingsChange);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwicth(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChange,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      onChanged: (value) {
        onChange(value);
        widget.onSettingsChange(settings);
      },
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _createSwicth(
                'Sem Glúten',
                'Só exibe refeições sem glúten',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createSwicth(
                'Sem Lactose',
                'Só exibe refeições sem lactose',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwicth(
                'Vegana',
                'Só exibe refeições veganas',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

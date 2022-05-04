import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _incrementando = true;
  int _contador = 0;
  List<int> _historico = [];
  int _totalHistorico = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Flutter',
              style: TextStyle(color: Colors.white)),
      ),
      drawer: _buildDrawer(context),
      body: _buildCenter(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarOuDecrementar,
        tooltip: _incrementando ? 'Incrementar' : 'Decrementar',
        child: _incrementando ? Icon(Icons.add) : Icon(Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Center _buildCenter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'tocou o botao quantas vezes:',
            style: TextStyle(fontSize: 15, color: Colors.white)),
          const SizedBox(height: 20.0),
          Text(
            '$_contador',
            style: TextStyle(fontSize: 50, color: Colors.white)),
         const SizedBox(height: 20.0),
         const Text(
            'historico:',
            style: TextStyle(fontSize: 25, color: Colors.white)),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              _historico.isEmpty ? '(vazio)' : _historico.join (', '),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, color: Colors.white)
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
              'total:',
              style: TextStyle(fontSize: 25, color: Colors.white)),
          const SizedBox(height: 20.0),
          Text(
              '$_totalHistorico',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, color: Colors.white)),
          Icon(Icons.bug_report,
              size: 65, color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child:const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24)
            )
          ),
          ListTile(leading: const Icon(Icons.clear),
               title: const Text('Zerar Contador'),
            onTap: _zerar),
          ListTile(
              leading: const Icon(Icons.swap_calls),
              title: const Text('Inverter Contador'),
              onTap: _inverter),
          ListTile(leading: const Icon(Icons.save),
              title: const Text('Memorizar Contador'),
              onTap: _memorizar),
        ]));
  }
  void _incrementarOuDecrementar() {
    setState(() {
      if(_incrementando){
        _contador++;
      }else{
        _contador--;
      }
    });
  }

  void _zerar(){
    Navigator.of(context).pop();
    setState(() {
      _contador = 0;
      _historico.clear();
      _totalHistorico = 0;
    });

  }

  void _inverter(){
    Navigator.of(context).pop();
    setState(() {
      _incrementando = !_incrementando;
    });
  }

  void _memorizar(){
    Navigator.of(context).pop();
    setState(() {
      _historico.add(_contador);
      _totalHistorico = _historico.isEmpty ? 0 : _historico.reduce((a, b) => a + b);
    });
  }
}



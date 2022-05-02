
enum Sexo {masculino, feminino}
Sexo? strToSexo(String? str){
  if (str == null){
    return null;
  }
  switch(str.toUpperCase()){
    case 'MASCULINO':
    case 'M':
      return Sexo.masculino;
    case 'FEMININO':
    case 'F':
      return Sexo.feminino;
  }
}
class Pessoa {
  String? Nome;
  String? Cpf;
  DateTime? Nascimento;
  int? Idade;
  Sexo? sexo;

  Pessoa(this.Nome, this.Cpf, this.Nascimento, this.sexo);

  Pessoa.fromMap(Map<String, String> map){
    Nome = map['nome'];
    Cpf = map['cpf'];
    Nascimento = DateTime.parse(map['nascimento'] ?? '2000-01-01');
    sexo = strToSexo(map['sexo']);
  }


  int? getIdade(){
    if(Nascimento == null){
      return null;
    }
      final hoje = DateTime.now();
      final idade = hoje.difference(Nascimento!);
      return (idade.inDays ~/ 365);

  }
  @override
  String toString(){
    return "{nome=$Nome, cpf=$Cpf, nascimento=$Nascimento, idade=${getIdade()},"
        "sexo=$sexo}";
  }
}

class Programador extends Pessoa{
  double? Salario;
  Programador (String? Nome, String? Cpf, DateTime? Nascimento, Sexo? sexo, this.Salario)
      : super(Nome, Cpf, Nascimento, sexo);

  Programador.fromMap(Map<String, String> map) : super.fromMap(map){
    Salario = double.tryParse(map['salario'] ?? "0.0");
  }

  @override
  String toString() {
    return "{nome=$Nome, cpf=$Cpf, nascimento=$Nascimento, idade=${getIdade()},"
        "sexo=$sexo, salariario=$Salario}";
  }

}

void mainEntidades(){
  final map ={
    'nome' : 'Gabriel',
    'cpf': '10064510999',
    'nascimento': '2003-05-02',
    'sexo': 'M',
    'salario': '10000.054'
  };

  Pessoa pessoa = Programador.fromMap(map);
  // bool isBoss = true;
  //
  // Programador pessoa = Programador();
  // pessoa.Nome = "Gabriel";
  // pessoa.Nascimento = DateTime(2003,05,02);
  // pessoa.Cpf = "100.645.109-99";
  // pessoa.Idade = 19;
  // pessoa.sexo = Sexo.masculino;
  // pessoa.Salario = (isBoss) ? 10000.00 : 2000.00;
  print(pessoa);
}

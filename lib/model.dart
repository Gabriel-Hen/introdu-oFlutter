
enum Sexo {masculino, feminino}
class Pessoa {
  String? Nome;
  String? Cpf;
  DateTime? Nascimento;
  int? Idade;
  Sexo? sexo;

  int getIdade(){
    if(Nascimento == null){

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
  @override
  String toString() {
    return "{nome=$Nome, cpf=$Cpf, nascimento=$Nascimento, idade=${getIdade()},"
        "sexo=$sexo, salariario=$Salario}";
  }

}

void mainEntidades(){
  Programador pessoa = Programador();
  pessoa.Nome = "Gabriel";
  pessoa.Nascimento = DateTime(2003,05,02);
  pessoa.Cpf = "100.645.109-99";
  pessoa.Idade = 19;
  pessoa.sexo = Sexo.masculino;
  pessoa.Salario = 2000.00;
  print(pessoa);
}

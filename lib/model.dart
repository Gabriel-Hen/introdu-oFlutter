
enum Sexo {masculino, feminino}
class Pessoa {
  String? Nome;
  String? Cpf;
  DateTime? Nascimento;
  int? Idade;
  Sexo? sexo;
  double? Salario;
  bool? Programador;

  @override
  String toString(){
    return "{nome=$Nome, cpf=$Cpf, nascimento=$Nascimento, idade=$Idade,"
        "sexo=$sexo, salariario=$Salario, programador=$Programador}";
  }
}

void mainEntidades(){
  Pessoa pessoa = new Pessoa();
  pessoa.Nome = "Gabriel";
  pessoa.Nascimento = DateTime(2003,05,02);
  pessoa.Cpf = "100.645.109-99";
  pessoa.Idade = 19;
  pessoa.sexo = Sexo.masculino;
  pessoa.Salario = 2000.00;
  pessoa.Programador = true;
  print(pessoa);
}

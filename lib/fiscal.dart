import 'dart:collection';

enum Sexo { Masculino, Feminino }

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa({this.nome, this.cpf, this.nascimento, this.sexo});
}

class NotaFiscal {
  int? numero;
  DateTime? emissao;
  Pessoa? cliente = Pessoa();
  String? enderecoEntrega;
  List<ItemNF> itens = [];

  NotaFiscal({this.numero, this.emissao, this.enderecoEntrega, this.cliente});

  double calcularValorTotal() {
    var total = itens.map((e) => e.calcularValorTotalItem());
    return total.reduce((a, b) => a + b);
  }

  double calcularTotalDesconto() {
   var totalDesconto = itens.map((e) => e.desconto);
   return totalDesconto.reduce((b, a) => b + a );
  }

  double calcularTotalAcrescimo() {
    var totalAcrescismo = itens.map((e) => e.acrescimo);
    return totalAcrescismo.reduce((a, b) => a + b);
  }

  ItemNF? getProdutoMaisBataro() {
    final produtoMaisBarato = itens.reduce((a, b) =>
    a.calcularValorTotalItem() < b.calcularValorTotalItem() ? a : b);
    return produtoMaisBarato;
  }

  ItemNF? getProdutoMaisCaro() {
    final produtoMaisCaro = itens.reduce((a, b) =>
    a.calcularValorTotalItem() > b.calcularValorTotalItem() ? a : b);
    return produtoMaisCaro;
  }

  ItemNF addItem({required String produto,
    required double valor,
    double desconto = 0.0,
    double acrescimo = 0.0}) {
    ItemNF item = ItemNF(
        numSeq: itens.length + 1,
        produto: produto,
        valor: valor,
        desconto: desconto,
        acrescimo: acrescimo);
    itens.add(item);
    return item;
  }

  bool possuiDesconto() {
    return itens.any((i) => i.desconto > 0.0);

  }

  List<ItemNF> itensComDesconto() {
    return itens.where((element) => element.desconto > 0.0).toList();
  }

  String getStrItens(){
    return itens.map((i) => "${i.numSeq}: ${i.produto}").join(", ");
  }

}

class ItemNF {
  int numSeq;
  String produto;
  double valor;
  double desconto;
  double acrescimo;

  ItemNF({required this.numSeq,
    this.acrescimo = 0.0,
    this.desconto = 0.0,
    required this.valor,
    required this.produto});

  double calcularValorTotalItem() {
    double total = valor - desconto + acrescimo;
    return total;
  }

  @override
  String toString() {
    return '{numSeq=$numSeq, produto=$produto, valor=$valor,'
        ' desconto=$desconto, acrescimo=$acrescimo,'
        ' valorTotal=${calcularValorTotalItem()}}';
  }
}

void mainNotaFiscal() {
  final pessoa = Pessoa(nome: 'Gabriel');
  final nota = NotaFiscal(
      cliente: pessoa,
      emissao: DateTime(2022, 05, 03),
      enderecoEntrega: 'Rua 7 de setembro',
      numero: 1500);
  nota.addItem(produto: 'notebook', valor: 1000.0, acrescimo: 150.50);
  nota.addItem(produto: 'teclado', valor: 200.0);
  print(nota.getStrItens());
}

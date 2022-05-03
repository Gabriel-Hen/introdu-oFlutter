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
    double total = 0.0;
    for (int i = 0; i < itens.length; i++) {
      total += itens[i].calcularValorTotalItem();
    }
    return total;
  }

  double calcularTotalDesconto() {
    double totalDesconto = 0.0;
    for (int i = 0; i < itens.length; i++) {
      totalDesconto += itens[i].desconto;
    }
    return totalDesconto;
  }

  double calcularTotalAcrescimo() {
    double totalAcrescimo = 0.0;
    for (int i = 0; i < itens.length; i++) {
      totalAcrescimo += itens[i].acrescimo;
    }
    return totalAcrescimo;
  }

  ItemNF? getProdutoMaisBataro() {
    ItemNF? itemMaisBarato;
    for (ItemNF item in itens) {
      if (itemMaisBarato == null) {
        itemMaisBarato = item;
      } else if (item.calcularValorTotalItem() <
          itemMaisBarato.calcularValorTotalItem()) {
        itemMaisBarato = item;
      }
    }
    return itemMaisBarato;
  }

  ItemNF? getProdutoMaisCaro() {
    ItemNF? itemMaisCaro;
    for (ItemNF item in itens) {
      if (itemMaisCaro == null) {
        itemMaisCaro = item;
      } else if (item.calcularValorTotalItem() >
          itemMaisCaro.calcularValorTotalItem()) {
        itemMaisCaro = item;
      }
    }
    return itemMaisCaro;
  }

  ItemNF addItem(
      {required String produto,
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
}

class ItemNF {
  int numSeq;
  String produto;
  double valor;
  double desconto;
  double acrescimo;

  ItemNF(
      {required this.numSeq,
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
  print('Valor total da NF = ${nota.getProdutoMaisCaro()}');
}

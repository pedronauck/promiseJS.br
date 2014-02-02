## Introdução ao Promises

Este guia assume que você tenha certa familiaridade com JavaScript básico e deve ser adequado tanto para pessoas novas em programação assíncrona quanto para aqueles que já tem alguma experiência.

## <a name="motivacao"></a> Motivação

Nós queremos que nosso código seja assíncrono, porque se nós escrevemos códigos síncronos então a interface do usuário irá travar (nas aplicações no lado do cliente) ou as requisições não vão ser manipuladas (nas aplicações no lado do servidor). Uma forma de resolver este problema são as threads, mas elas criam seus próprios problemas e elas não são suportadas no JavaScript.

Uma das formas mais simples de se fazer funções assíncronas é aceitando uma função callback. Isso é o que o Node.js faz (no momento em que escrevo). Isto funciona, mas tem um certo número de problemas.

1. Você perde a separação de entradas e saídas da função, pois o callback deve ser passado como uma entrada.
2. É difícil de compor múltiplas operações seriais ou paralelas.
3. Você perde muitas informações úteis da depuração (debugg), e capacidade de manipulação de erros relativos ao rastreamento e execeções.
4. Você não pode mais usar as construções do fluxo de controle embutidas, e todas elas devem ser reinventadas para trabalhar assíncronamente.

Muitas APIs no navegador usam algum tipo de modelo de evento baseado no fluxo de controle, que resolve o problema 1, mas não os problemas 2 e 4.

Promises tem por objetivo resolver o problema 1 e 3 e pode resolver o problema 4 no ES6 (com o uso de generators).

## <a name="uso-basico"></a> Uso Básico

A ideia central por trás das promises (promessas) é que uma promise representa um valor que é o resultado de uma operação assíncrona. Elas podem como alternativa vir a ser um erro lançado. Funções assíncronas podem retornar promises:

```language-javascript
var prom = get('http://www.example.com');
```

Se nós requisitarmos o conteúdo da página ```www.example.com``` nós vamos estar fazendo isso assíncronamente então podemos receber uma promise de volta.

No intuito de extrair o valor desta promise, nós usamos <code class="language-javascript">.done</code> que enfilera uma função a ser executada quando a promise é preenchida com algum resultado.

```language-javascript
var prom = get('http://www.example.com');
prom.done(function ( content ) {
	console.log( content );
})
```

Note como nós passamos uma função que ainda não foi chamada para <code class="language-javascript">.done</code> e isso vai ser chamado apenas uma vez, quando o promise estiver preenchido. Nós podemos chamar <code class="language-javascript">.done</code> quantas vezes quisermos, antes ou depois, como quisermos, e sempre iremos obter o mesmo resultado. Por exemplo, não há problema em chamá-lo depois que a promise já estiver resolvida:

```language-javascript
var cache = {};

function getCache ( url ) {
	if ( cache[url] ) return cache[ url ];
	else return cache[ url ] = get( url );
}

var promA = getCache( 'http://www.example.com' );

promA.done(function ( content ) {
	console.log( content );
});

setTimeout(function () {
	var promB = getCache( 'http://www.example.com' );
	promB.done(function ( content ) {
		console.log( content );
	});
}, 10000);
```

Claro, requisitar uma página de erro vai facilmente dar errado, e lançar um erro. Por padrão, <code class="language-javascript">.done</code> somente lança este erro, então isto fica registrado apropriadamente e (em ambientes diferentes do browser) quebra a aplicação. Nós frequentemente queremos atribuir nosso próprio manipulador:

```language-javascript
var prom = get( 'http://www.example.com' );
prom.done(function ( content ) {
	console.log( content );
}, function ( ex ) {
	console.error( 'Requisição www.example.com falhou, você deveria tentar novamente?' );
	console.error( ex.stack );
});
```

## <a name="transformacao"></a> Transformação

Sempre que você tiver uma promise para uma coisa e você precisa fazer algum trabalho nela para obter uma promise para outra coisa. Promises tem um método <code class="language-javascript">.then</code> que trabalha um pouco parecido com um <code class="language-javascript">.map</code> em um array.

```language-javascript
function getJSON ( url ) {
	return get ( url )
		.then(function ( res ) {
			return JSON.parse( res );
		});
}

getJSON( 'htttp://www.example.com/foo.json' ).done(function ( res ) {
	console.log( res );
});
```

Note como <code class="language-javascript">.then</code> manuseia qualquer erro para nós, então eles "sobem" nas pilhas como no código síncrono. VOcê pode também manipulá-los quando você chama <code class="language-javascript">.then</code>

## <a name="combinacao"></a> Combinação

Uma vantagem de uma promises sendo um valor é que você pode executar operações úteis para combinar promises. Uma dessas operações que a maioria das bibliotecas suportam é:

```language-javascript
var a = get('http://www.example.com')
var b = get('http://www.example.co.uk')
var both = Promise.all([a, b])
both.done(function (res) {
  var a = res[0]
  var b = res[1]
  console.dir({
    '.com': a,
    '.co.uk': b
  })
})
```

Isso é extramamente útil caso você precisa rodar uma série de operações em pararelo. A idéia também se extende a grande arrays, sem limite de valores:

<pre>
<code class="language-javascript">
function readFiles(files) {
	return Promise.all(files.map(function (name) {
	  return readFile(name)
	}))
}
readFiles(['fileA.txt', 'fileB.txt', 'fileC.txt']).done(function (filesContents) {
  console.dir(filesContents)
})
</code>
</pre>

Naturalmente, operações em série podem ser compostas apenas usando <code class="language-javascript">then</code>.

<pre>
<code class="language-javascript">
get('http://www.example.com').then(function (res) {
  console.log('.com')
  console.dir(res)
  return get('http://www.example.co.uk')
}).done(function (res) {
  console.log('.co.uk')
  console.dir(res)
})
</code>
</pre>

E com uma pequena imaginação você pode usar esta técnica para ligar com arrays, bem como:

<pre>
<code class="language-javascript">
function readFiles(files) {
  var result = []
  
  // create an initial promise that is already fulfilled with null
  var ready = Promise.from(null)
  
  files.forEach(function (name) {
    ready = ready.then(function () {
      return readFile(name)
    }).then(function (content) {
      result.push(content)
    })
  })
  
  return ready.then(function () {
    return result
  })
}
readFiles(['fileA.txt', 'fileB.txt', 'fileC.txt']).done(function (filesContents) {
  console.dir(filesContents)
})
</code>
</pre>

# Introdução ao Promises

Este guia assume que você tenha certa familiaridade com JavaScript básico e deve ser adequado tanto para pessoas novas em programação assíncrona quanto para aqueles que já tem alguma experiência.

## Motivação

Nós queremos que nosso código seja assíncrono, porque se nós escrevemos códigos síncronos então a interface do usuário irá travar (nas aplicações no lado do cliente) ou as requisições não vão ser manipuladas (nas aplicações no lado do servidor). Uma forma de resolver este problema são as threads, mas elas criam seus próprios problemas e elas não são suportadas no JavaScript.

Uma das formas mais simples de se fazer funções assíncronas é aceitando uma função callback. Isso é o que o Node.js faz (no momento em que escrevo). Isto funciona, mas tem um certo número de problemas.

1. Você perde a separação de entradas e saídas da função, pois o callback deve ser passado como uma entrada.

2. É difícil de compor múltiplas operações seriais ou paralelas.

3. Você perde muitas informações úteis da depuração (debugg), e capacidade de manipulação de erros relativos ao rastreamento e execeções.

4. Você não pode mais usar as construções do fluxo de controle embutidas, e todas elas devem ser reinventadas para trabalhar assíncronamente.

Muitas APIs no navegador usam algum tipo de modelo de evento baseado no fluxo de controle, que resolve o problema 1, mas não os problemas 2 e 4.

Promises tem por objetivo resolver o problema 1 e 3 e pode resolver o problema 4 no ES6 (com o uso de generators).

## Uso Básico

A ideia central por trás das promises (promessas) é que uma promise representa um valor que é o resultado de uma operação assíncrona. Elas podem como alternativa vir a ser um erro lançado. Funções assíncronas podem retornar promises:

<pre>
<code class="language-javascript">
var prom = get('http://www.example.com');
</code>
</pre>

Se nós requisitarmos o conteúdo da página <code>www.example.com</code> nós vamos estar fazendo isso assíncronamente então podemos receber uma promise de volta.

No intuito de extrair o valor desta promise, nós usamos <code>.done</code> que enfilera uma função a ser executada quando a promise é preenchida com algum resultado.

<pre>
<code class="language-javascript">
var prom = get('http://www.example.com');
prom.done(function ( content ) {
	console.log( content );
})
</code>
</pre> 
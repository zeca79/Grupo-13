# Atividade Prática I

Relatório da Atividade Prática I (AP1) de INE5406 em 2024.2. 

## Grupo 13

- Gabriel Raul Marino (Matrícula 20204843)
- Marco Jose Pedro (Matrícula 20105254)

## Descrição dos circuitos

### Decodificador BCD 7-Segmentos

![](https://i.ibb.co/hXVQH4S/decoder.png)

**O que é um decodificador BCD para 7 segmentos?**

Imagine que você tem um computador que "fala" apenas em números binários (zeros e uns), mas você quer que ele mostre um número em um display comum, como aqueles de relógios digitais. É aí que entra o decodificador BCD para 7 segmentos.

**BCD:** Essa sigla significa *"Binary Coded Decimal"* (Decimal Codificado em Binário). É uma forma de representar números decimais (0 a 9) usando quatro bits (combinações de zeros e uns).

**Display de 7 Segmentos:** Um display de 7 segmentos é composto por sete segmentos luminosos que, quando combinados de diferentes formas, podem mostrar todos os dígitos de 0 a 9.

![](https://camo.githubusercontent.com/6db1236052f2d34e2bef614fa4109b5d1ed3d095c37f9f78566591014603a3a6/68747470733a2f2f692e6779617a6f2e636f6d2f33623661333830373438313830363562633739643165306363663734613530392e676966)

**Como funciona:**

**Entrada:** O decodificador recebe um número em código BCD (quatro bits).

**Saída:** Ele transforma esse código BCD em um conjunto de sinais que acendem os segmentos corretos do display de 7 segmentos, formando o dígito correspondente.

**Interface:** Permite que sistemas digitais se comuniquem com o mundo real de forma mais visual e compreensível.

**Versatilidade:** Utilizado em diversos dispositivos eletrônicos, como calculadoras, relógios, medidores, etc.

**Em resumo:**

O decodificador BCD para 7 segmentos é um circuito eletrônico que traduz a linguagem binária dos computadores para uma linguagem visual que podemos entender, permitindo a exibição de números em displays de 7 segmentos.

#### Circuito desenvolvido

![](https://i.ibb.co/xS3dg87/rtl-Viewer.png)
*RTL Viewer*

O `RTL Viewer` no Quartus é uma ferramenta que gera uma visualização gráfica da descrição em alto nível do projeto VHDL, mostrando como o código foi sintetizado em componentes de hardware. 
RTL significa *Register Transfer Level*, e o RTL Viewer exibe a arquitetura em termos de blocos lógicos, portas, registradores e conexões entre eles.

```vhdl
ARCHITECTURE arch OF decodificadorBCD7Seg IS
BEGIN
output_logic : process( bcd )
begin
	case( bcd ) is	
		when "0000" => abcdefg <= "0000001"; -- 0
		when "0001" => abcdefg <= "1001111"; -- 1
		 ... e assim por diante para todos os dígitos de 0 a 9
		when others => abcdefg <= "0110000"; -- E (assumi E como Error)
	end case;
end process;
END ARCHITECTURE;

```
**Process Block**

O bloco `process` monitora mudanças no sinal `bcd` e, com base no valor, atualiza o valor da saída `abcdefg`.
`case( bcd )`: Estrutura de seleção que escolhe qual valor atribuir à saída `abcdefg` com base no valor de entrada `bcd`.

**Decodificação BCD para 7 Segmentos**

Cada valor de entrada BCD (4 bits) corresponde a um valor de saída de 7 bits, onde cada bit controla um dos segmentos do display. Os bits na saída representam o estado dos segmentos do display, onde `0` indica que o segmento está aceso e `1` indica que o segmento está apagado.
- `when "0000" => abcdefg <= "0000001";`: Para o valor BCD 0, os segmentos são acesos para formar o número "0" no display (todos os segmentos acesos, exceto o segmento `g`).
- `when "0001" => abcdefg <= "1001111";`: Para o valor BCD 1, os segmentos são acesos para formar o número "1" no display (apenas os segmentos `b` e `c` acesos).
Isso continua para os valores de BCD 0 a 9.
- `when others => abcdefg <= "0110000";` **Valor "E" (Erro)**: Para qualquer valor não esperado (valores fora do intervalo de BCD, como 10-15), o código assume um erro e exibe a letra "E" no display (como um padrão de erro).

#### Simulação

A simulação“gate-level”foi realizada através do ModelSim-Altera
utilizando arquivo de estímulos contendo todos os valores possíveis de entrada.

| BCD | TIME | 
|:-:|:-:|
| 0000 | 10ns |
| 0001 | 20ns |
| 0010 |30ns |
| 0011 | 40ns |
| 0100 |50ns |
| 0101 | 60ns |
| 0110 | 70ns |
| 0111 | 80ns |
| 1000 | 90ns |
| 1001 | 100ns |
| 1010 |110ns |
| 1011 |120ns |
| 1100 |130ns |
| 1101 | 140ns |
| 1110 | 150ns |
| 1111 | 160ns |

O intervalo de 10ns foi adicionado levando em consideração o pior atraso apontado na compilação, que foi de 9.143ns.

![](https://i.ibb.co/q788BnH/simulation.png)
*painel Wave exibindo as entradas e saídas da arquitetura em forma de onda*

**Conclusão**

Com base nos resultados da simulação apresentados, podemos concluir que o circuito projetado em VHDL e simulado no ModelSim-Altera funciona conforme o esperado. Todas as combinações possíveis de entrada BCD foram testadas e o circuito produziu as saídas corretas, de acordo com a tabela verdade do decodificador BCD para 7 segmentos.

### Valor absoluto

#### Circuito desenvolvido

#### Simulação


### Árvore de somas

#### Circuito desenvolvido

#### Simulação


## Outras observações

Aqui vocês podem comentar qualquer observação que vocês gostariam de levantar sobre os circuitos descritos, dificuldades gerais, etc.

Também podem adicionar se fizeram o desafio.

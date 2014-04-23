Funcionalidade: Calculadora
	A fim de evitar erros bobos
	Como não sou um bom matemático
	Quero utilizar uma calculadora para somar e multiplicar

Cenário: Adicionar dois números (Falha)
	Dado que digitei 50 na calculadora
		E digitei 50 na calculadora
	Quando pressionar Adicionar
	Então o resultado deve ser de 120 

Esboço do Cenário: Adicionar dois números 
	Dado que digitei <Num1> na calculadora
		E digitei <Num2> na calculadora
	Quando pressionar Adicionar
	Então o resultado deve ser de <soma> 

	Exemplos:
		| Num1 | num2 | soma | 
		| 1 | 2 | 3 | 
		| 4 | 5 | 9 |
		| 3 | 1 | 4 | 

Cenário: Multiplique três números
	Dado que digitei 5 na calculadora
		E digitei 5 na calculadora
		E digitei 4 na calculadora
	Quando pressionar multiplicar 
	Então o resultado deve ser de 100 

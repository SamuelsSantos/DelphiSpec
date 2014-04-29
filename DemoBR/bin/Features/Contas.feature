Funcionalidade: Contas 

Conhecimento:
	Dado a lista de usuários:
	| Id | nome | senha | 
	| 1 | João | 1234 | 
	| 2 | Maria | 4321 | 

Cenário: Acesso liberado
	Dado que o usuário é o "João" 
		e a senha é "1234" 
	Quando acessar 
	Então as mensagens privadas poderão ser visualizadas. 

Cenário: Acesso negado
	Dado que o usuário é o "João" 
		e a senha é "1578" 
	Quando acessar 
	Então o acesso será negado. 
	
Cenário: Remover usuário 
	Dado que o usuário é o "João" 
		e a senha é "1234" 
	Mas o usuário "João" foi excluído 
	Quando acessar 
	Então o acesso será negado.

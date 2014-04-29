Funcionalidade: Filtro Spam

Cenário: Lista Negra
  Dado que eu tenho uma lista negra:
      """
      m@mail.com
      123@mail.com
      """
    e minha caixa de entrada está vazia
  Quando eu recebo um email de "m@mail.com"
  Então minha caixa de entrada está vazia.

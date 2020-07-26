![](assets\images\splashscreen.png)

# Quiz App - EduMath

Projeto de um app quiz de matemática para estudos de implementação do Clean Architecture no Flutter

---

## Construção

### Tipografia/Fontes

- Poppins

### Paleta de cores

- incorrectColor (#F0F0F5)
- correctColor (#22C73F)
- BackgroundColorPurple (#6a2799)
- foregroundColorPurple (#9d3be1)

### Mockup base

[EduMath - Design](https://www.figma.com/file/eF0LUOAPQO5dmVqw45Xxxo/EduMath?node-id=0%3A1)

### Tecnologias a serem utilizadas

- Injeção de dependências
    - Modular
- Gerência de estado
    - Mobx
    - SetState
- Banco de dados
    - No Sql - Firebase firestore
- Dados locais
    - SharedPreferences
- Geração de arquivos CLI
    - Slidy

### CI/CD e Testes automatizados

- [x]  Github Actions
    - Pull request para as branches master e developer
- Fazer testes locais
- [x]  Seguir o Gitflow
    - Branch master para versão estável
    - Branch Developer para desenvolvimento
    - Criar branch para cada feature
        - Ex: "feature/login"
    - Fazer Merge e excluir a branch quando concluída

### Models / Entidades da Aplicação

- User
    - id
    - name
    - email
    - photo url
    - metrics
- Questions
    - categorie
    - description
    - anwers

 

---

### Funcionalidades da aplicação

- [x]  Fazer login com google
- [ ]  Fazer logout
- [ ]  Selecionar categoria
- [ ]  Responder os desafios
- [ ]  Assistir vídeo de correções
- [ ]  Ver métricas por categoria no perfil
- [ ]  Baixar listar de questões
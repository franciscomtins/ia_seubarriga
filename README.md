# ia_seubarriga
<h1 align="center"> Bootcamp IA - Projeto Final - Grupo QualiDreams</h1>


![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)


### 📝 Descrição do Projeto ###

#### 1.	Planejamento: ####
*	Criar um Planejamento de testes que contenha o objetivo destes testes (manual e automatizadas);
*	Definição de prioridade que cada um desses cenários tem, avaliando a severidade (Probabilidade x Impacto) de um bug ocorrer;

#### 2.	Execução: ####
*	Automatizar a execução dos cenários acima;
*	Para os testes não automatizados, criar um registro de execução manual que contenha: Título do cenário, Evidências do resultado e Resultado (Passou ou Falhou).

### Estrutura do Projeto
```bash
ia_seubarriga/
├─ datamodels/
│  ├─ contas.json
│  ├─ movimentacoes.json
│  ├─ movimentacoes_falha.json
│  ├─ resumo_mensal.json
├─ page_objects/
│  ├─ contas_keywords.robot
│  ├─ dependencias.robot
│  ├─ login_keywords.robot
│  ├─ movimentacoes_keywords.robot
│  ├─ preparacoes_ambiente.robot
├─ testes/
│  ├─ 1__login/
│  │  ├─ 1__login_com_sucesso.robot
│  │  ├─ 2__login_com_falha.robot
│  ├─ 2__contas/
│  │  ├─ 1__cadastro_contas_com_sucesso.robot
│  │  ├─ 2__cadastro_contas_com_falha.robot
│  │  ├─ 3__editar_contas.robot
│  │  ├─ 4__exclusao_contas.robot
│  ├─ 3__movimentacoes/
│  │  ├─ 1__realizar_movimentacoes_com_sucesso.robot
│  │  ├─ 2__realizar_movimentacoes_com_falha.robot
│  ├─ 4__resumo_mensal/
│  │  ├─ 1__Validacao_resumo_mensal.robot	
│  ├─ requirements.txt
├─ .gitignore
├─ README.md
```

### Dados
O projeto realiza a leitura de dados de arquivos json.Por não termos tido acesso ao banco de dados real da aplicação, foi decidido usar arquivos json como mock para validarmos os registros das entidades e operações realizadas sobre elas.

### Page
O projeto usa o modelo Page Object para capturar todos componentes relevantes da UI e funcionalidades da página web. 

### 🛠️ Tecnologias ###
A automação de testes será realizada com Robotframwork. Para auxiliar no processo de automação, serão importadas as seguintes bibliotecas: 

*	**Browser:** Principal responsável pelas Keywords usadas na automação;
*	**FakerLibrary:** Usada na geração de dados “fakes” durante o processo de teste;
*	**OperatingSystem:** permite que várias tarefas relacionadas ao sistema operacional sejam executadas. 


### 🔗 Referências ###
* [Robot Framework - Instalação Library Browser](https://github.com/MarketSquare/robotframework-browser)
* [Library Browser - Keywords](https://marketsquare.github.io/robotframework-browser/Browser.html)
* [Library OperatingSystem - Keywords](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
* [Robot Framework - Instalação FakerLibrary](https://pypi.org/project/robotframework-faker)




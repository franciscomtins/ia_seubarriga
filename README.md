# ia_seubarriga
<h1 align="center"> Bootcamp IA - Projeto Final - Grupo QualiDreams</h1>


![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)


### 📝 Descrição do Projeto ###

* Foi Criado um Planejamento de testes, contendo o objetivo destes testes (manual e automatizadas);
* Os testes foram classificados enquanto sua prioridade e severidade (Probabilidade x Impacto) de um bug ocorrer;
* Para os testes automatizados considerados como prioritários foi adicionado a ` tag smoke`;
* A suíte automatizada atualmente cobre 9 cenários de testes, com 16 casos de testes, dos quais 02 casos estão sendo reprovados, pois o sistema apresenta comportamento inadequado. 

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

### Dados ### 
O projeto realiza a leitura de dados de arquivos json. Por não termos tido acesso ao banco de dados real da aplicação, foi decidido usar arquivos json como mock para validarmos os registros das entidades e operações realizadas sobre elas.

### Page ### 
O projeto usa o modelo Page Object para capturar todos componentes relevantes da UI e funcionalidades da página web. 

### 🛠️ Tecnologias ###
A automação de testes será realizada com Robotframwork. Para auxiliar no processo de automação, serão importadas as seguintes bibliotecas: 

* **Browser:** Principal responsável pelas Keywords usadas na automação;
* **FakerLibrary:** Usada na geração de dados aleatórios durante o processo de teste;
* **OperatingSystem:** permite que várias tarefas relacionadas ao sistema operacional sejam executadas. 


### 🚩 Preparação para executar a suíte ###  
* Para execução da suíte, entende-se que o `Python`, `Robot Framework` e as dependências do `Node.js` estão devidamente instalados; 
* Instalar o arquivo requirements contido na pasta `\SeuBarriga\testes`, com a instrução `pip install -r requirements.txt`;
* Antes de executar a suíte de testes, iniciar a library Browser com a instrução: `rfbrowser init`;
* Se a rfbrowser não for encontrada, tente: `python -m Browser.entry init`.


### 💡 Execução: ###

* Para executar ou não como headless basta alterar a variável `${HEADLESS}` do arquivo `dependencias.robot` como `True` ou `False`;
* Usuário padrão para acesso poderá ser alterado no arquivo “dependencias.robot”, nas variáveis: `${USUARIO_VALIDO}` e `${SENHA_VALIDA}`;
* Para executar todo a suíte de teste, deve ser executada a instrução `robot -d .\results\ .\testes\`, a partir do diretório `\bck_seu_barriga\`. A pasta `.\results\`, caso não exista, será criada automaticamente e nesta serão armazenados os logs da execução da suíte;
* Para executar um caso de teste específico, este deverá ser declarado na execução, por exemplo, caso deseje executar apenas o cenário de login com sucesso: ` robot -d .\results\ .\testes\1__login\1__login_com_sucesso.robot`;
* Para executar os testes considerados como prioritários, deverá ser executada a instrução ` robot -i smoke -d .\results\ .\testes\`.


### 🧑‍💻 A Library Browser foi escolhida por quê? ###
* Para realizar testes web, retira a necessidade da instalação dos drives dos browsers; 
* Visibilidade: A Library Browser utiliza a tecnologia baseada em JavaScript chamada Playwright, conectando-se diretamente com à API do navegador e tem o controle total do navegador e de seu conteúdo. O navegador também tem acesso ao tráfego de rede entre a página e o servidor e dá ao usuário a possibilidade de interagir com o servidor por meio de chamadas HTTP na mesma sessão do navegador;  
* Velocidade: A Library Browser é rápida! Com a API direta para os navegadores, projetada para testes de alto desempenho, o feedback rápido é limitado apenas pela velocidade do objetivo de teste. Com seu conceito inovador de contexto, uma sessão limpa do navegador é iniciada em menos de 10 milissegundos;
* Confiabilidade: A Browser Library espera automaticamente pelos elementos da página e interage com seus quando estão prontos para integração. Os flaky tests são drasticamente reduzidos e a confiança na automação do teste aumenta. 


### 🔗 Referências ###
* [Robot Framework - Instalação Library Browser](https://github.com/MarketSquare/robotframework-browser)
* [Library Browser - Keywords](https://marketsquare.github.io/robotframework-browser/Browser.html)
* [Library OperatingSystem - Keywords](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
* [Robot Framework - Instalação FakerLibrary](https://pypi.org/project/robotframework-faker)

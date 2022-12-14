# ia_seubarriga
<h1 align="center"> Bootcamp IA - Projeto Final - Grupo QualiDreams</h1>


![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)


### π DescriΓ§Γ£o do Projeto ###

* Foi Criado um Planejamento de testes, contendo o objetivo destes testes (manual e automatizadas);
* Os testes foram classificados enquanto sua prioridade e severidade (Probabilidade x Impacto) de um bug ocorrer;
* Para os testes automatizados considerados como prioritΓ‘rios foi adicionado a ` tag smoke`;
* A suΓ­te automatizada atualmente cobre 9 cenΓ‘rios de testes, com 16 casos de testes, dos quais 02 casos estΓ£o sendo reprovados, pois o sistema apresenta comportamento inadequado. 

### Estrutura do Projeto
```bash
ia_seubarriga/
ββ datamodels/
β  ββ contas.json
β  ββ movimentacoes.json
β  ββ movimentacoes_falha.json
β  ββ resumo_mensal.json
ββ page_objects/
β  ββ contas_keywords.robot
β  ββ dependencias.robot
β  ββ login_keywords.robot
β  ββ movimentacoes_keywords.robot
β  ββ preparacoes_ambiente.robot
ββ testes/
β  ββ 1__Login/
β  β  ββ 1__login_com_sucesso.robot
β  β  ββ 2__login_com_falha.robot
β  ββ 2__Contas/
β  β  ββ 1__cadastro_contas_com_sucesso.robot
β  β  ββ 2__cadastro_contas_com_falha.robot
β  β  ββ 3__editar_contas.robot
β  β  ββ 4__exclusao_contas.robot
β  ββ 3__Movimentacoes/
β  β  ββ 1__realizar_movimentacoes_com_sucesso.robot
β  β  ββ 2__realizar_movimentacoes_com_falha.robot
β  ββ 4__Resumo_Mensal/
β  β  ββ 1__Validacao_resumo_mensal.robot
β  ββ 5__Home/
β  β  ββ 1__validacao_home.robot	
β  ββ requirements.txt
ββ .gitignore
ββ README.md
```

### Dados ### 
O projeto realiza a leitura de dados de arquivos json. Por nΓ£o termos tido acesso ao banco de dados real da aplicaΓ§Γ£o, foi decidido usar arquivos json como mock para validarmos os registros das entidades e operaΓ§Γ΅es realizadas sobre elas.

### Page ### 
O projeto usa o modelo Page Object para capturar todos componentes relevantes da UI e funcionalidades da pΓ‘gina web. 

### π οΈ Tecnologias ###
A automaΓ§Γ£o de testes serΓ‘ realizada com Robotframwork. Para auxiliar no processo de automaΓ§Γ£o, serΓ£o importadas as seguintes bibliotecas: 

* **Browser:** Principal responsΓ‘vel pelas Keywords usadas na automaΓ§Γ£o;
* **FakerLibrary:** Usada na geraΓ§Γ£o de dados aleatΓ³rios durante o processo de teste;
* **OperatingSystem:** permite que vΓ‘rias tarefas relacionadas ao sistema operacional sejam executadas. 


### π© PreparaΓ§Γ£o para executar a suΓ­te ###  
* Para execuΓ§Γ£o da suΓ­te, entende-se que o `Python`, `Robot Framework` e as dependΓͺncias do `Node.js` estΓ£o devidamente instalados; 
* Instalar o arquivo requirements contido na pasta `\SeuBarriga\testes`, com a instruΓ§Γ£o `pip install -r requirements.txt`;
* Antes de executar a suΓ­te de testes, iniciar a library Browser com a instruΓ§Γ£o: `rfbrowser init`;
* Se a rfbrowser nΓ£o for encontrada, tente: `python -m Browser.entry init`.


### π‘ ExecuΓ§Γ£o: ###

* Para executar ou nΓ£o como headless basta alterar a variΓ‘vel `${HEADLESS}` do arquivo `dependencias.robot` como `True` ou `False`;
* UsuΓ‘rio padrΓ£o para acesso poderΓ‘ ser alterado no arquivo βdependencias.robotβ, nas variΓ‘veis: `${USUARIO_VALIDO}` e `${SENHA_VALIDA}`;
* Para executar todo a suΓ­te de teste, deve ser executada a instruΓ§Γ£o `robot -d .\results\ .\testes\`, a partir do diretΓ³rio `\bck_seu_barriga\`. A pasta `.\results\`, caso nΓ£o exista, serΓ‘ criada automaticamente e nesta serΓ£o armazenados os logs da execuΓ§Γ£o da suΓ­te;
* Para executar um caso de teste especΓ­fico, este deverΓ‘ ser declarado na execuΓ§Γ£o, por exemplo, caso deseje executar apenas o cenΓ‘rio de login com sucesso: ` robot -d .\results\ .\testes\1__login\1__login_com_sucesso.robot`;
* Para executar os testes considerados como prioritΓ‘rios, deverΓ‘ ser executada a instruΓ§Γ£o ` robot -i smoke -d .\results\ .\testes\`.


### π§βπ» A Library Browser foi escolhida por quΓͺ? ###
* Para realizar testes web, retira a necessidade da instalaΓ§Γ£o dos drives dos browsers; 
* Visibilidade: A Library Browser utiliza a tecnologia baseada em JavaScript chamada Playwright, conectando-se diretamente com Γ  API do navegador e tem o controle total do navegador e de seu conteΓΊdo. O navegador tambΓ©m tem acesso ao trΓ‘fego de rede entre a pΓ‘gina e o servidor e dΓ‘ ao usuΓ‘rio a possibilidade de interagir com o servidor por meio de chamadas HTTP na mesma sessΓ£o do navegador;  
* Velocidade: A Library Browser Γ© rΓ‘pida! Com a API direta para os navegadores, projetada para testes de alto desempenho, o feedback rΓ‘pido Γ© limitado apenas pela velocidade do objetivo de teste. Com seu conceito inovador de contexto, uma sessΓ£o limpa do navegador Γ© iniciada em menos de 10 milissegundos;
* Confiabilidade: A Browser Library espera automaticamente pelos elementos da pΓ‘gina e interage com seus quando estΓ£o prontos para integraΓ§Γ£o. Os flaky tests sΓ£o drasticamente reduzidos e a confianΓ§a na automaΓ§Γ£o do teste aumenta. 


### π ReferΓͺncias ###
* [Robot Framework - InstalaΓ§Γ£o Library Browser](https://github.com/MarketSquare/robotframework-browser)
* [Library Browser - Keywords](https://marketsquare.github.io/robotframework-browser/Browser.html)
* [Library OperatingSystem - Keywords](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
* [Robot Framework - InstalaΓ§Γ£o FakerLibrary](https://pypi.org/project/robotframework-faker)


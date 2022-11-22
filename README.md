# ia_seubarriga
<h1 align="center"> Bootcamp IA - Desafio intermediário - Automação de Testes</h1>


![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)


### 📝 Descrição do Projeto ###

#### 1.	Planejamento: ####
*	Criar um Planejamento de testes que contenha o objetivo destes testes (manual e automatizadas);
*	Definição de prioridade que cada um desses cenários tem, avaliando a severidade (Probabilidade x Impacto) de um bug ocorrer;


#### 2.	Execução: ####
*	Automatizar a execução dos cenários acima;
*	Para os testes não automatizados, criar um registro de execução manual que contenha: Título do cenário, Evidências do resultado e Resultado (Passou ou Falhou).
* Para executar ou não como headless basta alterar a variável “${HEADLESS}” do arquivo “dependencias.robot” como true ou false;
* Usuário padrão para acesso poderá ser alterado no arquivo “dependencias.robot”, nas variáveis: ${USUARIO_VALIDO} e ${SENHA_VALIDA}


### 🛠️ Tecnologias ###
A automação de testes será realizada com Robotframwork. Para auxiliar no processo de automação, serão importadas as seguintes bibliotecas: 

*	**Browser:** Principal responsável pelas Keywords usadas na automação;
*	**FakerLibrary:** Usada na geração de dados “fakes” durante o processo de teste;
*	**OperatingSystem:** permite que várias tarefas relacionadas ao sistema operacional sejam executadas. 


### 🚩 Preparação para executar a suíte ###  
* Instalar o pacote do Node.js, pois a Library Browser usa. 
* Pode instalar baixando o instalador: https://nodejs.org/pt-br/#home-downloadhead
* Ou usando Chocolatey: cinst nodejs.install
* Ou usando Scoop: scoop install nodejs
* Instalar o arquivo requirements contido na pasta “\SeuBarriga\testes”
* Antes de executar a suíte de testes, iniciar a library Browser com a instrução: rfbrowser init
* Se a rfbrowser não for encontrada, tente: python -m Browser.entry init


### 🧑‍💻 A Library Browser foi escolhida por quê? ###
* Para realizar testes web, retira a necessidade da instalação dos drives dos browsers. 
* Visibilidade: A Library Browser utiliza a tecnologia baseada em JavaScript chamada Playwright, conectando-se diretamente com à API do navegador e tem o controle total do navegador e de seu conteúdo. O navegador também tem acesso ao tráfego de rede entre a página e o servidor e dá ao usuário a possibilidade de interagir com o servidor por meio de chamadas HTTP na mesma sessão do navegador.  
* Velocidade: A Library Browser é rápida! Com a API direta para os navegadores, projetada para testes de alto desempenho, o feedback rápido é limitado apenas pela velocidade do objetivo de teste. Com seu conceito inovador de contexto, uma sessão limpa do navegador é iniciada em menos de 10 milissegundos!
* Confiabilidade: A Browser Library espera automaticamente pelos elementos da página e interage com seus quando estão prontos para integração. Os flaky tests são drasticamente reduzidos e a confiança na automação do teste aumenta. 


### 🔗 Referências ###
* [Robot Framework - Instalação Library Browser](https://github.com/MarketSquare/robotframework-browser)
* [Library Browser - Keywords](https://marketsquare.github.io/robotframework-browser/Browser.html)
* [Library OperatingSystem - Keywords](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
* [Robot Framework - Instalação FakerLibrary](https://pypi.org/project/robotframework-faker)

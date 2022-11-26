# ia_seubarriga
<h1 align="center"> Bootcamp IA - Desafio intermediário - Automação de Testes</h1>


![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)


### 📝 Descrição do Projeto ###

* Foi Criado um Planejamento de testes, contendo o objetivo destes testes (manual e automatizadas);
* Os testes foram classificados enquanto sua prioridade e severidade (Probabilidade x Impacto) de um bug ocorrer;
* Para os testes automatizados considerados como prioritários foi adicionado a ` tag smoke`;
* A suíte automatizada atualmente cobre 9 cenários de testes, com 16 casos de testes, dos quais 02 casos estão sendo reprovados, pois o sistema apresenta comportamento inadequado. 


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

* Para executar ou não como headless basta alterar a variável `${HEADLESS}` do arquivo `dependencias.robot` como true ou false;
* Usuário padrão para acesso poderá ser alterado no arquivo “dependencias.robot”, nas variáveis: `${USUARIO_VALIDO}` e `${SENHA_VALIDA}`;
* Para executar todo a suíte de teste, deve ser executada a instrução `robot -d .\results\ .\testes\`, a partir do diretório `\bck_seu_barriga\`. A pasta `.\results\`, caso não exista, será criada automaticamente e nesta serão armazenados os logs da execução da suíte;
* Para executar um caso de teste específico, este deverá ser declarado na execução, por exemplo, caso deseje executar apenas o cenário de login com sucesso: ` robot -d .\results\ .\testes\1__login\1__login_com_sucesso.robot`;
* Para executar os testes considerados como prioritários, deverá ser executada a instrução ` robot -i smoke -d .\results\ .\testes\1__login\1__login_com_sucesso.robot`.


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


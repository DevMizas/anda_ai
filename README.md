🏃‍♂️ Anda Aí — Smart Step Counter
Anda Aí é um aplicativo de contador de passos desenvolvido em Flutter, criado para ser leve, funcional e resiliente, garantindo o acompanhamento da atividade física mesmo em cenários onde o dispositivo não possui sensor interno de passos.
O aplicativo realiza uma checagem automática de hardware para identificar se o smartphone possui sensor nativo.
Caso não possua, o app se conecta via Bluetooth Low Energy (BLE) a um smartwatch, permitindo a leitura dos dados em tempo real, de forma transparente para o usuário.
🚀 Funcionalidades
Detecção automática de sensor de passos no smartphone
Fallback inteligente para smartwatch via BLE
Leitura de dados de passos em tempo real
Conexão e reconexão automática com dispositivos BLE
Interface simples, objetiva e focada em usabilidade
Experiência contínua independentemente do hardware disponível
🛠️ Tecnologias Utilizadas
Flutter — desenvolvimento multiplataforma
Dart — linguagem principal
FlutterBluePlus — comunicação Bluetooth Low Energy (BLE)
MobX — gerenciamento de estado reativo
GetIt — injeção de dependências
Arquitetura MVVM — separação de responsabilidades e escalabilidade
🧠 Arquitetura
O projeto foi estruturado seguindo o padrão MVVM (Model–View–ViewModel), com separação clara entre camadas de apresentação, domínio e infraestrutura:
core/         → regras de negócio e abstrações
infra/        → integrações externas (BLE, sensores)
models/       → modelos de dados
presentation/ → views e viewmodels
main.dart     → bootstrap da aplicação
Essa organização facilita manutenção, testabilidade e evolução do projeto.
🧩 Desafios Técnicos
O smartwatch utilizado no projeto era genérico e sem documentação oficial, exigindo análise manual dos pacotes BLE, engenharia reversa e interpretação de dados brutos.
Implementação de uma transição fluida entre:
sensor interno do celular
leitura via smartwatch
Superação de limitações do protocolo BLE:
estabilidade de conexão
gerenciamento de MTU
confiabilidade na transmissão
🎯 Objetivo do Projeto
Este projeto foi criado como um estudo prático de integração de hardware via BLE, arquitetura limpa e desenvolvimento de aplicações resilientes, reforçando boas práticas de engenharia de software e experiência do usuário.
👨‍💻 Autor
Mizael Eduardo dos Santos
Flutter Developer
LinkedIn: https://linkedin.com/in/mizael-santos-709aa41a4

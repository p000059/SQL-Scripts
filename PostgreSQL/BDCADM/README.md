<html>
  <body>
    <h1>Regras para o banco BDCAM - Banco de controle Administrativo</h1>
    <p>1 - O banco possui um total de 17 tabelas, sendo: </p>
    <ul>
      <li>6(seis) tabelas relacionais</li>
      <li>4(quatro) tabelas de domínio</li>
      <li>7(sete) tabelas específicas</li>      
    </ul>
    <p>2 - O banco possui uma tabela de pessoa e outra de usuário que podem estar ou não relacionadas</p>
    <p>3 - As 4(quatro) tabelas de domínio são: </p>
    <ul>
      <li>Sexo</li>
      <li>Tipos de Pessoas -> type_persons</li>
      <li>Tipos de Usuários -> type_users</li>
      <li>Tipos de Cargos -> type_positions</li>
    </ul>
    <p>4 - As 6(seis) tabelas relacionais são:</p>
    <ul>
      <li>Pessoa / Endereço -> rl_persons_adress</li>
      <li>Pessoa / Usuário -> rl_persons_users</li>
      <li>Pessoa / Documentos -> rl_persons_documents</li>
      <li>Usuários / Cargo -> rl_users_positions</li>
      <li>Usuários / Férias -> rl_users_vacation</li>
      <li>Cargo / Salarios -> rl_positions_salaries</li>
    </ul>
    <p>5 - As 7(sete) tableas específicas são:</p>
    <ul>
      <li>Endereço -> adresses</li>
      <li>Pessoas -> persons</li>
      <li>Documentos -> documents</li>
      <li>Usuários -> users</li>
      <li>Férias -> vacations</li>
      <li>Caros -> positions</li>
      <li>Salários -> salaries</li>
    </ul>
    <p>6 - O cadastro de tipo de pessoa está relacionado com a tabela documents, pois a definição do tipo de pessoa possui a regulação específica para o tipo de documento se CPF ou CNPJ.</p>
    <p>7 - A tabela users se relaciona com a tabela cargo</p>
    <p>8 - O tipo de usuário é definido em relação ao acesso ao domínio e aos sistemas, ou seja, trata-se de perfil de acesso. Para a tabela users, trata-se da identificação de código de usuário, seguindo um exemplo:</p>
    <ul>
      <li>f000077 -> identificação de usuário, com perfil de tipo de acesso ao domínio em "type_user = usuário comum no domínio".</li>
      <li>f000077 -> identificação de usuário, com perfil de tipo de acesso ao domínio em "type_user = administrador local do ativo de rede."</li>
    </ul>
    <p>9 - O cargo tem sua definição própria e o seu tipo na tabela type_positions que pode ser uma atribuição específica, como exemplo abaixo:</p>
    <ul>
      <li>Gerente Executivo -> gestor da coordenação.</li>
      <li>Gerente de Setor -> gestor de uma área subalterna a uma coordenação.</li>      
    </ul>
    <p>10 - O valor do salário correlaciona-se com a tabela positions, que se refere aos cargos.</p>
    <p>11 - Um usuário cadastrado deve ser um empregrado efetivo, empregado terceirizado, estagiário ou empregado temporário.</p>
    <p>12 - Para as férias, a relação está diretamente ligada ao usuário do sistema, pois o usuário deve atender ao tópico 10. </p>
    <p>13 - Para cálculo de férias, o sistema usa como parâmetro o registro na tabela users.</p>
  </body>
</html>

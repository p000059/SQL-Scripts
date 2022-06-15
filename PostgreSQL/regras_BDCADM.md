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
    <p>6 - O cadastro de tipo de pessoa está relacionado a documents, pois a definição do tipo de pessoa possui a regulação</p>
  </body>
</html>
